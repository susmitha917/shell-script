#!/bin/bash

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File '$filename' not found."
    exit 1
fi

# Read the header
read -r header < "$filename"

# Transpose the data
transpose_data=$(awk '
{
    for (i = 1; i <= NF; i++) {
        if (NR == 1) {
            header[i] = $i
        } else {
            data[i, NR - 1] = $i
        }
    }
}
END {
    for (i = 1; i <= NF; i++) {
        printf "%s", header[i]
        for (j = 1; j < NR; j++) {
            printf " %s", data[i, j]
        }
        printf "\n"
    }
}' "$filename")

# Print the transposed data
echo "$transpose_data"
