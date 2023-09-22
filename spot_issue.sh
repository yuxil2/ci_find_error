#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <bad_commit> <good_commit>"
    exit 1
fi

BAD_COMMIT=$1
GOOD_COMMIT=$2

git bisect start
git bisect bad $BAD_COMMIT
git bisect good $GOOD_COMMIT

echo "Starting binary search for the first bad commit..."

# Check if bisect has found the first bad commit
RESULT=$(git bisect run python test.py)

echo $RESULT

git bisect reset
