import os
import glob


def concatenate_python_files(folder_path, output_file="combined_code.txt"):
    """
    Concatenates all Python files in a folder into a single text file.

    Args:
        folder_path: The path to the folder containing the Python files.
        output_file: The name of the output text file (default: "combined_code.txt").
    """

    if not os.path.isdir(folder_path):
        print(f"Error: '{folder_path}' is not a valid directory.")
        return

    python_files = glob.glob(os.path.join(folder_path, "*.py"))
    
    # Add the specific .baml file
    baml_file = "/home/user/langchain/baml_src/myth06.baml"
    all_files_to_concatenate = python_files + [baml_file]

    if not python_files:
        print(f"No Python files found in '{folder_path}'.")
        return

    try:
        with open(output_file, "w", encoding="utf-8") as outfile:
            for file_path in all_files_to_concatenate:
                if os.path.exists(file_path):
                    try:
                        with open(file_path, "r", encoding="utf-8") as infile:
                            outfile.write(f"----- File: {file_path} -----\n")
                            outfile.write(infile.read())
                            outfile.write("\n\n")
                    except UnicodeDecodeError:
                        print(f"Warning: Could not decode file {file_path} using utf-8, skipping this file")
                else:
                  print(f"Warning: Could not find file {file_path}, skipping")

            

            


        print(f"Successfully concatenated {len(python_files)} Python files into '{output_file}'.")

    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage:
folder_to_scan = "."  # Replace with the actual folder path if needed.
concatenate_python_files(folder_to_scan)
