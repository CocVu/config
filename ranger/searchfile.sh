#!/bin/bash
for i in $(find $1 -maxdepth $2 -type f); do
	if grep -q $3 $i
	then
	echo "->" $i
	grep $3 $i
	fi
done
