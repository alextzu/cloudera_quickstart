#!/bin/bash

LOG_PATH=$1
FILE_OUTPUT=$2

mkdir -p $(dirname $FILE_OUTPUT)
touch $FILE_OUTPUT

find $LOG_PATH -name "*.log*" -print0 | sort -t . -z -k1,1 -k2,2n | while read -r -d $'\0' file
do
  filename=$(basename "$file")
  extension="${filename##*.}"

  printf "processing ... $file\n"

  if [ $extension == "gz" ]; then
    zcat $file | ./log2line.py 3 | ./line2csv.py >> $FILE_OUTPUT
  elif [ $extension == "log" ]; then
    cat $file | ./log2line.py 3 | ./line2csv.py >> $FILE_OUTPUT
  fi
done
