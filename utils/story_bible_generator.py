#!/usr/bin/env python3
"""
Enhanced Story Bible Generator using BAML

This script processes screenplay scripts (particularly those with clear scene headers)
and generates comprehensive story bibles with structured elements using BAML.
Includes enhancements for detailed character profiles, rich markdown output,
and improved caching.

Features:
- Robust scene detection tailored for screenplay format
- Reliable chunking and map-reduce summarization
- Enhanced character profiles with detailed information
- Rich markdown output with structured sections
- Comprehensive caching system
- Token control based on detail level
- Tracking of intermediate results for analysis
"""

import os
import re
import json
import time
import datetime
import logging
import tiktoken
from pathlib import Path
import sys
import argparse
import functools
import pickle
import hashlib
from typing import List, Dict, Any, Tuple, Optional, Union
from baml_client import b


# Configure logging
def setup_logging(verbose=False, log_file=None):
    """Set up logging with optional verbosity and file output"""
    log_level = logging.DEBUG if verbose else logging.INFO
    log_format = '%(asctime)s - %(levelname)s - %(message)s'
    
    handlers = [logging.StreamHandler()]
    if log_file:
        handlers.append(logging.FileHandler(log_file))
    
    logging.basicConfig(
        level=log_level,
        format=log_format,
        handlers=handlers
    )
    
    return logging.getLogger('story-bible')

# Cache decorator for BAML function calls
# Fixed caching decorator for BAML function calls
def baml_cache(cache_dir=None):
    """Decorator for caching BAML function results"""
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            # Determine the cache directory path
            actual_cache_dir = None
            if cache_dir is not None:
                # If self is passed, try to get cache_dir from it
                if args and hasattr(args[0], 'cache_dir'):
                    actual_cache_dir = args[0].cache_dir
                # Otherwise use the provided cache_dir directly
                else:
                    actual_cache_dir = cache_dir
            
            # If no cache directory, just run the function
            if not actual_cache_dir:
                return func(*args, **kwargs)
            
            # Extract self if it's a method
            if args and hasattr(args[0], '__class__'):
                self_arg = args[0]
                func_args = args[1:]
            else:
                self_arg = None
                func_args = args
            
            # Create cache key from function name and args
            key_parts = [func.__name__]
            for arg in func_args:
                # Convert arguments to strings safely
                if isinstance(arg, (str, int, float, bool)):
                    key_parts.append(str(arg))
                elif arg is None:
                    key_parts.append("None")
                else:
                    # For complex objects like lists or dicts, use their hash
                    try:
                        key_parts.append(str(hash(str(arg))))
                    except:
                        key_parts.append("unhashable")
            
            # Add keyword arguments to key
            for k, v in sorted(kwargs.items()):
                if isinstance(v, (str, int, float, bool)):
                    key_parts.append(f"{k}={v}")
                elif v is None:
                    key_parts.append(f"{k}=None")
                else:
                    try:
                        key_parts.append(f"{k}={hash(str(v))}")
                    except:
                        key_parts.append(f"{k}=unhashable")
            
            # Generate final cache key
            key_str = "_".join(key_parts)
            cache_key = hashlib.md5(key_str.encode()).hexdigest()
            
            # Ensure the cache directory exists
            cache_dir_path = Path(actual_cache_dir)
            cache_dir_path.mkdir(exist_ok=True, parents=True)
            cache_file = cache_dir_path / f"{func.__name__}_{cache_key}.pkl"
            
            # Check if cache exists
            if cache_file.exists():
                try:
                    with open(cache_file, 'rb') as f:
                        if self_arg and hasattr(self_arg, 'logger'):
                            self_arg.logger.info(f"Using cached result from {cache_file}")
                        return pickle.load(f)
                except Exception as e:
                    if self_arg and hasattr(self_arg, 'logger'):
                        self_arg.logger.warning(f"Failed to load cache: {str(e)}")
            
            # Call the function
            result = func(*args, **kwargs)
            
            # Cache the result
            try:
                with open(cache_file, 'wb') as f:
                    pickle.dump(result, f)
                if self_arg and hasattr(self_arg, 'logger'):
                    self_arg.logger.info(f"Cached result to {cache_file}")
            except Exception as e:
                if self_arg and hasattr(self_arg, 'logger'):
                    self_arg.logger.warning(f"Failed to cache result: {str(e)}")
            
            return result
        return wrapper
    return decorator

class StoryBibleGenerator:
    """Enhanced Story Bible Generator using BAML with added features for parity with older version"""
    
    def __init__(self, logger=None, cache_dir=None):
        self.logger = logger or logging.getLogger('story-bible')
        self.cache_dir = cache_dir
        
    def chunk_screenplay(self, script_text: str, max_tokens: int = 2000) -> List[str]:
        """
        Split screenplay text into chunks, trying first with scene detection,
        then falling back to token-based chunking if necessary.
        
        Args:
            script_text: Full screenplay text
            max_tokens: Maximum tokens per chunk
            
        Returns:
            List of text chunks
        """
        # First try with the most specific screenplay pattern
        scenes = self._extract_scenes_by_pattern(script_text)
        
        if len(scenes) >= 3:
            self.logger.info(f"Successfully extracted {len(scenes)} scenes")
            return self._combine_scenes_into_chunks(scenes, max_tokens)
        
        # If first attempt failed, fall back to token-based chunking
        self.logger.warning("Too few scenes found, falling back to token-based chunking")
        return self._chunk_by_token_count(script_text, max_tokens)
    
    def _extract_scenes_by_pattern(self, script_text: str) -> List[str]:
        """
        Try multiple patterns to extract scenes from screenplay text.
        
        Args:
            script_text: Full screenplay text
            
        Returns:
            List of scene texts
        """
        # Try multiple patterns, from most specific to most general
        patterns = [
            # Pattern 1: Bold scene headers with INT/EXT
            r'(?:\n|\r\n|\r)\s*\*\*(?:INT|EXT|I/E|E/I|INT\.?\s*/\s*EXT|EXT\.?\s*/\s*INT).*?\*\*.*?(?=(?:\n|\r\n|\r)\s*\*\*(?:INT|EXT|I/E|E/I|INT\.?\s*/\s*EXT|EXT\.?\s*/\s*INT)|\Z)',
            
            # Pattern 2: Scene headers with INT/EXT without bold markers
            r'(?:\n|\r\n|\r)\s*(?:INT|EXT|I/E|E/I|INT\.?\s*/\s*EXT|EXT\.?\s*/\s*INT).*?(?=(?:\n|\r\n|\r)\s*(?:INT|EXT|I/E|E/I|INT\.?\s*/\s*EXT|EXT\.?\s*/\s*INT)|\Z)',
            
            # Pattern 3: More lenient pattern for "Scene X" headers
            r'(?:\n|\r\n|\r)\s*(?:Scene\s+\d+|INT|EXT).*?(?=(?:\n|\r\n|\r)\s*(?:Scene\s+\d+|INT|EXT)|\Z)',
            
            # Pattern 4: Markdown headers (# Scene)
            r'(?:\n|\r\n|\r)\s*#+\s+(?:Scene|INT|EXT|SCENE).*?(?=(?:\n|\r\n|\r)\s*#+\s+(?:Scene|INT|EXT|SCENE)|\Z)'
        ]
        
        for i, pattern in enumerate(patterns):
            # Use re.DOTALL to match across multiple lines
            matches = re.finditer(pattern, script_text, re.MULTILINE | re.DOTALL)
            scenes = [match.group(0).strip() for match in matches]
            
            self.logger.info(f"Pattern {i+1}: Found {len(scenes)} scenes")
            
            # If we found enough scenes, return them
            if len(scenes) >= 3:
                # Log a few scene starts to verify
                for j in range(min(3, len(scenes))):
                    scene_preview = scenes[j][:100].replace('\n', ' ')
                    self.logger.debug(f"Scene {j+1} preview: {scene_preview}...")
                return scenes
        
        # If we get here, none of the patterns worked well
        return []
    
    def _combine_scenes_into_chunks(self, scenes: List[str], max_tokens: int) -> List[str]:
        """
        Combine scenes into chunks of appropriate token size.
        
        Args:
            scenes: List of scene texts
            max_tokens: Maximum tokens per chunk
            
        Returns:
            List of chunks
        """
        enc = tiktoken.get_encoding("cl100k_base")
        chunks = []
        current_chunk = ""
        current_tokens = 0
        
        for scene in scenes:
            scene_tokens = len(enc.encode(scene))
            
            # If a single scene is too large, split it
            if scene_tokens > max_tokens:
                if current_chunk:
                    chunks.append(current_chunk)
                    current_chunk = ""
                    current_tokens = 0
                
                self.logger.info(f"Large scene found ({scene_tokens} tokens), splitting it")
                scene_chunks = self._chunk_by_token_count(scene, max_tokens)
                chunks.extend(scene_chunks)
                continue
            
            # If adding this scene would exceed token limit, start a new chunk
            if current_tokens + scene_tokens > max_tokens and current_chunk:
                chunks.append(current_chunk)
                current_chunk = scene
                current_tokens = scene_tokens
            else:
                # Add to current chunk
                if current_chunk:
                    current_chunk += "\n\n"
                current_chunk += scene
                current_tokens += scene_tokens
        
        # Add the final chunk if it exists
        if current_chunk:
            chunks.append(current_chunk)
        
        self.logger.info(f"Created {len(chunks)} chunks from {len(scenes)} scenes")
        
        # Log token counts for each chunk
        for i, chunk in enumerate(chunks):
            chunk_tokens = len(enc.encode(chunk))
            self.logger.debug(f"Chunk {i+1}: {chunk_tokens} tokens")
            
        return chunks
    
    def _chunk_by_token_count(self, text: str, max_tokens: int = 2000) -> List[str]:
        """
        Split text into chunks based on token count with natural breakpoints.
        
        Args:
            text: Text to chunk
            max_tokens: Maximum tokens per chunk
            
        Returns:
            List of text chunks
        """
        self.logger.info("Using token-based chunking")
        
        enc = tiktoken.get_encoding("cl100k_base")
        tokens = enc.encode(text)
        
        self.logger.info(f"Total tokens in text: {len(tokens)}")
        
        # Try to find natural breakpoints (paragraphs/line breaks) for chunking
        chunks = []
        start = 0
        
        while start < len(tokens):
            # Target end position based on max tokens
            target_end = start + max_tokens
            
            # If we're at the end of the text, just take what's left
            if target_end >= len(tokens):
                chunk_tokens = tokens[start:]
                chunk_str = enc.decode(chunk_tokens)
                chunks.append(chunk_str)
                break
            
            # Get a bit more than we need so we can find a good breakpoint
            extended_end = min(target_end + 100, len(tokens))
            candidate_chunk = enc.decode(tokens[start:extended_end])
            
            # Look for natural breakpoints like paragraph markers or scene breaks
            # in reverse order (from ideal length backwards)
            best_breakpoint = -1
            
            # Try to find paragraph breaks first
            paragraph_matches = list(re.finditer(r'\n\s*\n', candidate_chunk))
            if paragraph_matches:
                # Find the last paragraph break that's before or at our target length
                for match in reversed(paragraph_matches):
                    if match.start() <= max_tokens:
                        best_breakpoint = match.start()
                        break
            
            # If no paragraph breaks found, try finding line breaks
            if best_breakpoint == -1:
                line_matches = list(re.finditer(r'\n', candidate_chunk))
                if line_matches:
                    for match in reversed(line_matches):
                        if match.start() <= max_tokens:
                            best_breakpoint = match.start()
                            break
            
            # If no good breakpoints found, just use max_tokens
            if best_breakpoint == -1:
                chunk_str = enc.decode(tokens[start:target_end])
            else:
                chunk_str = candidate_chunk[:best_breakpoint]
                # Adjust target_end based on actual tokens used
                actual_tokens_used = len(enc.encode(chunk_str))
                target_end = start + actual_tokens_used
            
            chunks.append(chunk_str)
            start = target_end
        
        self.logger.info(f"Chunked text into {len(chunks)} token-based chunks")
        
        # Log token counts for each chunk
        for i, chunk in enumerate(chunks):
            chunk_tokens = len(enc.encode(chunk))
            self.logger.debug(f"Chunk {i+1}: {chunk_tokens} tokens")
            
        return chunks
    
    @baml_cache(cache_dir=lambda self: self.cache_dir)
    def summarize_chunk(self, chunk_text: str, detail_level: str = "standard", max_tokens: int = None) -> str:
        """
        Summarize a single chunk using BAML with caching.
        
        Args:
            chunk_text: The text to summarize
            detail_level: Level of detail ("concise", "standard", or "detailed")
            max_tokens: Maximum tokens for the summary
            
        Returns:
            Summary text
        """
        try:
            # Adjust token count based on detail level if not specified
            if max_tokens is None:
                if detail_level == "concise":
                    max_tokens = 300
                elif detail_level == "detailed":
                    max_tokens = 500
                else:  # standard
                    max_tokens = 400
            
            # Call BAML summarization function
            result = b.SummarizeChunk(
                chunk_text=chunk_text,
                detail_level=detail_level,
                max_tokens=max_tokens
            )
            
            # Extract summary_text from the result
            summary = result.summary_text if hasattr(result, 'summary_text') else str(result)
            
            # Validate the summary
            if not summary or len(summary.strip()) < 50:
                raise ValueError(f"Summary too short or empty: {summary}")
                
            self.logger.info(f"Successfully summarized chunk ({len(summary)} chars)")
            return summary
            
        except Exception as e:
            self.logger.error(f"Error summarizing chunk: {str(e)}")
            
            # Create a fallback summary
            preview = chunk_text[:100].strip() + "..." if len(chunk_text) > 100 else chunk_text.strip()
            return f"A scene taking place in the story, featuring: {preview}"
    
    @baml_cache()
    def merge_summaries(self, summaries: List[str], detail_level: str = "standard", 
                        is_final_merge: bool = False, max_tokens: int = None) -> str:
        """
        Merge multiple summaries into one using BAML with caching.
        
        Args:
            summaries: List of summaries to merge
            detail_level: Level of detail
            is_final_merge: Whether this is the final merge
            max_tokens: Maximum tokens for the merged summary
            
        Returns:
            Merged summary text
        """
        try:
            # Adjust token count based on detail level and merge stage if not specified
            if max_tokens is None:
                if is_final_merge:
                    if detail_level == "concise":
                        max_tokens = 800
                    elif detail_level == "detailed":
                        max_tokens = 1600
                    else:  # standard
                        max_tokens = 1200
                else:
                    if detail_level == "concise":
                        max_tokens = 600
                    elif detail_level == "detailed":
                        max_tokens = 1000
                    else:  # standard
                        max_tokens = 800
            
            # Call BAML merge function
            result = b.MergeSummaries(
                summaries=summaries,
                detail_level=detail_level,
                is_final_merge=is_final_merge,
                max_tokens=max_tokens
            )
            
            # Extract summary_text from the result
            merged_summary = result.summary_text if hasattr(result, 'summary_text') else str(result)
            
            # Validate the summary
            if not merged_summary or len(merged_summary.strip()) < 100:
                raise ValueError(f"Merged summary too short or empty")
            
            self.logger.info(f"Successfully merged {len(summaries)} summaries ({len(merged_summary)} chars)")
            return merged_summary
            
        except Exception as e:
            self.logger.error(f"Error merging summaries: {str(e)}")
            
            # Create a fallback merged summary
            fallback = ""
            for i, summary in enumerate(summaries):
                section = f"Section {i+1}: "
                fallback += section + summary[:200] + "...\n\n"
            
            # Truncate if extremely long
            if len(fallback) > 8000:
                fallback = fallback[:8000] + "...(truncated)"
                
            return fallback
    
    @baml_cache()
    def merge_final_summaries(self, summaries: List[str], detail_level: str = "standard", max_tokens: int = None) -> Dict[str, Any]:
        """
        Merge summaries and extract narrative structure using the enhanced merge function.
        
        Args:
            summaries: List of summaries to merge
            detail_level: Level of detail
            max_tokens: Maximum tokens for the merged summary
            
        Returns:
            Dictionary with summary text and narrative structure
        """
        try:
            # Adjust token count based on detail level
            if max_tokens is None:
                if detail_level == "concise":
                    max_tokens = 800
                elif detail_level == "detailed":
                    max_tokens = 1600
                else:  # standard
                    max_tokens = 1200
            
            # Call BAML enhanced merge function
            result = b.EnhancedMergeSummaries(
                summaries=summaries,
                detail_level=detail_level,
                max_tokens=max_tokens
            )
            
            # Extract summary and narrative structure
            summary_text = result.summary_text if hasattr(result, 'summary_text') else None
            narrative_structure = result.narrative_structure if hasattr(result, 'narrative_structure') else None
            
            if not summary_text or len(summary_text.strip()) < 100:
                raise ValueError("Merged summary too short or empty")
            
            self.logger.info(f"Successfully merged summaries with narrative structure analysis ({len(summary_text)} chars)")
            
            return {
                "summary_text": summary_text,
                "narrative_structure": narrative_structure
            }
                
        except Exception as e:
            self.logger.error(f"Error in enhanced merge: {str(e)}")
            
            # Create a fallback summary without narrative structure
            fallback = ""
            for i, summary in enumerate(summaries):
                section = f"Section {i+1}: "
                fallback += section + summary[:200] + "...\n\n"
            
            # Truncate if extremely long
            if len(fallback) > 8000:
                fallback = fallback[:8000] + "...(truncated)"
                
            return {
                "summary_text": fallback,
                "narrative_structure": None
            }

    @baml_cache()
    def extract_enhanced_story_elements(self, summary: str, narrative_structure: List[Dict[str, Any]]) -> Dict[str, Any]:
        """
        Extract structured story elements with enhanced narrative analysis.
        
        Args:
            summary: The narrative summary to analyze
            narrative_structure: The narrative structure breakdown
            
        Returns:
            Dictionary of enhanced structured story elements
        """
        try:
            # Call BAML extraction function with narrative structure
            result = b.ExtractEnhancedStoryElements(
                narrative_summary=summary,
                narrative_structure=narrative_structure
            )
            
            # Convert to dictionary structure with all elements
            story_elements = {
                "characters": [],
                "locations": [],
                "themes": [],
                "plot_points": [],
                "conflicts": [],
                "narrative_structure": narrative_structure,
                "character_dynamics": [],
                "major_themes": [],
                "central_conflicts": []
            }
            
            # Add standard elements (characters, locations, etc.)
            for key in ["characters", "locations", "themes", "plot_points", "conflicts"]:
                if hasattr(result, key):
                    items = getattr(result, key)
                    story_elements[key] = [self._convert_to_dict(item) for item in items]
            
            # Add enhanced narrative elements
            for key in ["character_dynamics", "major_themes", "central_conflicts"]:
                if hasattr(result, key):
                    items = getattr(result, key)
                    story_elements[key] = [self._convert_to_dict(item) for item in items]
            
            self.logger.info(f"Successfully extracted enhanced story elements")
            return story_elements
                
        except Exception as e:
            self.logger.error(f"Error extracting enhanced story elements: {str(e)}")
            
            # Return structure with narrative_structure but empty other fields
            return {
                "characters": [],
                "locations": [],
                "themes": [],
                "plot_points": [],
                "conflicts": [],
                "narrative_structure": narrative_structure,
                "character_dynamics": [],
                "major_themes": [],
                "central_conflicts": []
            }

    def _convert_to_dict(self, obj):
        """Helper method to convert Pydantic objects to dictionaries"""
        if hasattr(obj, '__dict__'):
            result = {}
            for key, value in obj.__dict__.items():
                if not key.startswith('_'):  # Skip private attributes
                    if hasattr(value, '__dict__'):
                        result[key] = self._convert_to_dict(value)
                    elif isinstance(value, list):
                        result[key] = [self._convert_to_dict(item) if hasattr(item, '__dict__') else item for item in value]
                    else:
                        result[key] = value
            return result
        return obj

    # scene_elements

    @baml_cache(cache_dir=lambda self: self.cache_dir)
    def extract_scene_elements(self, scene_text: str, scene_index: int, scene_summary: str = None) -> Dict[str, Any]:
        """
        Extract narrative elements from a single scene with caching.
        
        Args:
            scene_text: The scene text to analyze
            scene_index: Index of the scene in the screenplay
            scene_summary: Optional pre-generated summary of the scene
            
        Returns:
            Dictionary of scene elements
        """
        try:
            # Call BAML extraction function
            result = b.ExtractSceneElements(
                scene_text=scene_text,
                scene_index=scene_index,
                scene_summary=scene_summary
            )
            
            # Convert to dictionary
            scene_elements = self._convert_to_dict(result)
            
            self.logger.info(f"Successfully extracted elements from scene {scene_index}")
            return scene_elements
            
        except Exception as e:
            self.logger.error(f"Error extracting elements from scene {scene_index}: {str(e)}")
            
            # Return minimal structure on error
            return {
                "scene_index": scene_index,
                "scene_summary": scene_summary or f"Scene {scene_index}",
                "characters": [],
                "locations": [],
                "themes": [],
                "conflicts": []
            }

    @baml_cache(cache_dir=lambda self: self.cache_dir)
    def merge_scene_elements(self, scene_elements: List[Dict[str, Any]]) -> Dict[str, Any]:
        """
        Merge elements from multiple scenes with caching.
        
        Args:
            scene_elements: List of scene element dictionaries
            
        Returns:
            Merged story elements dictionary
        """
        try:
            # Call BAML merge function
            result = b.MergeSceneElements(
                scene_elements=scene_elements
            )
            
            # Convert to dictionary
            merged_elements = self._convert_to_dict(result)
            
            self.logger.info(f"Successfully merged elements from {len(scene_elements)} scenes")
            return merged_elements
            
        except Exception as e:
            self.logger.error(f"Error merging scene elements: {str(e)}")
            
            # Return minimal structure on error
            return {
                "characters": [],
                "locations": [],
                "themes": [],
                "plot_points": [],
                "conflicts": [],
                "narrative_structure": [],
                "character_dynamics": [],
                "major_themes": [],
                "central_conflicts": []
            }

    @baml_cache(cache_dir=lambda self: self.cache_dir)
    def combine_narrative_analyses(self, summary_based_elements: Dict[str, Any], 
                                scene_based_elements: Dict[str, Any]) -> Dict[str, Any]:
        """
        Combine summary-based and scene-based analyses with caching.
        
        Args:
            summary_based_elements: Elements extracted from summary
            scene_based_elements: Elements extracted from scene-by-scene analysis
            
        Returns:
            Combined story elements dictionary
        """
        try:
            # Call BAML combine function
            result = b.CombineNarrativeAnalyses(
                summary_based_elements=summary_based_elements,
                scene_based_elements=scene_based_elements
            )
            
            # Convert to dictionary
            combined_elements = self._convert_to_dict(result)
            
            self.logger.info(f"Successfully combined summary and scene-based analyses")
            return combined_elements
            
        except Exception as e:
            self.logger.error(f"Error combining analyses: {str(e)}")
            
            # In case of error, return the more complete of the two analyses
            if len(summary_based_elements.get("characters", [])) >= len(scene_based_elements.get("characters", [])):
                return summary_based_elements
            else:
                return scene_based_elements


    @baml_cache()
    def extract_story_elements(self, summary: str, narrative_structure: List[Dict[str, Any]] = None) -> Dict[str, Any]:
        """
        Extract structured story elements from the final summary.
        
        Args:
            summary: The narrative summary to analyze
            narrative_structure: Optional narrative structure breakdown
            
        Returns:
            Dictionary of structured story elements
        """
        try:
            # Call BAML extraction function
            result = b.ExtractStoryElements(
                narrative_summary=summary,
                narrative_structure=narrative_structure
            )
            
            # Convert to dictionary structure
            story_elements = self._convert_to_dict(result)
            
            self.logger.info(f"Successfully extracted story elements")
            return story_elements
                
        except Exception as e:
            self.logger.error(f"Error extracting story elements: {str(e)}")
            
            # Return empty structure if extraction fails
            return {
                "characters": [],
                "locations": [],
                "themes": [],
                "plot_points": [],
                "conflicts": [],
                "narrative_structure": narrative_structure or []
            }
    
    @baml_cache()
    def enhance_character_profiles(self, characters: List[Dict[str, Any]], chunk_summaries: List[str]) -> List[Dict[str, Any]]:
        """
        Enhance character profiles with more detailed information.
        
        Args:
            characters: List of character dictionaries
            chunk_summaries: List of chunk summaries to find relevant context
            
        Returns:
            Enhanced list of character dictionaries
        """
        enhanced_characters = []
        
        for character in characters:
            try:
                character_name = character["name"]
                self.logger.info(f"Enhancing profile for character: {character_name}")
                
                # Find chunks that mention this character
                relevant_chunks = []
                for summary in chunk_summaries:
                    if character_name in summary:
                        relevant_chunks.append(summary)
                
                # Limit to 3 chunks to avoid token limits
                relevant_chunks = relevant_chunks[:3]
                
                if not relevant_chunks:
                    self.logger.warning(f"No relevant chunks found for {character_name}")
                    enhanced_characters.append(character)
                    continue
                
                # Call BAML function to enhance the profile
                result = b.EnhanceCharacterProfile(
                    character_name=character_name,
                    character_description=character["description"],
                    relevant_chunks=relevant_chunks
                )
                
                # Extract the detailed profile
                detailed_profile = result.detailed_profile if hasattr(result, 'detailed_profile') else None
                
                if detailed_profile:
                    character["detailed_profile"] = detailed_profile
                    self.logger.info(f"Successfully enhanced profile for {character_name}")
                else:
                    self.logger.warning(f"Failed to generate detailed profile for {character_name}")
                
                enhanced_characters.append(character)
                
            except Exception as e:
                self.logger.error(f"Error enhancing character {character.get('name', 'Unknown')}: {str(e)}")
                enhanced_characters.append(character)
        
        return enhanced_characters
    
    @baml_cache()
    def generate_markdown(self, story_bible: Dict[str, Any], title: str = "Story Bible") -> str:
        """
        Generate a markdown version of the story bible by directly assembling
        all components without using the LLM - prevents truncation issues.
        
        Args:
            story_bible: The complete story bible dictionary
            title: Title of the story bible
            
        Returns:
            Markdown text
        """
        try:
            # Extract needed elements
            summary = story_bible.get("summary", "")
            elements = story_bible.get("elements", {})
            metadata = story_bible.get("metadata", {})
            
            # Create basic markdown content with the title
            lines = [f"# {title}\n"]
            lines.append(f"*Generated on: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}*\n")
            
            # Add metadata
            lines.append("## Metadata\n")
            lines.append(f"- **Detail Level**: {metadata.get('detail_level', 'standard')}")
            lines.append(f"- **Model**: {metadata.get('model', 'gpt-4o-mini')}")
            lines.append(f"- **Processing Time**: {round(metadata.get('processing_time_seconds', 0) / 60, 2)} minutes")
            lines.append(f"- **Chunks**: {metadata.get('chunks', 0)}\n")
            
            # Add summary
            lines.append("## Episode Synopsis\n")
            lines.append(summary + "\n")
            
            # Add narrative structure if present
            narrative_structure = elements.get("narrative_structure", [])
            if narrative_structure:
                lines.append("## Narrative Structure\n")
                for stage in narrative_structure:
                    if isinstance(stage, dict) and "stage" in stage and "description" in stage:
                        lines.append(f"### {stage['stage']}\n")
                        lines.append(f"{stage['description']}\n")
            
            # Add character dynamics if present
            character_dynamics = elements.get("character_dynamics", [])
            if character_dynamics:
                lines.append("## Character Dynamics\n")
                for dynamic in character_dynamics:
                    if isinstance(dynamic, dict) and "character_name" in dynamic:
                        role = dynamic.get("role", "")
                        title = f"{dynamic['character_name']}"
                        if role:
                            title += f" ({role})"
                        lines.append(f"### {title}\n")
                        lines.append(f"{dynamic.get('arc_description', '')}\n")
            
            # Add major themes if present
            major_themes = elements.get("major_themes", [])
            if major_themes:
                lines.append("## Major Themes\n")
                for theme in major_themes:
                    if isinstance(theme, dict) and "name" in theme:
                        lines.append(f"### {theme['name']}\n")
                        lines.append(f"{theme.get('description', '')}\n")
                        
                        # Add examples if present
                        examples = theme.get("examples", [])
                        if examples:
                            lines.append("\n**Examples:**\n")
                            for example in examples:
                                lines.append(f"- {example}\n")
            
            # Add central conflicts if present
            central_conflicts = elements.get("central_conflicts", [])
            if central_conflicts:
                lines.append("## Central Conflicts\n")
                for conflict in central_conflicts:
                    if isinstance(conflict, dict) and "name" in conflict:
                        lines.append(f"### {conflict['name']}\n")
                        lines.append(f"{conflict.get('description', '')}\n")
                        
                        # Add involved characters if present
                        involved = conflict.get("involved_characters", [])
                        if involved:
                            lines.append("\n**Characters Involved:**\n")
                            for character in involved:
                                lines.append(f"- {character}\n")
            
            # Add characters
            characters = elements.get("characters", [])
            if characters:
                lines.append("## Characters\n")
                for char in characters:
                    lines.append(f"### {char.get('name', 'Unnamed Character')}\n")
                    lines.append(f"{char.get('description', '')}\n")
                    
                    # Add detailed profile if available
                    if char.get('detailed_profile'):
                        lines.append("\n**Detailed Profile:**\n")
                        lines.append(f"{char.get('detailed_profile')}\n")
            
            # Add locations
            locations = elements.get("locations", [])
            if locations:
                lines.append("## Locations\n")
                for loc in locations:
                    lines.append(f"### {loc.get('name', 'Unnamed Location')}\n")
                    lines.append(f"{loc.get('description', '')}\n")
            
            # Add themes (regular ones)
            themes = elements.get("themes", [])
            if themes and not major_themes:  # Only if no major_themes section
                lines.append("## Themes\n")
                for theme in themes:
                    if isinstance(theme, dict) and "name" in theme:
                        lines.append(f"- **{theme.get('name')}**: {theme.get('description', '')}\n")
                    else:
                        lines.append(f"- {theme}\n")
            
            # Add plot points
            plot_points = elements.get("plot_points", [])
            if plot_points:
                lines.append("## Plot Points\n")
                for i, point in enumerate(plot_points, 1):
                    if isinstance(point, dict) and "description" in point:
                        lines.append(f"{i}. {point.get('description', '')}\n")
                    else:
                        lines.append(f"{i}. {point}\n")
            
            # Add conflicts (regular ones)
            conflicts = elements.get("conflicts", [])
            if conflicts and not central_conflicts:  # Only if no central_conflicts section
                lines.append("## Conflicts\n")
                for i, conflict in enumerate(conflicts, 1):
                    if isinstance(conflict, dict) and "description" in conflict:
                        lines.append(f"{i}. {conflict.get('description', '')}\n")
                    else:
                        lines.append(f"{i}. {conflict}\n")
            
            # Combine all sections
            markdown_text = "\n".join(lines)
            
            self.logger.info(f"Successfully generated markdown ({len(markdown_text)} chars)")
            return markdown_text
                    
        except Exception as e:
            self.logger.error(f"Error generating markdown: {str(e)}")
            
            # Very basic fallback
            return f"# {title}\n\n## Summary\n\n{story_bible.get('summary', 'No summary available.')}"
    
    def save_story_bible(self, story_bible: Dict[str, Any], output_file: str):
        """Save story bible to JSON file with proper serialization of BAML objects"""
        try:
            # Create directory if it doesn't exist
            output_dir = os.path.dirname(output_file)
            if output_dir:
                os.makedirs(output_dir, exist_ok=True)
            
            # Convert any BAML objects to dictionaries
            def prepare_for_json(obj):
                if hasattr(obj, '__dict__'):
                    # Convert object to dict
                    return {k: prepare_for_json(v) for k, v in obj.__dict__.items() 
                            if not k.startswith('_')}
                elif isinstance(obj, list):
                    return [prepare_for_json(item) for item in obj]
                elif isinstance(obj, dict):
                    return {k: prepare_for_json(v) for k, v in obj.items()}
                elif isinstance(obj, (datetime.datetime, datetime.date)):
                    return obj.isoformat()
                else:
                    return obj
            
            # Prepare the story bible for JSON serialization
            json_ready_bible = prepare_for_json(story_bible)
                    
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(json_ready_bible, f, indent=2)
                    
            self.logger.info(f"Story bible saved to {output_file}")
        except Exception as e:
            self.logger.error(f"Error saving story bible: {str(e)}")
    
    def save_markdown(self, markdown_text: str, output_file: str):
        """Save markdown to file"""
        try:
            # Create directory if it doesn't exist
            output_dir = os.path.dirname(output_file)
            if output_dir:
                os.makedirs(output_dir, exist_ok=True)
                
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(markdown_text)
                
            self.logger.info(f"Markdown saved to {output_file}")
        except Exception as e:
            self.logger.error(f"Error saving markdown: {str(e)}")
    
    def process_screenplay(self, 
                        script_text: str, 
                        detail_level: str = "standard",
                        extract_elements: bool = True,
                        enhance_characters: bool = True,
                        include_narrative_analysis: bool = True,
                        use_parallel_extraction: bool = True,  # New parameter
                        retry_count: int = 2,
                        max_tokens_per_chunk: int = 2000,
                        output_markdown_path: str = None) -> Dict[str, Any]:
        """
        Process a screenplay into a story bible with enhanced narrative analysis
        
        Args:
            script_text: The screenplay text
            detail_level: Level of detail ("concise", "standard", or "detailed")
            extract_elements: Whether to extract structured elements
            enhance_characters: Whether to enhance character profiles
            include_narrative_analysis: Whether to include enhanced narrative analysis
            use_parallel_extraction: Whether to use scene-by-scene element extraction
            retry_count: Number of retries for API calls
            max_tokens_per_chunk: Maximum tokens per chunk
            output_markdown_path: Path to save markdown output
            
        Returns:
            Story bible dictionary
        """
        self.logger.info(f"Starting story bible generation with {detail_level} detail")
        start_time = time.time()
        
        # Track intermediate results for analysis
        intermediate_results = {
            "chunk_summaries": [],
            "merge_rounds": [],
            "scene_elements": [] if use_parallel_extraction else None
        }
        
        # 1. Chunk the screenplay
        chunks = self.chunk_screenplay(script_text, max_tokens=max_tokens_per_chunk)
        
        # 2. Summarize each chunk
        self.logger.info(f"Summarizing {len(chunks)} chunks...")
        chunk_summaries = []
        
        # Adjust token limits based on detail level
        if detail_level == "concise":
            summary_tokens = 800
        elif detail_level == "detailed":
            summary_tokens = 1600
        else:  # standard
            summary_tokens = 1200
        
        # Create scene elements list for parallel extraction if enabled
        scene_elements_list = [] if use_parallel_extraction else None
        
        for i, chunk in enumerate(chunks):
            self.logger.info(f"Summarizing chunk {i+1}/{len(chunks)}")
            
            # Add retry logic for each chunk
            summary = None
            for attempt in range(retry_count):
                try:
                    if attempt > 0:
                        self.logger.info(f"Retry #{attempt} for chunk {i+1}")
                    
                    summary = self.summarize_chunk(
                        chunk_text=chunk,
                        detail_level=detail_level,
                        max_tokens=summary_tokens
                    )
                    
                    # Store in intermediate results
                    intermediate_results["chunk_summaries"].append({
                        "chunk_index": i,
                        "summary": summary
                    })
                    
                    break  # Success, break retry loop
                    
                except Exception as e:
                    self.logger.error(f"Error summarizing chunk {i+1} (attempt {attempt+1}/{retry_count}): {str(e)}")
                    
                    # If we've run out of retries, create a fallback
                    if attempt == retry_count - 1:
                        # Extract a brief preview of the chunk for context
                        preview = chunk[:100].strip() + "..." if len(chunk) > 100 else chunk.strip()
                        self.logger.info(f"Creating fallback summary for chunk {i+1}")
                        
                        # Create a minimal fallback summary with some actual content
                        summary = f"A scene taking place in the story, featuring: {preview}"
            
            # Add the summary to our list
            if summary:
                chunk_summaries.append(summary)
                
                # If parallel extraction is enabled, extract elements from this scene/chunk
                if use_parallel_extraction:
                    self.logger.info(f"Extracting elements from scene {i+1}")
                    
                    scene_elements = None
                    for attempt in range(retry_count):
                        try:
                            if attempt > 0:
                                self.logger.info(f"Retry #{attempt} for extracting elements from scene {i+1}")
                            
                            scene_elements = self.extract_scene_elements(
                                scene_text=chunk,
                                scene_index=i+1,
                                scene_summary=summary
                            )
                            
                            # Store in scene elements list
                            scene_elements_list.append(scene_elements)
                            
                            # Store in intermediate results
                            intermediate_results["scene_elements"].append({
                                "scene_index": i+1,
                                "elements": scene_elements
                            })
                            
                            break  # Success, break retry loop
                            
                        except Exception as e:
                            self.logger.error(f"Error extracting elements from scene {i+1} (attempt {attempt+1}/{retry_count}): {str(e)}")
                            
                            # If we've run out of retries, create a fallback
                            if attempt == retry_count - 1:
                                self.logger.info(f"Creating fallback elements for scene {i+1}")
                                
                                # Create minimal scene elements
                                scene_elements = {
                                    "scene_index": i+1,
                                    "scene_summary": summary,
                                    "characters": [],
                                    "locations": [],
                                    "themes": [],
                                    "conflicts": []
                                }
                                
                                scene_elements_list.append(scene_elements)
        
        # 3. Merge intermediate summaries normally
        self.logger.info(f"Merging {len(chunk_summaries)} summaries...")
        round_num = 1
        
        # Determine batch size and token limits for merging
        if detail_level == "concise":
            batch_size = 3
            merge_tokens = 800
        elif detail_level == "detailed":
            batch_size = 2
            merge_tokens = 1600
        else:  # standard
            batch_size = 2
            merge_tokens = 1200
        
        current_summaries = chunk_summaries[:]
        
        # Perform intermediate merges until we have a small number of summaries
        while len(current_summaries) > batch_size:
            self.logger.info(f"Merge round {round_num}: {len(current_summaries)} summaries remaining")
            new_summaries = []
            round_results = []
            
            for i in range(0, len(current_summaries), batch_size):
                batch = current_summaries[i:i+batch_size]
                batch_ids = list(range(i+1, min(i+batch_size+1, len(current_summaries)+1)))
                
                self.logger.info(f"Merging summaries {batch_ids}")
                
                # If only one summary in batch, keep it as is
                if len(batch) == 1:
                    new_summaries.append(batch[0])
                    round_results.append({
                        "source_indices": [i],
                        "result": batch[0]
                    })
                    continue
                
                merged_summary = None
                for attempt in range(retry_count):
                    try:
                        if attempt > 0:
                            self.logger.info(f"Retry #{attempt} for merging summaries {batch_ids}")
                        
                        merged_summary = self.merge_summaries(
                            summaries=batch,
                            detail_level=detail_level,
                            is_final_merge=False,
                            max_tokens=merge_tokens
                        )
                        
                        new_summaries.append(merged_summary)
                        round_results.append({
                            "source_indices": batch_ids,
                            "result": merged_summary
                        })
                        break  # Success, break retry loop
                        
                    except Exception as e:
                        self.logger.error(f"Error merging summaries {batch_ids} (attempt {attempt+1}/{retry_count}): {str(e)}")
                        
                        # If we've run out of retries, create a fallback
                        if attempt == retry_count - 1:
                            # Create a fallback by concatenating the batch
                            self.logger.info(f"Creating fallback merged summary for batch {batch_ids}")
                            
                            fallback = ""
                            for j, summary in enumerate(batch):
                                section = f"Section {j+1}: "
                                fallback += section + summary[:200] + "...\n\n"
                            
                            # Truncate if extremely long
                            if len(fallback) > 8000:
                                fallback = fallback[:8000] + "...(truncated)"
                                
                            new_summaries.append(fallback)
                            round_results.append({
                                "source_indices": batch_ids,
                                "result": "Fallback merged summary (error occurred)"
                            })
            
            # Store the results of this merge round
            intermediate_results["merge_rounds"].append({
                "round": round_num,
                "results": round_results
            })
            
            # Update for next round
            current_summaries = new_summaries
            round_num += 1
        
        # 4. Generate vibrant final summary instead of standard merge
        self.logger.info("Generating vibrant final summary...")
        
        # Use generous token limits based on detail level
        if detail_level == "concise":
            summary_tokens = 1200
        elif detail_level == "detailed":
            summary_tokens = 2500
        else:  # standard
            summary_tokens = 1800
        
        # Generate the vibrant final summary
        final_summary = self.generate_vibrant_final_summary(
            merged_summaries=current_summaries,
            detail_level=detail_level,
            max_tokens=summary_tokens
        )
        
        # Set up narrative structure (will be empty if not using narrative analysis)
        narrative_structure = []
        
        # Get narrative structure if needed and available
        if include_narrative_analysis:
            # Try to extract narrative structure from the summary if possible
            # (Note: this assumes you'd create a separate function to extract just the structure if needed)
            # For now, we'll leave narrative_structure as an empty list
            pass
        
        # 5. Extract story elements through both pipelines
        summary_based_elements = {}
        scene_based_elements = {}
        combined_elements = {}
        
        if extract_elements and final_summary:
            # Summary-based extraction (using consolidated function)
            self.logger.info("Extracting story elements from summary...")
            
            # Use consolidated extract_story_elements function with optional narrative_structure
            summary_based_elements = self.extract_story_elements(
                final_summary,
                narrative_structure if include_narrative_analysis and narrative_structure else None
            )
            
            # Scene-based extraction (new parallel pipeline)
            if use_parallel_extraction and scene_elements_list:
                self.logger.info("Merging scene-by-scene elements...")
                scene_based_elements = self.merge_scene_elements(scene_elements_list)
                
                # Combine both analyses
                self.logger.info("Combining summary-based and scene-based analyses...")
                combined_elements = self.combine_narrative_analyses(
                    summary_based_elements,
                    scene_based_elements
                )
            else:
                combined_elements = summary_based_elements
            
            # Enhance character profiles if requested
            if enhance_characters and combined_elements.get("characters"):
                self.logger.info("Enhancing character profiles...")
                combined_elements["characters"] = self.enhance_character_profiles(
                    combined_elements["characters"], 
                    chunk_summaries
                )
        
        # 6. Generate markdown directly from assembled components
        markdown = None
        if extract_elements:
            self.logger.info("Generating markdown by directly assembling components...")
            markdown = self.generate_markdown({
                "summary": final_summary,
                "elements": combined_elements,
                "metadata": {
                    "detail_level": detail_level,
                    "chunks": len(chunks),
                    "processing_time_seconds": time.time() - start_time,
                    "use_parallel_extraction": use_parallel_extraction
                }
            })
            
            # Save markdown immediately if path provided
            if output_markdown_path and markdown:
                self.save_markdown(markdown, output_markdown_path)
                self.logger.info(f"Markdown saved directly to {output_markdown_path}")
                setattr(self, '_markdown_saved', True)  # Mark as saved

        # 7. Compile the complete story bible
        end_time = time.time()
        execution_time = end_time - start_time

        # Create complete story bible object
        complete_story_bible = {
            "summary": final_summary,
            "elements": combined_elements,
            "summary_based_elements": summary_based_elements if use_parallel_extraction else None,
            "scene_based_elements": scene_based_elements if use_parallel_extraction else None,
            "markdown": markdown,
            "intermediate_results": intermediate_results,
            "metadata": {
                "chunks": len(chunks),
                "detail_level": detail_level,
                "processing_time_seconds": round(execution_time, 2),
                "use_parallel_extraction": use_parallel_extraction,
                "generated_at": datetime.datetime.now().isoformat()
            }
        }

        # Add narrative structure at the top level for easy access
        if include_narrative_analysis and narrative_structure:
            complete_story_bible["narrative_structure"] = narrative_structure

        # Save the JSON data if a path was provided
        if output_markdown_path:
            # Derive JSON path from markdown path
            output_json_path = output_markdown_path.replace('.md', '.json')
            if output_json_path == output_markdown_path:  # In case there was no .md extension
                output_json_path = output_markdown_path + '.json'
            
            # Save the complete data to JSON
            self.save_story_bible(complete_story_bible, output_json_path)
            self.logger.info(f"Complete story bible saved to {output_json_path}")

        self.logger.info(f"Story bible generation complete in {round(execution_time / 60, 2)} minutes")
        return complete_story_bible
    
    @baml_cache(cache_dir=lambda self: self.cache_dir)
    def generate_vibrant_final_summary(self, merged_summaries: List[str], detail_level: str = "standard", max_tokens: int = None) -> str:
        """
        Generate a vibrant, compelling final summary using BAML with caching.
        
        Args:
            merged_summaries: List of merged summaries to consolidate
            detail_level: Level of detail ("concise", "standard", or "detailed")
            max_tokens: Maximum tokens for the summary
            
        Returns:
            Vibrant summary text
        """
        try:
            # Set more generous token limits based on detail level
            if max_tokens is None:
                if detail_level == "concise":
                    max_tokens = 1200  # Increased from 800
                elif detail_level == "detailed":
                    max_tokens = 2500  # Increased from 1600
                else:  # standard
                    max_tokens = 1800  # Increased from 1200
            
            # Call BAML vibrant summary generation function
            result = b.GenerateVibrantFinalSummary(
                merged_summaries=merged_summaries,
                detail_level=detail_level,
                max_tokens=max_tokens
            )
            
            # Extract summary_text from the result
            summary = result.summary_text if hasattr(result, 'summary_text') else str(result)
            
            # Validate the summary
            if not summary or len(summary.strip()) < 100:
                raise ValueError(f"Vibrant summary too short or empty")
            
            self.logger.info(f"Successfully generated vibrant final summary ({len(summary)} chars)")
            return summary
                
        except Exception as e:
            self.logger.error(f"Error generating vibrant final summary: {str(e)}")
            
            # Create a fallback by concatenating the merged summaries
            self.logger.info(f"Creating fallback summary from merged summaries")
            
            fallback = ""
            for i, summary in enumerate(merged_summaries):
                section = f"Section {i+1}: "
                fallback += section + summary[:300] + "...\n\n"
            
            # Truncate if extremely long
            if len(fallback) > 8000:
                fallback = fallback[:8000] + "...(truncated)"
                
            return fallback




def main():
    """Command-line interface"""
    parser = argparse.ArgumentParser(
        description='Generate a story bible from a screenplay script using BAML',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    
    parser.add_argument('script_file', help='Path to the screenplay text file')
    parser.add_argument('--output-json', '-j', default=None, 
                        help='Path to save the JSON output')
    parser.add_argument('--output-markdown', '-m', default=None,
                        help='Path to save the Markdown output')
    parser.add_argument('--detail-level', '-d', choices=['concise', 'standard', 'detailed'], 
                        default='standard', help='Level of detail in the generated bible')
    parser.add_argument('--no-elements', '-n', action='store_true',
                        help='Skip extracting structured elements (characters, locations, etc.)')
    parser.add_argument('--no-character-enhancement', action='store_true',
                        help='Skip enhancing character profiles with detailed information')
    parser.add_argument('--verbose', '-v', action='store_true',
                        help='Enable verbose logging')
    parser.add_argument('--retries', '-r', type=int, default=2,
                        help='Number of retries for LLM API calls')
    parser.add_argument('--max-tokens', '-t', type=int, default=2000,
                        help='Maximum tokens per chunk')
    parser.add_argument('--cache-dir', '-c', default=None,
                        help='Directory to cache intermediate results')
    parser.add_argument('--log-file', '-l', default=None,
                        help='Path to log file')
    parser.add_argument('--no-narrative-analysis', action='store_true',
                    help='Skip enhanced narrative structure analysis')
    parser.add_argument('--parallel-extraction', action='store_true',
                    help='Enable scene-by-scene element extraction in parallel with summary-based extraction')
    
    args = parser.parse_args()
    
    # Set up logging
    logger = setup_logging(args.verbose, args.log_file)
    
    # Generate default output paths if needed
    if not args.output_json and not args.output_markdown:
        base_name = Path(args.script_file).stem
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M")
        output_dir = f"{base_name}_bible_{timestamp}"
        
        args.output_json = os.path.join(output_dir, f"{base_name}_bible.json")
        args.output_markdown = os.path.join(output_dir, f"{base_name}_bible.md")
        
        logger.info(f"Using auto-generated output paths in '{output_dir}'")
    
    # Create cache directory if specified
    cache_dir = args.cache_dir
    if cache_dir:
        os.makedirs(cache_dir, exist_ok=True)
        logger.info(f"Using cache directory: {cache_dir}")
    
    # Read the script file
    try:
        with open(args.script_file, "r", encoding="utf-8") as f:
            script_text = f.read()
        logger.info(f"Read script file: {args.script_file} ({len(script_text)} characters)")
    except Exception as e:
        logger.error(f"Failed to read script file {args.script_file}: {str(e)}")
        sys.exit(1)
    
    # Initialize generator and process script
    generator = StoryBibleGenerator(logger=logger, cache_dir=cache_dir)
    story_bible = generator.process_screenplay(
        script_text=script_text,
        detail_level=args.detail_level,
        extract_elements=not args.no_elements,
        enhance_characters=not args.no_character_enhancement,
        include_narrative_analysis=not args.no_narrative_analysis,
        use_parallel_extraction=args.parallel_extraction,  # New parameter
        retry_count=args.retries,
        max_tokens_per_chunk=args.max_tokens,
        output_markdown_path=args.output_markdown
    )
    
    # Save JSON output
    if args.output_json:
        generator.save_story_bible(story_bible, args.output_json)
    
    # Markdown is now saved directly in process_screenplay if args.output_markdown was provided
    # So we only need to save it here if it wasn't already saved
    if args.output_markdown and "markdown" in story_bible and not hasattr(generator, '_markdown_saved'):
        markdown_text = story_bible["markdown"]
        generator.save_markdown(markdown_text, args.output_markdown)
    
    # Print summary
    logger.info("\n========== STORY BIBLE SUMMARY ==========")
    logger.info(f"Summary length: {len(story_bible['summary'])} characters")
    
    if story_bible.get('elements'):
        elements = story_bible['elements']
        logger.info(f"Characters: {len(elements.get('characters', []))}")
        logger.info(f"Locations: {len(elements.get('locations', []))}")
        logger.info(f"Themes: {len(elements.get('themes', []))}")
        logger.info(f"Plot points: {len(elements.get('plot_points', []))}")
        logger.info(f"Conflicts: {len(elements.get('conflicts', []))}")
    
    logger.info(f"Processing completed in {story_bible['metadata']['processing_time_seconds']/60:.2f} minutes")
    
    return story_bible


if __name__ == "__main__":
    main()