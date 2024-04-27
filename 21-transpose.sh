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
NR==FNR {
    if (NF > max_fields) {
        max_fields = NF
    }
    next
}
{
    for (i = 1; i <= NF; i++) {
        if (FNR == 1) {
            header[i] = $i
        } else {
            data[FNR-1, i] = $i
        }
    }
}
END {
    for (i = 1; i <= max_fields; i++) {
        printf "%s", header[i]
        for (j = 1; j < FNR; j++) {
            printf " %s", data[j, i]
        }
        printf "\n"
    }
}' "$filename" "$filename")

# Print the transposed data
echo "$transpose_data"
