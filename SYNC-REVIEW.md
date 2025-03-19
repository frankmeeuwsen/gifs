# GIF Sync Review

## Overview

This repository maintains a Hugo-based site for organizing and displaying GIFs while integrating content from the upstream repository [jglovier/gifs](https://github.com/jglovier/gifs). The setup bridges two different approaches:

1. **Our Repository** (`main` branch): Hugo-based site with organized GIF content
2. **Upstream Repository** (`gh-pages` branch): Original Jekyll-based implementation

## Steps Taken

1. **Repository Initialization**
   - Initialized a Git repository with a README
   - Added Hugo framework files

2. **Remote Setup**
   - Added your GitHub repository as origin: `git@github.com:frankmeeuwsen/gifs.git`
   - Added the original repository as upstream: `https://github.com/jglovier/gifs.git`

3. **Branch Structure**
   - `main`: Our Hugo-based site with all GIFs
   - `gh-pages`: Mirror of the upstream repository's gh-pages branch

4. **Content Sync**
   - Created `sync-new-gifs.sh` script to automate GIF synchronization
   - Added 37 new category directories
   - Synced 141 new GIFs from upstream while preserving our existing content

## Sync Script Explanation

The `sync-new-gifs.sh` script performs the following functions:
- Creates any missing GIF category directories found in upstream
- Identifies GIFs in upstream that are missing in our content directory
- Copies those files into the correct locations in our Hugo structure
- Preserves existing GIFs (no overwriting)

## Tips for Future Updates

### Regular Sync Process

To update your repository with new GIFs from upstream:

```bash
# 1. Update the upstream reference
git fetch upstream

# 2. Run the sync script to copy new GIFs
./sync-new-gifs.sh

# 3. Commit and push the new GIFs
git add content/
git commit -m "Sync new GIFs from upstream"
git push origin main
```

### Advantages of This Approach

- **Separation of Concerns**: Keeps upstream GIFs available while maintaining your Hugo site
- **No Merge Conflicts**: Avoids dealing with complex merge conflicts between different site generators
- **Best of Both Worlds**: Access to all GIFs from upstream while keeping your preferred site structure
- **Automation**: The sync script makes updates easy and repeatable

### Potential Improvements

- Add a timestamp file to track when the last sync was performed
- Add command-line options to the script for selective syncing
- Create a GitHub Action to periodically sync new GIFs automatically

### When to Sync

Consider running the sync process:
- Monthly to keep your collection current
- When you notice useful new GIFs added to the upstream repository
- Before making major changes to your site

## Conclusion

This hybrid approach allows you to maintain your own Hugo-based GIF site while staying current with the upstream repository's growing collection - all without dealing with complex merge conflicts between different static site generators.