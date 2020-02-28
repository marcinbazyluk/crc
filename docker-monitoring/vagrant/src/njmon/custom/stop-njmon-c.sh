#!/bin/bash
echo "Stop NJMON Collector, Thanks Nigel!"
ps -ef | grep [n]jmon_collector | awk '{ print $2 }' | xargs kill -9 > /dev/null 2>&1
