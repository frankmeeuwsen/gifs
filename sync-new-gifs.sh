#\!/bin/bash

# Create new directories
for dir in $(git ls-tree -d --name-only upstream/gh-pages | grep -v "^_" | grep -v "^\."); do
  if [ \! -d "content/gifs/$dir" ]; then
    echo "Creating directory: content/gifs/$dir"
    mkdir -p "content/gifs/$dir"
  fi
done

# Get list of GIFs from upstream
git ls-tree -r --name-only upstream/gh-pages | grep -i "\.\(gif\|jpg\|png\)$" | grep -v "^_" | grep -v "^content/" > /tmp/upstream-gifs.txt

# Copy new GIFs
while read -r file; do
  target="content/gifs/$file"
  if [ \! -f "$target" ]; then
    dir=$(dirname "$target")
    mkdir -p "$dir"
    echo "Copying new file: $file"
    git show "upstream/gh-pages:$file" > "$target"
  fi
done < /tmp/upstream-gifs.txt

rm /tmp/upstream-gifs.txt
echo "Done\! New GIFs have been copied from upstream."
