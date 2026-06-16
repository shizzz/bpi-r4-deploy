CONFIG_PATH="$1"

source ./scripts/init.sh
source $BASE_DIR/scripts/helpers.sh
source $BASE_DIR/scripts/clone.sh
source $BASE_DIR/scripts/copy.sh
source $BASE_DIR/scripts/patches.sh
source $BASE_DIR/scripts/packages.sh "$CONFIG_PATH"