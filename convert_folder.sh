#! /bin/bash

if [ -z "$1" ]; then 
    echo "Please enter a folder to convert" 
    exit 1;
fi

find $1/* -exec ./convert_xvid.sh '{}' \;


