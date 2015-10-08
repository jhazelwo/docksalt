#!/bin/sh

container=`docker ps -a|grep ${1}_init|awk '{print $1}'`

addr=`docker inspect -f "{{.NetworkSettings.IPAddress}}" ${container}` || exit $?


ssh root@${addr} -i ./saltkey -oStrictHostKeyChecking=false -oUserKnownHostsFile=/dev/null

