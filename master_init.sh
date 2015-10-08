#!/bin/sh
/usr/bin/ssh-keygen -A || exit $?
/usr/sbin/sshd
/usr/bin/salt-master -l debug -d
while [ 1 ]; do /usr/bin/salt-key -y -a minion; sleep 30; done

