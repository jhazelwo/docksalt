#!/bin/sh

docker rm -f $(docker ps -a|grep "salt_m"|awk '{print $NF}')

