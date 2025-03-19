import os
from openai import OpenAI

client = OpenAI()

SYSTEM_PROMPT = """You are a student assistant. He made a lot of .md notes but
wants to rewrite them. His new structure wants to move the "zettelkasten". from "tags" in frontmatter of the note to the "categories" list. It is "zettelkasten" NOT "zettlekasten"! Be SURE not to mix it up.

Additionally, he wants the notes to be more standardized. Sometimes the 
description is empty: then it needs to be filled.
Also: he wants to have a structure of Feynman method, where there is a QA structure. 
Note: there are some numerous math equations that may not have any description. In that case, label the arguments
Only use the $...$ as inline math, DO NOT USE \\(...\\) structure. Example: $a \\cdot b$ and NOT \\(a \\cdot b\\)
All in all, the notes need to have a proper structure to explain WHAT the concept is.

Finally, respond with the new file ONLY. do not use ```md ... ``` wrap or nothing!! 
student will use the output directly to save it as file!
"""


def make_new_note(old_note):
    completion = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[
            {
                "role": "system",
                "content": SYSTEM_PROMPT
            },
            {
                "role": "user",
                "content": old_note
            }
        ]
    )
    return completion.choices[0].message.content



def process_notes():
    notes_dir = '../notes'
    for filename in os.listdir(notes_dir):
        if not filename.endswith('.md'): continue

        file_path = os.path.join(notes_dir, filename)
        print("Reading note:", file_path)
        with open(file_path, 'r', encoding='utf-8') as file:
            old_note = file.read()
        proposed_note = make_new_note(old_note)
        print(f"\n--- Proposed Update for {filename} ---\n")
        while True:
            print(proposed_note)
            user_input = input("\nDo you accept the proposed note? [Y/n]: ")
            if user_input == 'skip':
                break
            if user_input == '':
                with open(file_path, 'w', encoding='utf-8') as file:
                    file.write(proposed_note)
                print(f"{filename} has been updated.\n")
                break
            suggestions = user_input
            old_note = f"Current Note:\n\n{proposed_note}\n\nSuggestions: {suggestions}"
            proposed_note = make_new_note(old_note)

def main():
    process_notes()


if __name__ == "__main__":
    main()
