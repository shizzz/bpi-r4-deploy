#!/bin/bash
# Copy packages
echo "Copy packages"
for rule in "${copy_rules[@]}"; do
    set -- $rule
    copy_dir "$GIT_DIR/$1" "$FEED_DIR/$2"
done