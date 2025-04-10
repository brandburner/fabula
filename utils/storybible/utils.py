# --- START OF FILE utils.py ---

#!/usr/bin/env python3
"""
Utilities for the Story Bible Generator.
Includes logging setup, caching decorator, and data conversion helpers.
"""

import logging
import sys
import functools
import pickle
import hashlib
from pathlib import Path
import datetime
from typing import Any, Dict, Optional, Callable

# --- Logging Setup ---
def setup_logging(verbose: bool = False, log_file: Optional[str] = None) -> logging.Logger:
    """Configures logging for the application."""
    log_level = logging.DEBUG if verbose else logging.INFO
    log_format = '%(asctime)s - %(levelname)s - %(name)s - %(message)s'
    handlers = [logging.StreamHandler(sys.stdout)]
    if log_file:
        try:
            log_path = Path(log_file)
            log_path.parent.mkdir(parents=True, exist_ok=True)
            handlers.append(logging.FileHandler(log_file, encoding='utf-8'))
        except Exception as e:
            print(f"Warning: Could not configure log file at {log_file}: {e}")

    # Clear existing handlers if any exist (e.g., during re-runs in interactive sessions)
    root_logger = logging.getLogger()
    if root_logger.hasHandlers():
        root_logger.handlers.clear()

    logging.basicConfig(level=log_level, format=log_format, handlers=handlers, force=True)

    # Silence overly verbose libraries if not in verbose mode
    logging.getLogger("httpx").setLevel(logging.WARNING if not verbose else logging.DEBUG)

    return logging.getLogger('StoryBibleGen')


# --- BAML Caching Decorator ---
# Modified slightly to potentially accept cache_dir via kwargs if needed,
# but primarily relies on args[0] or explicit kwarg 'cache_dir_override'
def baml_cache(cache_dir_arg_index: Optional[int] = None, cache_dir_kwarg_name: str = 'cache_dir_override') -> Callable:
    """
    Caching decorator for BAML function calls.

    Looks for cache directory path in this order:
    1. Keyword argument named `cache_dir_kwarg_name` passed to the decorated function.
    2. An argument at `cache_dir_arg_index` in the decorated function's args,
       assuming it's an object with a `cache_dir` attribute OR the path string itself.
       (Original behavior checked args[0] for an object with .cache_dir)
    """
    def decorator(func: Callable) -> Callable:
        @functools.wraps(func)
        def wrapper(*args, **kwargs) -> Any:
            actual_cache_dir = None
            logger_instance = logging.getLogger('StoryBibleGen') # Default logger

            # 1. Check explicit kwarg override
            if cache_dir_kwarg_name in kwargs:
                actual_cache_dir = kwargs[cache_dir_kwarg_name]
                # Attempt to find logger in args or kwargs if cache_dir was explicit
                found_logger = False
                for arg in args:
                    if isinstance(arg, logging.Logger):
                        logger_instance = arg
                        found_logger = True
                        break
                if not found_logger and 'logger' in kwargs and isinstance(kwargs['logger'], logging.Logger):
                     logger_instance = kwargs['logger']

            # 2. Check argument at specified index (if kwarg not found)
            elif cache_dir_arg_index is not None and len(args) > cache_dir_arg_index:
                cache_dir_source = args[cache_dir_arg_index]
                if isinstance(cache_dir_source, (str, Path)):
                    actual_cache_dir = str(cache_dir_source)
                elif hasattr(cache_dir_source, 'cache_dir') and cache_dir_source.cache_dir:
                    actual_cache_dir = cache_dir_source.cache_dir
                # Try to find logger from the same source object or other args
                if hasattr(cache_dir_source, 'logger') and isinstance(cache_dir_source.logger, logging.Logger):
                    logger_instance = cache_dir_source.logger
                else: # Fallback search in other args/kwargs
                    for arg in args:
                        if isinstance(arg, logging.Logger):
                            logger_instance = arg; break
                    if 'logger' in kwargs and isinstance(kwargs['logger'], logging.Logger):
                         logger_instance = kwargs['logger']


            # If no cache dir found, execute function directly
            if not actual_cache_dir:
                return func(*args, **kwargs)

            # Generate Cache Key (careful with complex args)
            try:
                # Use positional args (excluding the cache_dir_source if it was an object)
                args_for_key = list(args)
                if cache_dir_arg_index is not None and len(args) > cache_dir_arg_index and hasattr(args[cache_dir_arg_index], 'cache_dir'):
                     args_for_key.pop(cache_dir_arg_index)

                key_parts = [func.__name__] + [repr(arg) for arg in args_for_key]
                # Add kwargs (excluding the cache_dir_override)
                kwargs_for_key = {k: v for k, v in kwargs.items() if k != cache_dir_kwarg_name}
                key_parts.extend([f"{k}={repr(v)}" for k, v in sorted(kwargs_for_key.items())])

                # Handle large text argument (assume it's often the second positional arg (index 1) after logger/config)
                potential_text_arg_index = 1 # Adjust if text arg position changes
                if len(args_for_key) > potential_text_arg_index and isinstance(args_for_key[potential_text_arg_index], str) and len(args_for_key[potential_text_arg_index]) > 1000:
                    script_hash = hashlib.sha256(args_for_key[potential_text_arg_index].encode('utf-8', errors='replace')).hexdigest()[:16]
                    # Replace the large text with its hash in the key parts
                    key_parts[1 + potential_text_arg_index] = f"script_hash={script_hash}" # Adjust index based on func name being [0]

                cache_key = hashlib.sha256("_".join(key_parts).encode('utf-8', errors='replace')).hexdigest()

            except Exception as key_e:
                logger_instance.warning(f"Cache key generation error for {func.__name__}: {key_e}. Skipping cache.")
                return func(*args, **kwargs)

            # Prepare cache file path
            try:
                cache_dir_path = Path(actual_cache_dir)
                cache_dir_path.mkdir(exist_ok=True, parents=True)
                cache_file = cache_dir_path / f"{func.__name__}_{cache_key[:16]}.pkl"
            except Exception as dir_e:
                logger_instance.warning(f"Cache directory/file path error {actual_cache_dir}: {dir_e}. Skipping cache.")
                return func(*args, **kwargs)

            # Check cache
            if cache_file.exists():
                try:
                    with open(cache_file, 'rb') as f:
                        cached_data = pickle.load(f)
                    logger_instance.info(f"Cache hit for {func.__name__}: {cache_file.name}")
                    return cached_data
                except Exception as load_e:
                    logger_instance.warning(f"Cache load error for {cache_file.name}: {load_e}. Recalculating.")

            # Execute and cache result
            result = func(*args, **kwargs)
            try:
                with open(cache_file, 'wb') as f:
                    pickle.dump(result, f, protocol=pickle.HIGHEST_PROTOCOL)
                logger_instance.info(f"Cached result for {func.__name__} to {cache_file.name}")
            except Exception as cache_e:
                logger_instance.warning(f"Cache write error for {cache_file.name}: {cache_e}")

            return result
        return wrapper
    return decorator


# --- Helper Method (_convert_to_dict) ---
def convert_to_dict(obj: Any, logger: Optional[logging.Logger] = None) -> Any:
    """Recursively converts objects (esp. BAML models) to JSON-serializable dicts."""
    local_logger = logger or logging.getLogger('StoryBibleGen')
    if hasattr(obj, 'model_dump'): # Check for Pydantic v2+
        return obj.model_dump(mode='json', exclude_unset=True)
    elif hasattr(obj, 'dict'): # Check for Pydantic v1
        return obj.dict(exclude_unset=True)
    elif isinstance(obj, list):
        return [convert_to_dict(item, local_logger) for item in obj]
    elif isinstance(obj, dict):
        return {str(k): convert_to_dict(v, local_logger) for k, v in obj.items()}
    elif isinstance(obj, (datetime.datetime, datetime.date)):
        return obj.isoformat()
    elif isinstance(obj, Path):
        return str(obj)
    elif isinstance(obj, (str, int, float, bool)) or obj is None:
        return obj
    else:
        # Use a default logger if none provided specifically here
        local_logger.debug(f"Converting unknown type {type(obj)} to string.")
        return str(obj)

# --- END OF FILE utils.py ---