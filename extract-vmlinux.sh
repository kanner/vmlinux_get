#!/bin/bash
if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "Usage: $0 <vmlinuZ> <vmlinuX>"
	exit 0;
fi

KERNEL_IMG="$1"
GZIP_START="$(grep -a -b -o -m 1 -P "\x1f\x8b\x08\x00" $KERNEL_IMG | cut -d: -f 1)"
dd if=$KERNEL_IMG skip=$GZIP_START bs=1 | zcat > $2
