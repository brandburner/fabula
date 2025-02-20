#!/usr/bin/env python3
"""
TV Script Parser - HTML scraping and preprocessing version
Designed to support the transcription format at http://www.chakoteya.net/
This script fetches a transcript from a URL (or reads a local file), preprocesses the HTML into a plain-text format,
and then parses it into a structured JSON format.

SAMPLE USAGE: python3 script2json.py http://www.chakoteya.net/DoctorWho/25-4.htm test2.json --pretty

"""

import re
import json
import argparse
import requests
from bs4 import BeautifulSoup
from dataclasses import dataclass
from typing import List, Optional, Dict, Any
from datetime import datetime

# ----------------------------- Data Classes -----------------------------
@dataclass
class DialogueLine:
    """Represents a single line of dialogue or stage direction."""
    type: str                # "Character" or "Stage Direction"
    character: Optional[str] # Character name (None for stage directions)
    character_annotation: Optional[str]  # Character description or role
    line: str                # The actual dialogue or stage direction text

@dataclass
class Scene:
    """Represents a scene in the episode."""
    scene_name: str
    dialogue: List[DialogueLine]

@dataclass
class Episode:
    """Represents a single episode."""
    episode_name: str
    scenes: List[Scene]

@dataclass
class Script:
    """Represents the full script."""
    title: str
    airdate: str
    notes: List[str]         # For transcriber's notes and other metadata
    episodes: List[Episode]

# ----------------------------- Script Parser -----------------------------
class ScriptParser:
    """Parser for converting TV scripts into a structured JSON format."""

    def __init__(self, text: str):
        self.text = text.replace('\r', '')  # Normalize line endings
        self.debug = False
        self.character_names = set()
        self.soup = BeautifulSoup(self.text, 'html.parser')
        self.current_scene = None
        self.current_scene_dialogue = []

        # Preprocess text to collect character names
        for p in self.soup.find_all('p'):
            if p.find('font'):
                text = p.get_text()
                match = re.match(r'^([A-Z][A-Z0-9 \[\]]+)(?:\s*\[([^\]]+)\])?(?:\s*\(([^)]+)\))?\s*:', text)
                if match:
                    self.character_names.add(match.group(1).strip())

        # Extend character names to include numbered variations
        numbered_chars = set()
        for name in self.character_names:
            base_match = re.match(r'^(.*?)\s*\d+$', name)
            if base_match:
                base_name = base_match.group(1)
                for i in range(1, 10):
                    numbered_chars.add(f"{base_name} {i}")
        self.character_names.update(numbered_chars)

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
            title_font = self.soup.find('font', attrs={'color': '#2867d0'})
            if title_font and title_font.b:
                header_info['title'] = self.clean_html_text(title_font.b.string)
    
            # Find airdate
            airdate_text = self.soup.find(string=re.compile(r'Original Airdate:'))
            if airdate_text:
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
            
        # Process text line by line
        current_char = None
        current_line = ''
        
        # Split on character name patterns
        parts = re.split(r'([A-Z][A-Z0-9 \[\]]+(?:\s*\[[^\]]+\])?\s*:)', text)
        
        for part in parts:
            # Check if this part is a character name
            char_match = re.match(r'([A-Z][A-Z0-9 \[\]]+)(?:\s*\[([^\]]+)\])?\s*:', part)
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

    def parse_episode(self, text: str) -> Optional[Dict[str, Any]]:
        """Parse an episode section from the script."""
        # Reset scene tracking
        self.current_scene = None
        self.current_scene_dialogue = []
        
        # Find episode name (e.g., "Part One")
        episode_match = re.search(r'<u><i><b>(Part [^<]+)</b></i></u>', text)
        if not episode_match:
            return None

        episode_name = self.clean_html_text(episode_match.group(1))
        
        # Split content into scenes
        scenes = []
        
        for p in BeautifulSoup(text, 'html.parser').find_all('p'):
            if not p.find('font'):
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
        header_info = self.parse_header()

        # Split the text into episodes
        episodes = []
        
        # Find all episode markers
        episode_matches = list(re.finditer(r'<u><i><b>(Part (?:One|Two|Three|Four|1|2|3|4))</b></i></u>', self.text))
        
        # If no episodes found, treat entire text as Part One
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
