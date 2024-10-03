#!/bin/bash

writefile=$1
writestr=$2

# Parameter check
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Please provide the path including filename as the 1st parameter and the string to write as the 2nd parameter."
    exit 1
fi

# Create the directory if it doesn't exist
dir_name=$(dirname "$writefile")

mkdir -p "$dir_name" || {
    echo "Error: Failed to create directory '$dir_name'."
    exit 1
}

# Write the string to the file, overwriting if it exists
echo "$writestr" > "$writefile" || {
    echo "Error: Failed to create/modify '$writefile'."
    exit 1
}

echo "Successfully wrote to '$writefile'."

