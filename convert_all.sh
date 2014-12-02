#! /bin/bash
# convert all items

find . -type f -name "*$1*" -exec ./convert_xvid.sh '{}' \;


