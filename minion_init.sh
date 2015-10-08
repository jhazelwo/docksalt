#!/bin/sh
/usr/bin/ssh-keygen -A || exit $?
/usr/sbin/sshd
mkdir -vp /etc/salt/minion.d
/usr/bin/salt-minion -l info

