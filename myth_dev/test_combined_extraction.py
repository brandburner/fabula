#!/usr/bin/env python
# File: test_combined.py

import asyncio
import inspect
import logging
import sys
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Set, Tuple

# Configure logging to console with more detailed format
logging.basicConfig(
    level=logging.DEBUG,  # Use DEBUG to get maximum information
    format="%(asctime)s - %(levelname)s - %(name)s - %(message)s",
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler("import_test.log")  # Also save to a file for reference
    ]
)

logger = logging.getLogger("import_test")

# Define the functions we're expecting to import
EXPECTED_FUNCTIONS = {
    "episode_processor": [
        "extract_secondary_entities_combined"
    ],
    "scene_processor": [
        "process_scene_data_combined",
        "extract_scene_data_combined",
        "extract_event_interactions_combined"
    ]
}

# Define expected function signatures (simplified)
EXPECTED_SIGNATURES = {
    "extract_secondary_entities_combined": ["episode", "global_context"],
    "process_scene_data_combined": ["scene", "global_context", "scene_number", "scene_uuid"],
    "extract_scene_data_combined": ["scene", "global_context", "scene_number", "scene_uuid"],
    "extract_event_interactions_combined": ["scene_text", "registry_context", "story_synopsis", "event", "scene_number"]
}

def check_function_implementation(func: Callable, expected_name: str) -> Tuple[bool, str]:
    """
    Check if the function implementation looks valid.
    Returns (is_valid, message).
    """
    if not callable(func):
        return False, f"{expected_name} is not callable"
    
    # Check if function has an implementation (not just a forward declaration)
    source = inspect.getsource(func)
    if len(source.strip().split('\n')) <= 2:  # Very short function might be just a stub
        return False, f"{expected_name} appears to be a stub (too short)"
    
    # Check if function has the expected parameters
    if expected_name in EXPECTED_SIGNATURES:
        sig = inspect.signature(func)
        params = list(sig.parameters.keys())
        expected_params = EXPECTED_SIGNATURES[expected_name]
        
        # Check if required parameters exist (allows for additional params)
        missing_params = [p for p in expected_params if p not in params]
        if missing_params:
            return False, f"{expected_name} is missing expected parameters: {missing_params}"
    
    return True, f"{expected_name} appears to be properly implemented"

async def test_imported_function(func: Callable, name: str) -> bool:
    """Test if an imported function exists and is callable."""
    if func is None:
        logger.error(f"Function {name} was not imported")
        return False
    
    is_valid, message = check_function_implementation(func, name)
    if not is_valid:
        logger.error(message)
        return False
    
    logger.info(message)
    return True

async def check_module_exports(module_name: str) -> None:
    """Check what a module actually exports."""
    try:
        module = __import__(module_name, fromlist=['__all__'])
        if hasattr(module, '__all__'):
            logger.info(f"Module {module_name} exports: {module.__all__}")
        else:
            # If no __all__, check all non-underscore attributes
            exports = [x for x in dir(module) if not x.startswith('_')]
            logger.info(f"Module {module_name} doesn't have __all__, contains: {exports}")
    except Exception as e:
        logger.error(f"Error checking exports for {module_name}: {e}")

async def test_specific_function_execution() -> None:
    """
    Test actual execution of a small subset of functions 
    with minimal mock parameters to see if they run.
    """
    try:
        from scene_processor import process_scene_data_combined
        
        # Create minimal mock objects for testing
        scene = {"Scene": "Test", "Dialogue": []}
        global_context = type('obj', (object,), {
            'entity_registry': type('obj', (object,), {
                'get_agent_name_to_uuid_mapping': lambda: {},
                'agents': {},
                'organizations': {},
                'locations': {},
                'objects': {},
                'find_entity_by_uuid': lambda x: None
            }),
            'get_registry_context': lambda: "Test context",
            'get_story_summary': lambda: "Test summary"
        })
        
        # Try to call the function with minimal parameters
        logger.info("Attempting to execute process_scene_data_combined with mock data...")
        try:
            result = await process_scene_data_combined(scene, global_context, 1, "scene_1")
            logger.info("Successfully executed process_scene_data_combined")
        except Exception as e:
            logger.error(f"Error executing process_scene_data_combined: {e}", exc_info=True)
    
    except ImportError as e:
        logger.error(f"Could not import process_scene_data_combined for execution test: {e}")

async def test_source_code_examination() -> None:
    """
    Directly examine the source code files to look for function definitions 
    and potential issues with imports.
    """
    files_to_examine = ["episode_processor.py", "scene_processor.py", "main.py"]
    
    for filename in files_to_examine:
        try:
            with open(filename, 'r') as file:
                content = file.read()
                
            # Look for function definitions with specific patterns
            logger.info(f"Scanning {filename} for combined function definitions...")
            
            for func_name in [
                "extract_secondary_entities_combined", 
                "process_scene_data_combined",
                "extract_scene_data_combined",
                "extract_event_interactions_combined"
            ]:
                if f"def {func_name}" in content:
                    # Extract the function signature to check parameters
                    import re
                    pattern = f"def {func_name}\\(([^)]+)\\)"
                    matches = re.search(pattern, content)
                    if matches:
                        params = matches.group(1)
                        logger.info(f"Found function '{func_name}' in {filename} with params: {params}")
                    else:
                        logger.info(f"Found function '{func_name}' in {filename} but couldn't extract params")
                else:
                    logger.info(f"Function '{func_name}' NOT found in {filename}")
                    
            # Look for imports of these functions
            for func_name in [
                "extract_secondary_entities_combined", 
                "process_scene_data_combined"
            ]:
                import_patterns = [
                    f"from .+ import {func_name}",
                    f"from .+ import .+, {func_name}",
                    f"import {func_name}"
                ]
                
                for pattern in import_patterns:
                    import re
                    matches = re.search(pattern, content)
                    if matches:
                        logger.info(f"Found import of '{func_name}' in {filename}: {matches.group(0)}")
            
        except Exception as e:
            logger.error(f"Error examining {filename}: {e}")

async def main():
    """Main test function to check all imports."""
    logger.info("Starting comprehensive import test")
    
    # Track overall success
    all_imports_successful = True
    imported_functions = {}
    
    # Step 1: Check individual imports of each function with detailed error reporting
    logger.info("Testing individual imports of each function...")
    
    for module_name, functions in EXPECTED_FUNCTIONS.items():
        for function_name in functions:
            full_name = f"{module_name}.{function_name}"
            try:
                # Dynamic import with error handling
                exec(f"from {module_name} import {function_name} as test_func")
                func = locals()['test_func']
                imported_functions[full_name] = func
                logger.info(f"Successfully imported {full_name}")
            except ImportError as e:
                logger.error(f"Failed to import {full_name}: {e}")
                all_imports_successful = False
            except Exception as e:
                logger.error(f"Unexpected error importing {full_name}: {e}", exc_info=True)
                all_imports_successful = False
    
    # Step 2: Check that each function has a proper implementation
    logger.info("Checking function implementations...")
    for name, func in imported_functions.items():
        function_name = name.split(".")[-1]
        if not await test_imported_function(func, function_name):
            all_imports_successful = False
    
    # Step 3: Check what each module actually exports
    logger.info("Checking module exports...")
    for module_name in EXPECTED_FUNCTIONS.keys():
        await check_module_exports(module_name)
    
    # Step 4: Examine the actual source code for function definitions
    logger.info("Examining source code...")
    await test_source_code_examination()
    
    # Step 5: Try executing one of the functions with minimal mocked arguments
    logger.info("Testing actual function execution...")
    await test_specific_function_execution()
    
    # Print final result
    if all_imports_successful:
        logger.info("✅ All required functions successfully imported!")
        print("SUCCESS: All combined functions imported correctly")
    else:
        logger.error("❌ Some functions failed to import correctly")
        print("ERROR: Some combined functions failed to import correctly")
    
    return 0 if all_imports_successful else 1

if __name__ == "__main__":
    exit_code = asyncio.run(main())
    sys.exit(exit_code)
