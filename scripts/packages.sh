#!/bin/bash

CONFIG_PATH="$1"

if [ -z "$CONFIG_PATH" ]; then
    echo "CONFIG_PATH is not specified"
    return 1
fi

echo "Apply packages to $CONFIG_PATH"

set_config() {
    local key="$1"
    local value="$2"

    if grep -q "^${key}=" "$CONFIG_PATH"; then
        sed -i "s|^${key}=.*|${key}=${value}|" "$CONFIG_PATH"
    else
        echo "${key}=${value}" >> "$CONFIG_PATH"
    fi
}

# enable "y" flags
if [ -f "$Y_LIST" ]; then
    while read -r pkg; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

        echo "Apply CONFIG_PACKAGE_${pkg}=y"
        set_config "CONFIG_PACKAGE_${pkg}" "y"
    done < "$Y_LIST"
fi

# enable "m" flags
if [ -f "$M_LIST" ]; then
    while read -r pkg; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

        echo "Apply CONFIG_PACKAGE_${pkg}=m"
        set_config "CONFIG_PACKAGE_${pkg}" "m"
    done < "$M_LIST"
fi