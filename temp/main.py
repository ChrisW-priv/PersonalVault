import os
import frontmatter
import json
import yaml


def process_notes():
    notes_dir = '../notes'
    for filename in os.listdir(notes_dir):
        if not filename.endswith('.md'):
            continue

        file_path = os.path.join(notes_dir, filename)
        print("Processing note:", file_path)
        with open(file_path, 'r', encoding='utf-8') as file:
            post = frontmatter.load(file)

        # Ensure required attributes
        frontmatter_changed = False
        metadata = post.metadata
        
        # Ensure 'title'
        if 'title' not in metadata:
            metadata['title'] = filename.replace('.md', '')
            frontmatter_changed = True

        # Ensure 'date'
        if 'date' not in metadata:
            metadata['date'] = '2020-01-01'
            frontmatter_changed = True

        # Ensure 'description'
        description = metadata.get('description')
        if not isinstance(description, str) or not description.strip():
            metadata['description'] = ''
            frontmatter_changed = True

        # Ensure 'tags' as a list
        if 'tags' not in metadata:
            metadata['tags'] = metadata.get('tags', [])
            frontmatter_changed = True

        # Ensure 'categories' as a list
        if 'categories' not in metadata:
            metadata['categories'] = metadata.get('categories', [])
            frontmatter_changed = True

        # Move 'zettelkasten' from tags to categories if present
        if 'zettelkasten' in metadata['tags']:
            if 'zettelkasten' not in metadata['categories']:
                metadata['categories'].append('zettelkasten')
            metadata['tags'].remove('zettelkasten')
            frontmatter_changed = True

        if frontmatter_changed:
            post.metadata = metadata
            with open(file_path, 'w', encoding='utf-8') as file:
                updated_content = frontmatter.dumps(post)
                file.write(updated_content)
            print(f"Updated frontmatter for {filename}.\n")
        else:
            print(f"No changes needed for {filename}.\n")

def main():
    process_notes()


if __name__ == "__main__":
    main()
