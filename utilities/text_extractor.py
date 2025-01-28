import pymupdf4llm
import pathlib

md_text = pymupdf4llm.to_markdown("/home/user/langchain/graveyard/Building-Knowledge-Graphs-Practitioner's-Guide-OReilly-book.pdf")

pathlib.Path("/home/user/langchain/graveyard/Building-Knowledge-Graphs-Practitioner's-Guide-OReilly-book.md").write_bytes(md_text.encode())
