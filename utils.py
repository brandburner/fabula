# utils.py
from typing import List, Dict, Optional
import json
import logging
from pathlib import Path
import re
from datetime import datetime

logger = logging.getLogger(__name__)

def load_json(file_path: Path) -> Dict:
    """Load and parse a JSON file."""
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        logger.error(f"Error loading JSON from {file_path}: {e}")
        raise

def save_json(data: Dict, file_path: Path) -> None:
    """Save data to a JSON file."""
    try:
        # Ensure the directory exists
        file_path.parent.mkdir(parents=True, exist_ok=True)
        
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=4)
    except Exception as e:
        logger.error(f"Error saving JSON to {file_path}: {e}")
        raise

def load_and_concatenate_context(file_paths: List[str]) -> str:
    """Load all context files and combine them."""
    contents = []
    for file_path_str in file_paths:
        file_path = Path(file_path_str)
        logger.info(f"  Checking context file: {file_path}")
        if (
            file_path.exists()
            and file_path.is_file()
            and file_path.suffix.lower() in (".txt", ".md")
        ):
            logger.info(f"    Loading context from: {file_path}")
            with open(file_path, "r", encoding="utf-8") as f:
                contents.append(f.read())
        else:
            logger.warning(f"    Skipping invalid context file: {file_path}")
    return "\n\n".join(contents)

def setup_logging(log_dir: Path, log_level: int = logging.DEBUG) -> None:
    """Set up logging configuration."""
    # Ensure log directory exists
    log_dir.mkdir(parents=True, exist_ok=True)
    
    # Create timestamped log filename
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    log_file = log_dir / f"story_processor_{timestamp}.log"
    
    # Configure logging
    logging.basicConfig(
        level=log_level,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        handlers=[
            logging.FileHandler(log_file),
            logging.StreamHandler()  # Also log to console
        ]
    )

def validate_file_paths(
    input_path: Path,
    output_path: Path,
    context_paths: List[Path]
) -> bool:
    """Validate all file paths before processing."""
    # Check input file
    if not input_path.exists():
        logger.error(f"Input file does not exist: {input_path}")
        return False
    if not input_path.is_file():
        logger.error(f"Input path is not a file: {input_path}")
        return False
    if input_path.suffix.lower() != '.json':
        logger.error(f"Input file must be JSON: {input_path}")
        return False

    # Check output directory
    if output_path.exists() and not output_path.is_file():
        logger.error(f"Output path exists but is not a file: {output_path}")
        return False
    if not output_path.parent.exists():
        logger.warning(f"Output directory does not exist, will create: {output_path.parent}")

    # Check context files
    for context_path in context_paths:
        if not context_path.exists():
            logger.warning(f"Context file does not exist: {context_path}")
            continue
        if not context_path.is_file():
            logger.warning(f"Context path is not a file: {context_path}")
            continue
        if context_path.suffix.lower() not in ('.txt', '.md'):
            logger.warning(f"Context file should be .txt or .md: {context_path}")
            continue

    return True

def sanitize_filename(filename: str) -> str:
    """Sanitize a filename to be safe for all operating systems."""
    # Remove invalid characters
    filename = re.sub(r'[<>:"/\\|?*]', '', filename)
    # Remove control characters
    filename = "".join(char for char in filename if ord(char) >= 32)
    return filename.strip()

def create_backup(file_path: Path) -> Optional[Path]:
    """Create a backup of a file if it exists."""
    if not file_path.exists():
        return None
        
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_path = file_path.parent / f"{file_path.stem}_backup_{timestamp}{file_path.suffix}"
    
    try:
        import shutil
        shutil.copy2(file_path, backup_path)
        logger.info(f"Created backup: {backup_path}")
        return backup_path
    except Exception as e:
        logger.error(f"Failed to create backup of {file_path}: {e}")
        return None

def load_config(config_path: Path) -> Dict:
    """Load configuration from a JSON file."""
    try:
        with open(config_path, 'r', encoding='utf-8') as f:
            config = json.load(f)
        return config
    except Exception as e:
        logger.error(f"Error loading config from {config_path}: {e}")
        raise

def merge_configs(base_config: Dict, override_config: Dict) -> Dict:
    """Deep merge two configuration dictionaries."""
    merged = base_config.copy()
    
    def deep_update(d: Dict, u: Dict) -> Dict:
        for k, v in u.items():
            if isinstance(v, dict) and k in d and isinstance(d[k], dict):
                d[k] = deep_update(d[k], v)
            else:
                d[k] = v
        return d
    
    return deep_update(merged, override_config)

class Timer:
    """Context manager for timing code execution."""
    def __init__(self, name: str):
        self.name = name
        self.start_time = None
        
    def __enter__(self):
        self.start_time = datetime.now()
        return self
        
    def __exit__(self, *args):
        duration = datetime.now() - self.start_time
        logger.info(f"{self.name} took {duration}")

def chunk_list(lst: List, chunk_size: int) -> List[List]:
    """Split a list into chunks of specified size."""
    return [lst[i:i + chunk_size] for i in range(0, len(lst), chunk_size)]

def flatten_dict(d: Dict, parent_key: str = '', sep: str = '_') -> Dict:
    """Flatten a nested dictionary."""
    items = []
    for k, v in d.items():
        new_key = f"{parent_key}{sep}{k}" if parent_key else k
        if isinstance(v, dict):
            items.extend(flatten_dict(v, new_key, sep=sep).items())
        else:
            items.append((new_key, v))
    return dict(items)

def unflatten_dict(d: Dict, sep: str = '_') -> Dict:
    """Restore a flattened dictionary to its nested structure."""
    result = {}
    for key, value in d.items():
        parts = key.split(sep)
        target = result
        for part in parts[:-1]:
            target = target.setdefault(part, {})
        target[parts[-1]] = value
    return result