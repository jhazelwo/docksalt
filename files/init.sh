#!/bin/sh
#
/usr/bin/ssh-keygen -A || exit $?
/usr/sbin/sshd || exit $?
hostname > /etc/salt/minion_id || exit $?

case `hostname` in
  'salt')
    mkdir -vp /etc/salt/master.d
    mv -v /root/custom.conf /etc/salt/master.d/
    chmod -v 0600 /root/.saltrc
    /usr/bin/salt-master --log-file-level debug
  ;;
  *)
    mkdir -vp /etc/salt/minion.d
    echo "random_reauth_delay: 5" > /etc/salt/minion.d/custom.conf
    echo "`date` waiting for master to start..."
    sleep 30
    /usr/bin/salt-minion --log-file-level debug -l info
  ;;
esac

