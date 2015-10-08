#!/bin/sh
/usr/bin/ssh-keygen -A || exit $?

/usr/sbin/sshd && /usr/bin/salt-minion -l debug

