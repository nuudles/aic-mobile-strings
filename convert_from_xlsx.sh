#!/bin/bash

for f in *.xlsx; do
	name=$(basename $f .xlsx)

	twineCSV totwine $f
	unexpand -t 2 $name.txt | sed '/[a-z]* = $/d; /^\s*$/d' > $name.twine

	rm $name.txt
done
