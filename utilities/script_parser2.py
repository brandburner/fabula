"""
TV Script Parser - Improved version with better handling of edge cases
Designed to support the transcription format at http://www.chakoteya.net/
"""

import re
import json
import argparse
from dataclasses import dataclass, asdict
from typing import List, Optional, Dict, Any, Union
from datetime import datetime

@dataclass
class DialogueLine:
    """Represents a single line of dialogue or stage direction"""
    type: str  # "Character" or "Stage Direction"
    character: Optional[str]  # Character name, None for stage directions
    character_annotation: Optional[str]  # Character description or role
    line: str  # The actual dialogue or stage direction text

@dataclass
class Scene:
    """Represents a scene in the episode"""
    scene_name: str
    dialogue: List[DialogueLine]

@dataclass
class Episode:
    """Represents a single episode"""
    episode_name: str
    scenes: List[Scene]

@dataclass
class Script:
    """Represents the full script"""
    title: str
    airdate: str
    notes: List[str]  # For transcriber's notes and other metadata
    episodes: List[Episode]

class ScriptParser:
    """Parser for converting TV scripts to structured format"""

    def __init__(self, text: str):
        self.text = text
        self.debug = False
        self.character_names = set()

        for line in text.split('\n'):
            match = re.match(r'^([A-Z][A-Z0-9 ]+)(?:\s*\[([^\]]+)\])?(?:\s*\(([^)]+)\))?\s*:', line)
            if match:
                self.character_names.add(match.group(1).strip())

        numbered_chars = set()
        for name in self.character_names:
            base_match = re.match(r'^(.*?)\s*\d+$', name)
            if base_match:
                base_name = base_match.group(1)
                for i in range(1, 10):
                    numbered_chars.add(f"{base_name} {i}")

        self.character_names.update(numbered_chars)

    def log(self, *args) -> None:
        if self.debug:
            print(*args)

    def parse_header(self) -> Dict[str, Any]:
        header_lines = []
        for line in self.text.split('\n'):
            if line.strip() and not line.startswith('__'):
                header_lines.append(line)
            else:
                break

        header_info = {
            'title': '',
            'airdate': '',
            'notes': []
        }

        for line in header_lines:
            line = line.strip()
            if line.startswith('**') and '[' not in line:
                header_info['title'] = line.replace('**', '').strip()
            elif 'airdate' in line.lower():
                airdate_str = line.split(':', 1)[1].strip()
                try:
                    # Attempt to parse the airdate string into a datetime object
                    airdate_dt = datetime.strptime(airdate_str, '%Y-%m-%d')
                    # Format the datetime object into the desired format
                    header_info['airdate'] = airdate_dt.strftime('%Y-%m-%d')
                except ValueError:
                    print(f"Warning: Could not parse airdate '{airdate_str}'. Leaving as is.")
                    header_info['airdate'] = airdate_str
            elif line.startswith('*('):
                note = line.replace('*(', '').replace(')*', '').strip()
                header_info['notes'].append(note)

        return header_info

    def should_split_at_punctuation(self, text: str, pos: int) -> bool:
        if pos + 1 >= len(text) or text[pos + 1] != ' ':
            return False

        prev_text = text[max(0, pos-10):pos]
        if re.search(r'[A-Z]{2,}$', prev_text) or '[' in prev_text:
            return False

        if (text[:pos].strip().endswith('...') or
            text[:pos].strip().endswith('-') or
            pos == len(text.rstrip()) - 1):
            return False

        quotes_before = text[:pos].count('"')
        if quotes_before % 2 == 1:
            return False

        return True

    def parse_dialogue_line(self, text: str) -> List[Dict[str, Any]]:
        """Parse a line of text into dialogue and stage directions, returning a list of dictionaries"""
        dialogue_lines = []
        lines = text.split('\n')

        i = 0
        while i < len(lines):
            line = lines[i].strip()

            # Handle stage directions
            if line.startswith('(') and line.endswith(')'):
                dialogue_lines.append({
                    "Stage Direction": line[1:-1].strip()
                })
                i += 1
                continue

            # Check for character dialogue
            char_match = re.match(r'^([A-Z][A-Z0-9 ]+)(?:\s*\[([^\]]+)\])?(?:\s*\(([^)]+)\))?\s*:(.*)', line)
            if char_match:
                char_name = char_match.group(1).strip()
                dialogue = char_match.group(4).strip()

                # Check for stage direction on the next line
                if i + 1 < len(lines) and lines[i + 1].strip().startswith('(') and lines[i + 1].strip().endswith(')'):
                    stage_direction_line = lines[i + 1].strip()
                    dialogue_lines.append({
                        "Stage Direction": stage_direction_line[1:-1].strip()
                    })
                    i += 1  # Skip the next line as it's a stage direction

                dialogue_lines.append({
                    "Character": char_name,
                    "Line": dialogue
                })
                i += 1
                continue

            i += 1

        return dialogue_lines

    def parse_scene(self, text: str) -> Optional[Dict[str, Any]]:
        """Parse a scene section, returning a dictionary"""
        scene_match = re.match(r'\*\*\[([^\]]+)\]\*\*\n*(.*)', text.strip(), re.DOTALL)
        if not scene_match:
            return None

        scene_name = scene_match.group(1).strip()
        scene_content = scene_match.group(2).strip()

        return {
            "Scene": scene_name,
            "Dialogue": self.parse_dialogue_line(scene_content)
        }

    def parse_episode(self, text: str) -> Optional[Dict[str, Any]]:
        """Parse an episode section, returning a dictionary"""
        episode_match = re.match(r'__\*\*(.*?)\*\*__(.*)', text.strip(), re.DOTALL)
        if not episode_match:
            return None

        episode_name = episode_match.group(1).strip()
        episode_content = episode_match.group(2).strip()

        scene_texts = re.split(r'(?=\*\*\[)', episode_content)
        scenes = []

        for scene_text in scene_texts:
            if not scene_text.strip():
                continue
            scene = self.parse_scene(scene_text)
            if scene:
                scenes.append(scene)

        return {
            "Episode": episode_name,
            "Scenes": scenes
        }

    def parse(self) -> Dict[str, Any]:
        """Parse the entire script, returning a dictionary"""
        header_info = self.parse_header()

        episode_texts = re.split(r'(?=__\*\*.*?\*\*__)', self.text)
        episodes = []

        for episode_text in episode_texts[1:]:
            episode = self.parse_episode(episode_text)
            if episode:
                episodes.append(episode)

        return {
            "Story": header_info['title'],
            "Airdate": header_info['airdate'],
            "Episodes": episodes
        }

def parse_script_file(filepath: str, debug: bool = False) -> Dict:
    with open(filepath, 'r', encoding='utf-8') as f:
        text = f.read()

    parser = ScriptParser(text)
    parser.debug = debug
    script = parser.parse()
    return script

def main():
    parser = argparse.ArgumentParser(description='Convert TV script text files to JSON')
    parser.add_argument('input_file', help='Input script file (text or markdown)')
    parser.add_argument('output_file', help='Output JSON file')
    parser.add_argument('--debug', action='store_true', help='Enable debug logging')
    parser.add_argument('--pretty', action='store_true', help='Pretty-print JSON output')
    args = parser.parse_args()

    try:
        script_dict = parse_script_file(args.input_file, args.debug)

        with open(args.output_file, 'w', encoding='utf-8') as f:
            if args.pretty:
                json.dump(script_dict, f, indent=2, ensure_ascii=False)
            else:
                json.dump(script_dict, f, ensure_ascii=False)

        print(f'Successfully converted {args.input_file} to {args.output_file}')

    except Exception as e:
        print(f'Error: {str(e)}')
        raise

if __name__ == '__main__':
    main()