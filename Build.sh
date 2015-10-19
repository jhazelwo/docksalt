#!/bin/sh
image="jhazelwo/docksalt"
#docker rmi -f "${image}"

test -f ./.ssh/saltkey || ssh-keygen -t dsa -b 1024 -f ./.ssh/saltkey -P ''

test -f ./files/SALTSTACK-GPG-KEY.pub || wget https://repo.saltstack.com/yum/rhel7/SALTSTACK-GPG-KEY.pub -P ./files/

docker build --force-rm=true -t "${image}" .

