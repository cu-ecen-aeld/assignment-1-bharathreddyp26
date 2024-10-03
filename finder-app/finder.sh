#!/bin/bash

filesdir=$1
searchstr=$2


# parameter check
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
	echo "failed please provide the path as 1st parameter and search string as the 2nd parameter"
	exit 1
fi

# files check if it is directory or not
if [ ! -d "$filesdir" ]; then
	echo "Failed $filesdir is not a directory"
	exit 1
fi

# no of files 
files_count=$(find "$filesdir" -type f | wc -l)
# no of matching lines found in respective files

match_lines=$(grep -r -c "$searchstr" "$filesdir" | awk -F: '{sum += $2} END {print sum}')

# printing the result
echo "The number of files are $files_count and the number of matching lines are $match_lines"

