#!/bin/sh
/usr/bin/ssh-keygen -A || exit $?
/usr/sbin/sshd
mkdir -vp /etc/salt/master.d
cp -v /root/custom.conf /etc/salt/master.d/
/usr/bin/salt-master -l debug

