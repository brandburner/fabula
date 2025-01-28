import json
import os
import re

from wikipedia import page, search
from bs4 import BeautifulSoup

# create the folder if it doesn't exist
os.makedirs("source_docs/west_wing/season2/wikipedia", exist_ok=True)

for filename in os.listdir("source_docs/west_wing/season2/json"):
    if filename.endswith(".json"):
        with open(os.path.join("source_docs/west_wing/season2/json", filename), "r") as f:
            data = json.load(f)
            story_title = data["Series"]
            # sanitize the story title for filename
            snake_case_title = re.sub(r"[^a-zA-Z0-9 ]", "", story_title).replace(" ", "_").lower()
            try:
                # Search for the page title, allow for suggestion
                search_results = search(f"{story_title} (The West Wing episode)")
                if search_results:
                    wiki_page = page(search_results[0], auto_suggest=False)  # Use the first result
                    with open(
                        f"source_docs/west_wing/season2/wikipedia/{snake_case_title}_wikipedia.txt", "w"
                    ) as outfile:
                        outfile.write(wiki_page.content)
                else:
                    print(f"No search results found for {story_title}")
            except Exception as e:
                print(f"Error processing {story_title}: {e}")
