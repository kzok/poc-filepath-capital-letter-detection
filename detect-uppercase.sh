#!/usr/bin/env bash

set -euo pipefail

log() {
	echo -e "${1}" >&2
}

usage() {
	echo -e "Usage: git ls-files <glob-what-you-want-to-check> | $(basename $0)"
}

# fail if STDIN isn't provided
if [ -t 0 ]; then
	usage
	exit 1
fi

RESULT=$(cat - | grep -E '[[:upper:]]' || true)
if [ -z "$RESULT" ]; then
	log 'No UPPERCASE were detected.'
	exit 0
fi

log 'Error: UPPERCASE were detected in the following file paths.\n'
for i in $RESULT; do
	echo $i
done
exit 1
