#!/bin/sh
#
/usr/bin/ssh-keygen -A || exit $?
/usr/sbin/sshd || exit $?

case `hostname` in
  'salt')
    mkdir -vp /etc/salt/master.d
    mkdir -vp /srv/salt
    cp -v /root/custom.conf /etc/salt/master.d/
    /usr/bin/salt-master -l debug
  ;;
  *)
    mkdir -vp /etc/salt/minion.d
    /usr/bin/salt-minion -l info
  ;;
esac

