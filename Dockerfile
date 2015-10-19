FROM centos:7
MAINTAINER jhazelwo@github

#
# A salt machine, Centos7, can be master or minion
#

## https://docs.saltstack.com/en/latest/topics/installation/rhel.html#installation-from-the-saltstack-repository
ADD ./files/saltstack.repo /etc/yum.repos.d/
ADD ./files/SALTSTACK-GPG-KEY.pub /root/

RUN yum clean expire-cache && \
 yum update -y && \
 yum install -y wget && \
 rpm --import /root/SALTSTACK-GPG-KEY.pub && \
 yum install -y salt-master salt-minion salt-ssh salt-syndic salt-cloud virt-what openssh-server python-libnacl

ADD ./.ssh/saltkey.pub /root/.ssh/authorized_keys
ADD ./files/custom.conf /root/
ADD ./files/saltrc /root/.saltrc
ADD ./files/init.sh /root/

