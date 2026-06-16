#!/bin/bash
echo "Clone\update from sources"
echo "$FEED_DIR"
rm -rf "$FEED_DIR"
mkdir -p "$FEED_DIR"

# Clone or check repos
for repo in "${repos[@]}"; do
    set -- $repo
    echo "Clone $1"
    clone_repo "$1" "$GIT_DIR/$2" "$3" "$4"
done