#!/bin/sh
image="jhazelwo/docksalt"
#docker rmi -f "${image}"

test -f ./saltkey || ssh-keygen -t dsa -b 1024 -f ./saltkey -P ''

test -f SALTSTACK-GPG-KEY.pub || wget https://repo.saltstack.com/yum/rhel7/SALTSTACK-GPG-KEY.pub 

docker build --force-rm=true -t "${image}" .

