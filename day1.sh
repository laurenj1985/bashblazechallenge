#!/bin/bash

name="Lauren"
today=$(date)

#getting directory where script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#go to that directory
cd "$SCRIPT_DIR" || exit 1

#count .txt files in directory
count=$(ls *.txt 2>/dev/null | wc -l)

echo "Hello, $name! Today is $today"
echo "The name of this bash script is $0 and the PID of the current shell is $$"

#echo .txt count
echo "I found $count .txt file(s) in the $SCRIPT_DIR directory"