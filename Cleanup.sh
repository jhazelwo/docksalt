#!/bin/sh
#
#
for this in `docker ps -a|grep "salt_m"|awk '{print $NF}'`; do
	docker rm -f $this
done

## docker rm -f $(docker ps -a|grep "salt_m"|awk '{print $NF}')

