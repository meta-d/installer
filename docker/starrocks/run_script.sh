#!/bin/bash

# Set JAVA_HOME.
export JAVA_HOME=/usr/lib/jvm/java

# Start FE.
cd /data/deploy/starrocks/fe/bin/
./start_fe.sh --daemon

# Start BE.
cd /data/deploy/starrocks/be/bin/
./start_be.sh --daemon

# Sleep until the cluster starts.
sleep 30;

# Set BE server IP.
IP=$(ifconfig eth0 | grep 'inet' | cut -d: -f2 | awk '{print $2}')
mysql -uroot -h${IP} -P 9030 -e "alter system add backend '${IP}:9050';"
mysql -uroot -h${IP} -P 9030 < /docker-entrypoint-initdb.d/init.sql

# Loop to detect the process.
while sleep 60; do
  ps aux | grep starrocks | grep -q -v grep
  PROCESS_STATUS=$?

  if [ PROCESS_STATUS -ne 0 ]; then
    echo "one of the starrocks process already exit."
    exit 1;
  fi
done