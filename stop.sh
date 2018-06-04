#!/bin/bash
#PID=`netstat -ntpl|grep 443|awk 'BEGIN{}{print $7}'|awk 'BEGIN{FS="/"}{print $1}'`
#main_dir=$(cd `dirname $0`; pwd);
main_dir=$(cd /opt/power_service; pwd);
PID=`ps x|grep $main_dir |grep -v grep |awk '{print $1}'`
echo $PID
kill -9 $PID

