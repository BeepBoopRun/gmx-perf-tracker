#!/bin/bash

# Checking for filename in argument list
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

output_filename="timestamped_$1"

echo "simulation performance tracking enabled, tracking file $1, output saved in file $output_filename"

echo "$1" | entr -s "tail -n 1 | timestamped_$1"


