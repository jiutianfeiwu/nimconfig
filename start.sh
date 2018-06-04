#!/bin/bash
#unzip  cloud-powervm-1.0-SNAPSHOT.zip
#main_dir=$(cd `dirname $0`; pwd)
main_dir=$(cd /opt/power_service; pwd)

echo $main_dir
echo "|--------------  REBOOT  -----------|"
DISTBIN=cloud-powervm
DISTNAME=cloud-powervm
BIN=$main_dir/$DISTNAME
mkdir -p $BIN/logs
ps x|grep $BIN |grep -v grep |awk '{print $1}'|xargs kill >/dev/null 2>&1
rm -f $BIN/RUNNING_PID
cd $BIN
nohup ./bin/$DISTBIN -Dhttp.port=disabled -Dhttps.port=1443  -Dplay.server.https.keyStore.path=$main_dir/jks/powerservice.jks  -Dplay.server.https.keyStore.password=changeit  -Duser.timezone=GMT+8  > $BIN/logs/out.log 2>&1 &
#nohup ./bin/$DISTBIN -Dhttp.port=80 -Dcom.sun.management.jmxremote.port=5678 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false  -Duser.timezone=GMT+8  > $BIN/logs/out.log 2>&1 &

#nohup  /root/ssl/test/cloud-core-1.0-SNAPSHOT/bin/cloud-core -Dhttp.port=disabled  -Dhttps.port=9443 -Dplay.server.https.keyStore.path=/root/ssl/70server.jks -Dplay.server.https.keyStore.password=Qg2DgiriTJ  > nohup.log 2>&1 &


#nohup ./bin/$DISTBIN -Dhttp.port=disabled -Dhttps.port=443 -Dcom.sun.management.jmxremote.port=5678 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false  -Dplay.server.https.keyStore.path=$main_dir/jks/powerservice.jks  -Dplay.server.https.keyStore.password=changeit  -Duser.timezone=GMT+8  > $BIN/logs/out.log 2>&1 &



tail -f $BIN/logs/out.log


