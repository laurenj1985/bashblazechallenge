#!/bin/bash

#getting directory where script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Welcome to the Interactive File and Directory Explorer "

echo "Files and Directories in the Current Path:"
ls -lh $SCRIPT_DIR

while true;
do
   read -p "Enter a line of text (Press Enter without text to exit): " input
   if [[ -z "$input" ]]; then
       echo "Exiting the Interactive Explorer. Goodbye!"
       break
   
   else
       
       echo "Character Count: $(echo -n "$input" | wc -m)"
   
   fi
done