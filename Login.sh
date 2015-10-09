#!/bin/sh

container=`docker ps -a|grep salt_${1}|awk '{print $1}'`

addr=`docker inspect -f "{{.NetworkSettings.IPAddress}}" ${container}` || exit $?


ssh root@${addr} -i ./saltkey -oStrictHostKeyChecking=false -oUserKnownHostsFile=/dev/null

