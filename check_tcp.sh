#!/bin/sh
netstat -nt | grep ":443" | awk '{print $5}' | cut -d : -f 1 | sort | uniq -c | sort -nr > /tmp/ip_list.log
cat /tmp/ip_list.log | while read line
do
  COUNT=$(echo $line | awk '{print $1}')
  IP=$(echo $line | awk '{print $2}')
  if [ $COUNT -gt 5 ]; then
    echo ----$COUNT----$IP-------
    echo $IP >> /tmp/ban_ip.list
  fi
done
