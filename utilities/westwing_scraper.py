import requests
from bs4 import BeautifulSoup
import json
import os
from baml_client import b
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

def scrape_and_extract(url, max_retries=3, retry_delay=1):
    """
    Scrapes a given URL, extracts only the relevant text using Beautiful Soup,
    then extracts data using BAML and saves JSON. Includes retries for failed requests.

    Args:
        url: The URL of the wiki page to process.
        max_retries: Maximum number of retries for a failed request.
        retry_delay: Delay in seconds between retries.
    """
    session = requests.Session()
    retry = Retry(connect=max_retries, read=max_retries, backoff_factor=retry_delay)
    adapter = HTTPAdapter(max_retries=retry)
    session.mount("http://", adapter)
    session.mount("https://", adapter)

    try:
        print(f"Fetching URL: {url}")
        response = session.get(url, timeout=10)
        response.raise_for_status()  # Raise HTTPError for bad responses (4xx or 5xx)
        html_content = response.text

        print("Parsing HTML with Beautiful Soup...")
        soup = BeautifulSoup(html_content, 'html.parser')
        
        # Extract all text
        text_content = soup.get_text(separator=' ', strip=True)

        print("Extracting data with BAML...")
        wiki_data = b.ExtractAllWikiData(text=text_content)
        print("Data extraction complete!")


        # Create the output directory if it doesn't exist
        output_dir = "output"
        os.makedirs(output_dir, exist_ok=True)
        
        # Extract title for filename
        title = wiki_data.metadata.title if wiki_data.metadata else "unknown_title"
        
        #Sanitize filename to be safe
        sanitized_title = "".join(c if c.isalnum() else "_" for c in title)
        output_filename = os.path.join(output_dir, f"{sanitized_title}.json")

        print(f"Writing JSON to: {output_filename}")
        with open(output_filename, 'w', encoding='utf-8') as f:
            json.dump(wiki_data.dict(exclude_none=True), f, indent=2)
        print(f"Successfully processed and saved {title}")

    except requests.exceptions.RequestException as e:
         print(f"Error fetching URL: {e}")
    except Exception as e:
         print(f"An error occurred during processing: {e}")


if __name__ == "__main__":
    # Define the URLs of the story pages you want to scrape here
    story_urls = [
"https://westwing.fandom.com/wiki/In_the_Shadow_of_Two_Gunmen_(Part_I)",
"https://westwing.fandom.com/wiki/In_the_Shadow_of_Two_Gunmen_(Part_II)",
"https://westwing.fandom.com/wiki/The_Midterms",
"https://westwing.fandom.com/wiki/In_This_White_House",
"https://westwing.fandom.com/wiki/And_It's_Surely_to_Their_Credit",
"https://westwing.fandom.com/wiki/The_Lame_Duck_Congress",
"https://westwing.fandom.com/wiki/The_Portland_Trip",
"https://westwing.fandom.com/wiki/Shibboleth",
"https://westwing.fandom.com/wiki/Galileo",
"https://westwing.fandom.com/wiki/Noël",
"https://westwing.fandom.com/wiki/The_Leadership_Breakfast",
"https://westwing.fandom.com/wiki/The_Drop-In",
"https://westwing.fandom.com/wiki/Bartlet's_Third_State_of_the_Union",
"https://westwing.fandom.com/wiki/The_War_at_Home",
"https://westwing.fandom.com/wiki/Ellie",
"https://westwing.fandom.com/wiki/Somebody's_Going_to_Emergency,_Somebody's_Going_to_Jail",
"https://westwing.fandom.com/wiki/The_Stackhouse_Filibuster",
"https://westwing.fandom.com/wiki/17_People",
"https://westwing.fandom.com/wiki/Bad_Moon_Rising",
"https://westwing.fandom.com/wiki/The_Fall's_Gonna_Kill_You",
"https://westwing.fandom.com/wiki/18th_and_Potomac",
"https://westwing.fandom.com/wiki/Two_Cathedrals"

        
        # Add more story URLs
    ]
    for url in story_urls:
        scrape_and_extract(url)