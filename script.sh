#!/bin/sh
# Checking for filename in argument list
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

output_filename="timestamped_$1"

echo "simulation performance tracking enabled, tracking file $1, output saved in file $output_filename"

inotifywait -q -m -e modify . |
	while read -r directory events filename; do
		if [ "$filename" = "$1" ]; then
			stat -c "%z" $1 >> $output_filename;
			tail -n 12 $1 | grep "Step" -A 1 >> $output_filename
		fi
	done
