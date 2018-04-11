SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

CREATE EXTERNAL TABLE XLog (
  t TIMESTAMP,
  ui STRING,
  gi STRING,
  ti STRING,
  cdi STRING,
  ci STRING,
  li STRING,
  ua STRING,
  ori_ua STRING,
  real_ip STRING,
  api STRING,
  ori_api STRING,
  rt INT,
  http_status STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/root/data/hive/';

---

CREATE EXTERNAL TABLE PartitionsXLog (
  t TIMESTAMP,
  ui STRING,
  gi STRING,
  ti STRING,
  cdi STRING,
  ci STRING,
  li STRING,
  ua STRING,
  ori_ua STRING,
  real_ip STRING,
  api STRING,
  ori_api STRING,
  rt INT,
  http_status STRING
)
PARTITIONED BY (h int);

---

INSERT OVERWRITE TABLE
  PartitionsXLog
  PARTITION(h)
SELECT
  *, hour(t) AS h
FROM
  XLog;
