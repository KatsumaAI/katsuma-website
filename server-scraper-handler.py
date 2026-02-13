import subprocess
import json
import os

def fetchYouTubeStats():
    scraper_path = os.path.join(os.path.dirname(__file__), "youtube-scrapy-scraper")
    process = subprocess.Popen([
        "python3", "scraper.py"],
        cwd=scraper_path,
        stdout=subprocess.PIPE
    )
    stdout, _ = process.communicate()

    try:
        return json.loads(stdout)
    except json.JSONDecodeError:
        raise ValueError('Invalid JSON response from YouTube scraper.')