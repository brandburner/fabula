# The code takes a list of Doctor Who story titles from JSON files, retrieves the corresponding Wikipedia articles for each story, and saves the content of those articles to separate text files in a structured directory. It cleans up the story titles to create valid filenames and includes error handling to gracefully deal with potential issues.

import json
import os
import re

from wikipedia import page

# create the folder if it doesn't exist
os.makedirs("source_docs/doctor_who/doctor7/wikipedia", exist_ok=True)

for filename in os.listdir("source_docs/doctor_who/doctor7/json"):
    if filename.endswith(".json"):
        with open(os.path.join("source_docs/doctor_who/doctor7/json", filename), "r") as f:
            data = json.load(f)
            story_title = data["Story"]
            # sanitize the story title for filename
            snake_case_title = re.sub(r"[^a-zA-Z0-9 ]", "", story_title).replace(" ", "_").lower()
            try:
                wiki_page = page(f"{story_title} Doctor Who")
                with open(
                    f"source_docs/doctor_who/doctor7/wikipedia/{snake_case_title}_wikipedia.txt", "w"
                ) as outfile:
                    outfile.write(wiki_page.content)
            except Exception as e:
                print(f"Error processing {story_title}: {e}")
