#!/bin/sh

HIVE_DATA_DIR=/user/root/data/hive/
FILE_INPUT=$1

hdfs dfs -mkdir -p $HIVE_DATA_DIR
hdfs dfs -put /csv/$FILE_INPUT $HIVE_DATA_DIR

beeline -u jdbc:hive2://localhost:10000 -f /analyzer/import-log.sql
