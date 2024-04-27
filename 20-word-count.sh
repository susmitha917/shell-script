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

# Count occurrences of each word and store in associative array
declare -A word_count
while IFS=' ' read -r -a words; do
    for word in "${words[@]}"; do
        # Remove punctuation marks from the word
        word=$(echo "$word" | tr -d '[:punct:]')
        # Convert the word to lowercase
        word=$(echo "$word" | tr '[:upper:]' '[:lower:]')
        if [ -n "$word" ]; then
            ((word_count[$word]++))
        fi
    done
done < "$filename"

# Sort the words by count in descending order
sorted_words=$(for word in "${!word_count[@]}"; do
    echo "$word ${word_count[$word]}"
done | sort -nrk2)

# Display the top 5 most frequent words
echo "Top 5 most frequent words:"
echo "$sorted_words" | head -n 5
