#!/bin/bash
echo "Init"

BASE_DIR="$(cd .. && pwd)"
WORK_DIR="openwrt"
SOURCES_DIR="sources"
CONFIG_DIR="scripts/configs"
FEED_DIR="$BASE_DIR/$SOURCES_DIR/my_feed"
GIT_DIR="$BASE_DIR/$SOURCES_DIR/git"
REPO_LIST="$BASE_DIR/$CONFIG_DIR/extra_repos.txt"
COPY_RULES_LIST="$BASE_DIR/$CONFIG_DIR/extra_copy_rules.txt"
Y_LIST="$BASE_DIR/$CONFIG_DIR/enable_y.txt"
M_LIST="$BASE_DIR/$CONFIG_DIR/enable_m.txt"

repos=()
copy_rules=()

# Create 'extra_repos.txt' file to add you own repos. Do not forget \n at the end
if [ -f "$REPO_LIST" ]; then
    while IFS= read -r line; do
        [ -z "$line" ] && continue
        case "$line" in \#*) continue ;; esac
        repos+=("$line")
    done < "$REPO_LIST"
fi

# Create 'extra_copy_rules.txt' copy packages from repos
if [ -f "$COPY_RULES_LIST" ]; then
    while IFS= read -r line; do
        [ -z "$line" ] && continue
        case "$line" in \#*) continue ;; esac
        copy_rules+=("$line")
    done < "$COPY_RULES_LIST"
fi

if [ ! -d "$BASE_DIR/$SOURCES_DIR" ]; then
    mkdir -p "$BASE_DIR/$SOURCES_DIR"
fi
if [ ! -d "$BASE_DIR/$GIT_DIR" ]; then
    mkdir -p "$BASE_DIR/$GIT_DIR"
fi
if [ ! -d "$BASE_DIR/$SOURCES_DIR/downloads" ]; then
    mkdir -p $BASE_DIR/$SOURCES_DIR/downloads
fi