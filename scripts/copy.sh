#!/bin/bash
# Copy packages
echo "Copy packages"
for rule in "${copy_rules[@]}"; do
    set -- $rule
    copy_dir "$BASE_DIR/$GIT_DIR/$1" "$BASE_DIR/$FEED_DIR/$2"
done