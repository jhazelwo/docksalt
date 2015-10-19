#!/bin/sh
case $1 in
    master|minion)
    container=`docker ps -a|grep salt_${1}|awk '{print $1}'`
    test -n "${container}" || exit 2
    addr=`docker inspect -f "{{.NetworkSettings.IPAddress}}" ${container}`
    test -n "${addr}" || exit 3
    private_key="./.ssh/saltkey"
    test -f "${private_key}" || exit 4
    ssh -l root -i $private_key -oStrictHostKeyChecking=false -oUserKnownHostsFile=/dev/null $addr
    ;;
    *)
    echo "$0 'master|minion'"
    exit 1
    ;;
esac

