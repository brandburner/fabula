import re
import json
import argparse
import requests
from bs4 import BeautifulSoup
from dataclasses import dataclass
from typing import List, Optional, Dict, Any
from datetime import datetime

# ----------------------------- Updated Script Parser -----------------------------
class ScriptParser:
    """Parser for converting TV scripts into a structured JSON format."""

    def __init__(self, text: str):
        self.text = text.replace('\r', '')  # Normalize line endings
        self.debug = False
        self.character_names = set()
        self.soup = BeautifulSoup(self.text, 'html.parser')
        self.current_scene = None
        self.current_scene_dialogue = []
        self.movie_format = False
        
        # Detect if this is a movie format (different HTML structure)
        if "Movie Transcripts" in self.text or "movie transcripts" in self.text.lower():
            self.movie_format = True
        
        # Initial pass to collect character names
        for p in self.soup.find_all('p'):
            if p.find('font') or (self.movie_format and p.text.strip()):
                text = p.get_text()
                # Include apostrophes in character names
                match = re.match(r'^([A-Z][A-Z0-9 \'\[\]]+)(?:\s*\[([^\]]+)\])?(?:\s*\(([^)]+)\))?\s*:', text)
                if match:
                    self.character_names.add(match.group(1).strip())
                # For movie format, also check for character names in ALL CAPS followed by dialog
                elif self.movie_format:
                    # Movie format often has character names in ALL CAPS
                    movie_match = re.match(r'^([A-Z][A-Z0-9 \'\-]+)(?:\s*\(([^)]+)\))?\s*: (.+)', text)
                    if movie_match:
                        self.character_names.add(movie_match.group(1).strip())

        # Extend character names to include numbered variations
        numbered_chars = set()
        for name in self.character_names:
            base_match = re.match(r'^(.*?)\s*\d+$', name)
            if base_match:
                base_name = base_match.group(1)
                for i in range(1, 10):
                    numbered_chars.add(f"{base_name} {i}")
        self.character_names.update(numbered_chars)
        
        if self.debug:
            print("Detected character names:", sorted(list(self.character_names)))
            if self.movie_format:
                print("Detected movie format transcript")

    def log(self, *args) -> None:
        """Print debug logs if debug mode is enabled."""
        if self.debug:
            print(*args)

    def clean_html_text(self, text: str) -> str:
        """Clean HTML text by removing tags and normalizing whitespace."""
        # Remove HTML tags except line breaks
        text = re.sub(r'<(?!br\s*/?>)[^>]+>', '', text)
        # Convert <br> and <br/> to spaces
        text = re.sub(r'<br\s*/?>', ' ', text)
        # Remove multiple spaces/newlines
        text = re.sub(r'\s+', ' ', text)
        return text.strip()
    
    def parse_header(self) -> Dict[str, Any]:
        """Parse header information (title, airdate, notes) from the script."""
        header_info = {
            'title': '',
            'airdate': '',
            'notes': []
        }
    
        # Find title (in blue font)
        title_font = self.soup.find('font', attrs={'color': '#2867d0'}) or self.soup.find('font', attrs={'color': '#2867D0'})
        if title_font:
            if title_font.b:
                header_info['title'] = self.clean_html_text(title_font.b.string or title_font.b.get_text())
            else:
                header_info['title'] = self.clean_html_text(title_font.get_text())
    
        # Find airdate with more flexible pattern matching
        airdate_text = None
        for tag in self.soup.find_all(['p', 'font']):
            tag_text = tag.get_text()
            if 'Stardate:' in tag_text:
                airdate_text = tag_text
                break
            
        if airdate_text:
            # Try to extract an airdate in different formats
            airdate_match = re.search(r'Original Airdate:\s*(\d+)\s+([A-Za-z]+),\s+(\d{4})', airdate_text)
            if airdate_match:
                day = airdate_match.group(1)
                month = airdate_match.group(2)
                year = airdate_match.group(3)
                month_map = {
                    'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04',
                    'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08',
                    'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
                }
                month_num = month_map.get(month[:3], '01')
                header_info['airdate'] = f"{year}-{month_num}-{day.zfill(2)}"
            else:
                # Try for just a year format
                year_match = re.search(r'(\d{4})', airdate_text)
                if year_match:
                    header_info['airdate'] = year_match.group(1)
    
        return header_info

    def clean_text(self, text: str) -> str:
        """Clean text by removing HTML and normalizing whitespace."""
        # Remove HTML tags
        text = re.sub(r'<[^>]+>', '', text)
        # Remove multiple spaces/newlines
        text = re.sub(r'\s+', ' ', text)
        # Remove back to episode listing and copyright notice
        text = re.sub(r'Back to the episode listing.*$', '', text, flags=re.DOTALL)
        return text.strip()

    def parse_dialogue_line(self, text: str) -> List[Dict[str, Any]]:
        """Parse a block of text into dialogue and stage directions."""
        dialogue_lines = []
        text = self.clean_text(text)
        
        # Skip scene headings in square brackets that match scene names
        scene_match = re.match(r'\[(.*?)\]', text)
        if scene_match and scene_match.group(1).strip() == self.current_scene:
            return []
            
        # Handle stage directions in square brackets
        stage_match = re.match(r'\[(.*?)\](.*)', text)
        if stage_match:
            stage_direction = stage_match.group(1).strip()
            if stage_direction and not any(stage_direction.startswith(x) for x in ('OC', 'VO')):
                dialogue_lines.append({
                    "Stage Direction": stage_direction
                })
            text = stage_match.group(2)
            
        # Handle stage directions in parentheses at start of line  
        paren_match = re.match(r'^\s*\((.*?)\)(.*)', text)
        if paren_match:
            stage_direction = paren_match.group(1).strip()
            if stage_direction:
                dialogue_lines.append({
                    "Stage Direction": stage_direction
                })
            text = paren_match.group(2)
            
        # Process text line by line
        current_char = None
        current_line = ''
        
        if self.movie_format:
            # Movie format often has character: dialog on a single line
            movie_match = re.match(r'^([A-Z][A-Z0-9 \'\-]+)(?:\s*\(([^)]+)\))?\s*: (.+)', text)
            if movie_match:
                char_name = movie_match.group(1).strip()
                dialog = movie_match.group(3).strip()
                
                # Process stage directions within dialog
                stage_parts = re.split(r'(\([^)]+\))', dialog)
                for i, stage_part in enumerate(stage_parts):
                    if i % 2 == 0:  # Even indices contain dialog
                        if stage_part.strip():
                            dialogue_lines.append({
                                "Character": char_name,
                                "Line": stage_part.strip()
                            })
                    else:  # Odd indices contain stage directions
                        dialogue_lines.append({
                            "Stage Direction": stage_part[1:-1].strip()
                        })
                
                return dialogue_lines
        
        # Split on character name patterns (with apostrophes)
        parts = re.split(r'([A-Z][A-Z0-9 \'\[\]]+(?:\s*\[[^\]]+\])?\s*:)', text)
        
        for part in parts:
            # Check if this part is a character name (include apostrophes)
            char_match = re.match(r'([A-Z][A-Z0-9 \'\[\]]+)(?:\s*\[([^\]]+)\])?\s*:', part)
            if char_match:
                # If we have accumulated dialogue, add it
                if current_char and current_line:
                    dialogue_lines.extend(self.process_dialogue(current_char, current_line))
                current_char = char_match.group(1).strip()
                current_line = ''
            else:
                # Check for inline stage directions
                stage_parts = re.split(r'(\([^)]+\))', part)
                for stage_part in stage_parts:
                    if stage_part.startswith('(') and stage_part.endswith(')'):
                        if current_char and current_line.strip():
                            dialogue_lines.extend(self.process_dialogue(current_char, current_line))
                            current_line = ''
                        dialogue_lines.append({
                            "Stage Direction": stage_part[1:-1].strip()
                        })
                    else:
                        current_line += stage_part
        
        # Add any remaining dialogue
        if current_char and current_line:
            dialogue_lines.extend(self.process_dialogue(current_char, current_line))
            
        return dialogue_lines
        
    def process_dialogue(self, character: str, text: str) -> List[Dict[str, Any]]:
        """Process a single character's dialogue, handling stage directions."""
        lines = []
        text = text.strip()
        
        # Split on stage directions
        parts = re.split(r'\((.*?)\)', text)
        
        # Process each part
        for i, part in enumerate(parts):
            if i % 2 == 0:  # Even indices are dialogue
                if part.strip():
                    lines.append({
                        "Character": character,
                        "Line": part.strip()
                    })
            else:  # Odd indices are stage directions
                if part.strip():
                    lines.append({
                        "Stage Direction": part.strip()
                    })
                
        return lines

    def process_scene(self, scene_name: str, content: str) -> Optional[Dict[str, Any]]:
        """Process a scene and its content."""
        # Skip OC/VO scenes as they're part of the previous scene
        if scene_name in ('OC', 'VO'):
            if self.current_scene:
                dialogue_lines = self.parse_dialogue_line(content)
                self.current_scene_dialogue.extend(dialogue_lines)
            return None
            
        # If we have a previous scene, return it
        previous_scene = None
        if self.current_scene:
            previous_scene = {
                "Scene": self.current_scene,
                "Dialogue": self.current_scene_dialogue
            }
            
        # Start new scene
        self.current_scene = scene_name
        self.current_scene_dialogue = []
        
        # Parse the content
        dialogue_lines = self.parse_dialogue_line(content)
        if dialogue_lines:
            self.current_scene_dialogue.extend(dialogue_lines)
        
        return previous_scene

    def parse_movie_format(self) -> Dict[str, Any]:
        """Parse a movie script with different format."""
        header_info = self.parse_header()
        
        # For movies, we'll treat the whole thing as one episode
        scenes = []
        current_scene = None
        current_dialogue = []
        
        # Find all paragraphs in the body content
        content_area = self.soup.find('table')
        if not content_area:
            # Try to find the content by looking at the structure
            body_content = self.soup.find('body')
            paragraphs = body_content.find_all('p')
        else:
            paragraphs = content_area.find_all('p')
        
        for p in paragraphs:
            text = p.get_text().strip()
            if not text:
                continue
                
            # Look for scene headings in bold or brackets
            scene_match = False
            if p.b:
                bold_text = p.b.get_text().strip()
                if bold_text.startswith('[') and bold_text.endswith(']'):
                    scene_name = bold_text[1:-1].strip()
                    scene_match = True
                    self.log(f"Found scene: [{scene_name}]")
                elif re.match(r'^\[.*?\]$', bold_text):
                    scene_name = bold_text[1:-1].strip()
                    scene_match = True
                    self.log(f"Found scene: [{scene_name}]")
            
            # Also check for scene headings in brackets without bold
            if not scene_match and re.match(r'^\s*\[.*?\]\s*$', text):
                scene_name = text[1:-1].strip()
                scene_match = True
                self.log(f"Found scene: [{scene_name}]")
                
            if scene_match:
                # Save previous scene if it exists
                if current_scene and current_dialogue:
                    scenes.append({
                        "Scene": current_scene,
                        "Dialogue": current_dialogue
                    })
                
                # Start new scene
                current_scene = scene_name
                current_dialogue = []
            else:
                # Parse dialogue - we need to handle the movie format differently
                if current_scene is not None:  # Only parse dialogue if we have a scene
                    # For movie format, we need to split by character names in uppercase
                    char_pattern = r'([A-Z][A-Z\'\- ]+)(?:\s*\([^)]+\))?\s*:'
                    
                    # Check if this paragraph contains dialogue with character names
                    dialogue_parts = re.split(f'({char_pattern})', text)
                    
                    # If we found character names, process them
                    if len(dialogue_parts) > 1:
                        i = 0
                        while i < len(dialogue_parts):
                            if i+2 < len(dialogue_parts) and re.match(char_pattern, dialogue_parts[i+1]):
                                char_name = re.match(char_pattern, dialogue_parts[i+1]).group(1).strip()
                                char_line = dialogue_parts[i+2].strip()
                                
                                # Handle parenthetical stage directions
                                stage_parts = re.split(r'(\([^)]+\))', char_line)
                                for j, stage_part in enumerate(stage_parts):
                                    if j % 2 == 0:  # Even indices are dialogue
                                        if stage_part.strip():
                                            current_dialogue.append({
                                                "Character": char_name,
                                                "Line": stage_part.strip()
                                            })
                                    else:  # Odd indices are stage directions
                                        current_dialogue.append({
                                            "Stage Direction": stage_part[1:-1].strip()
                                        })
                                i += 3
                            else:
                                # This might be a stage direction or non-dialogue text
                                if dialogue_parts[i].strip() and not re.match(char_pattern, dialogue_parts[i]):
                                    # Check if it's a stage direction in parentheses
                                    if dialogue_parts[i].strip().startswith('(') and dialogue_parts[i].strip().endswith(')'):
                                        current_dialogue.append({
                                            "Stage Direction": dialogue_parts[i].strip()[1:-1].strip()
                                        })
                                    else:
                                        # This could be a continuation of previous dialogue or a stage direction
                                        stage_match = re.match(r'^\s*\((.*?)\)\s*$', dialogue_parts[i])
                                        if stage_match:
                                            current_dialogue.append({
                                                "Stage Direction": stage_match.group(1).strip()
                                            })
                                i += 1
                    else:
                        # This might be a stage direction not tied to a character
                        stage_match = re.match(r'^\s*\((.*?)\)\s*$', text)
                        if stage_match:
                            current_dialogue.append({
                                "Stage Direction": stage_match.group(1).strip()
                            })
        
        # Add the final scene
        if current_scene and current_dialogue:
            scenes.append({
                "Scene": current_scene,
                "Dialogue": current_dialogue
            })
            
        # If no scenes detected but we have dialogue, create a default scene
        if not scenes and current_dialogue:
            scenes.append({
                "Scene": "Main",
                "Dialogue": current_dialogue
            })
            
        return {
            "Story": header_info['title'],
            "Airdate": header_info['airdate'],
            "Episodes": [{
                "Episode": "Movie",
                "Scenes": scenes
            }]
        }

    # And update the parse_header method to better handle stardate format
    def parse_header(self) -> Dict[str, Any]:
        """Parse header information (title, airdate, notes) from the script."""
        header_info = {
            'title': '',
            'airdate': '',
            'notes': []
        }

        # Find title (in blue font)
        title_font = self.soup.find('font', attrs={'color': '#2867d0'}) or self.soup.find('font', attrs={'color': '#2867D0'})
        if title_font:
            if title_font.b:
                header_info['title'] = self.clean_html_text(title_font.b.string or title_font.b.get_text())
            else:
                header_info['title'] = self.clean_html_text(title_font.get_text())

        # Find stardate or airdate with more flexible pattern matching
        for tag in self.soup.find_all(['p', 'font']):
            tag_text = tag.get_text()
            if 'Stardate:' in tag_text:
                stardate_match = re.search(r'Stardate:\s*([\d\.]+)', tag_text)
                if stardate_match:
                    header_info['airdate'] = stardate_match.group(1)
                    
            if 'Original Airdate:' in tag_text:
                airdate_match = re.search(r'Original Airdate:\s*(\d+)\s+([A-Za-z]+),\s+(\d{4})', tag_text)
                if airdate_match:
                    day = airdate_match.group(1)
                    month = airdate_match.group(2)
                    year = airdate_match.group(3)
                    month_map = {
                        'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04',
                        'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08',
                        'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
                    }
                    month_num = month_map.get(month[:3], '01')
                    header_info['airdate'] = f"{year}-{month_num}-{day.zfill(2)}"

        return header_info

    def parse_episode(self, text: str) -> Optional[Dict[str, Any]]:
        """Parse an episode section from the script."""
        # Reset scene tracking
        self.current_scene = None
        self.current_scene_dialogue = []
        
        # Find episode name (e.g., "Part One")
        episode_match = re.search(r'<u><i><b>(Part [^<]+)</b></i></u>', text)
        if not episode_match:
            # Try alternative formats
            episode_match = re.search(r'<b>(Part [^<]+)</b>', text)
            
        if not episode_match:
            # For some scripts, there might not be explicit parts
            episode_name = "Main Episode"
        else:
            episode_name = self.clean_html_text(episode_match.group(1))
        
        # Split content into scenes
        scenes = []
        
        for p in BeautifulSoup(text, 'html.parser').find_all('p'):
            if not p.find('font') and not (self.movie_format and p.text.strip()):
                continue
                
            text = p.get_text().strip()
            if not text:
                continue

            # Check for scene heading
            scene_match = re.match(r'\[(.*?)\]', text)
            if scene_match:
                scene_name = scene_match.group(1).strip()
                scene = self.process_scene(scene_name, text)
                if scene:
                    scenes.append(scene)
            elif p.b and not scene_match:
                # Check if the bold text is a scene heading
                bold_text = p.b.get_text().strip()
                if bold_text.startswith('[') and bold_text.endswith(']'):
                    scene_name = bold_text[1:-1].strip()
                    scene = self.process_scene(scene_name, text)
                    if scene:
                        scenes.append(scene)
                elif self.current_scene:
                    dialogue_lines = self.parse_dialogue_line(text)
                    self.current_scene_dialogue.extend(dialogue_lines)
            elif self.current_scene:
                dialogue_lines = self.parse_dialogue_line(text)
                self.current_scene_dialogue.extend(dialogue_lines)

        # Add the last scene
        if self.current_scene:
            scenes.append({
                "Scene": self.current_scene,
                "Dialogue": self.current_scene_dialogue
            })

        return {
            "Episode": episode_name,
            "Scenes": scenes
        }

    def parse(self) -> Dict[str, Any]:
        """Parse the entire script into a structured dictionary."""
        # Use movie-specific parser for movie format
        if self.movie_format:
            return self.parse_movie_format()
            
        header_info = self.parse_header()

        # Split the text into episodes
        episodes = []
        
        # Find all episode markers
        episode_matches = list(re.finditer(r'<u><i><b>(Part (?:One|Two|Three|Four|1|2|3|4))</b></i></u>', self.text))
        
        # If no episodes found, treat entire text as Part One
        if not episode_matches:
            # Try alternative episode markers
            episode_matches = list(re.finditer(r'<b>(Part (?:One|Two|Three|Four|1|2|3|4))</b>', self.text))
            
        if not episode_matches:
            # Create a Part One marker at the start of content
            episode_text = '<u><i><b>Part One</b></i></u>' + self.text
            episode = self.parse_episode(episode_text)
            if episode:
                episodes.append(episode)
        else:
            # Check if Part One exists
            has_part_one = any(re.search(r'Part (?:One|1)\b', m.group(1)) for m in episode_matches)
            
            # If Part One is missing and there's content before first episode, treat it as Part One
            if not has_part_one and episode_matches[0].start() > 0:
                # Get content before first episode
                part_one_text = '<u><i><b>Part One</b></i></u>' + self.text[:episode_matches[0].start()]
                episode = self.parse_episode(part_one_text)
                if episode:
                    episodes.append(episode)
            
            # Process each marked episode
            for i, match in enumerate(episode_matches):
                start = match.start()
                # End is either the start of next episode or end of text
                end = episode_matches[i + 1].start() if i + 1 < len(episode_matches) else len(self.text)
                episode_text = self.text[start:end]
                episode = self.parse_episode(episode_text)
                if episode:
                    episodes.append(episode)

        return {
            "Story": header_info['title'],
            "Airdate": header_info['airdate'],
            "Episodes": episodes
        }

def fetch_and_extract_transcript(url: str) -> str:
    """Fetch and extract transcript from URL."""
    response = requests.get(url)
    response.raise_for_status()
    return response.text

def main():
    """Main function to parse a TV script from a local file or URL and output JSON."""
    parser = argparse.ArgumentParser(description='Convert TV script to JSON')
    parser.add_argument('input_source', help='Input script file path or URL')
    parser.add_argument('output_file', help='Output JSON file')
    parser.add_argument('--debug', action='store_true', help='Enable debug logging')
    parser.add_argument('--pretty', action='store_true', help='Pretty-print JSON output')
    args = parser.parse_args()

    try:
        # Get input text from file or URL
        if args.input_source.startswith(('http://', 'https://')):
            text = fetch_and_extract_transcript(args.input_source)
        else:
            with open(args.input_source, 'r', encoding='utf-8') as f:
                text = f.read()

        # Parse the script
        parser = ScriptParser(text)
        parser.debug = args.debug
        script_dict = parser.parse()

        # Write output JSON
        with open(args.output_file, 'w', encoding='utf-8') as f:
            if args.pretty:
                json.dump(script_dict, f, indent=2, ensure_ascii=False)
            else:
                json.dump(script_dict, f, ensure_ascii=False)

        print(f'Successfully converted {args.input_source} to {args.output_file}')

    except Exception as e:
        print(f'Error: {str(e)}')
        raise

if __name__ == '__main__':
    main()