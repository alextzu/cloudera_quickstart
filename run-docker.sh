#!/bin/sh

PATH_CSV=$(readlink -f $1)

docker run -v $PATH_CSV:/csv --hostname=quickstart.cloudera --privileged=true -p 8888 -t -i X-log-analyzer
