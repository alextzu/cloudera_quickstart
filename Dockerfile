FROM cloudera/quickstart:latest

COPY analyzer.sh /analyzer/
COPY import-log.sql /analyzer/

CMD docker-quickstart
