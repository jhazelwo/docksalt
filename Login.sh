#!/bin/sh
case $1 in
    master)
    docker exec -ti salt_master /bin/bash
    ;;
    minion)
    docker exec -ti `docker ps -a|grep "Up.*salt_minion"|awk '{print $NF}'|sort|head -1` /bin/bash
    ;;
    *)
    echo "$0 'master|minion'"
    exit 1
    ;;
esac

