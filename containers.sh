#!/bin/sh
# Copyright (c) 2022 Praveen Kumar S

set -e

# Include config
. $(dirname $0)/config.sh

# Helper function to check if the container exists
container_exists ()
{
	test $(grep -xc "$1" "$CONTAINER_LIST") -ge 1
	return $?
}

# If container name is passed choose that else open dmenu prompt
if [ $# -ge 1 ]; then
	CONTAINER_NAME=$1
else
	CONTAINER_NAME=$( echo "$(cat $CONTAINER_LIST)" | $DMENU -p $DMENU_PROMPT $DMENU_FLAGS)
fi

# Check if container exists
if container_exists $CONTAINER_NAME; then
	BASE_DIR="$CONTAINER_BASE/$CONTAINER_NAME"
	
	# Create base dir if it doesn't exist. This can happen for manually created containers
	if [ ! -d "$BASE_DIR" ]; then
		mkdir $BASE_DIR
	fi
	qutebrowser -B $BASE_DIR -C $CONFIG_FILE -s window.title_format " {perc}[$CONTAINER_NAME]{title_sep}{current_title}"
else
	echo "NOT EXIST"
fi
