FROM centos:7
MAINTAINER jhazelwo@github

#
# A salt machine, Centos7, can be master or minion
#

ADD ./saltstack.repo /etc/yum.repos.d/
ADD ./SALTSTACK-GPG-KEY.pub /root/

RUN yum clean expire-cache && \
 yum update -y && \
 yum install -y wget && \
 rpm --import /root/SALTSTACK-GPG-KEY.pub && \
 yum install -y salt-master salt-minion salt-ssh salt-syndic salt-cloud virt-what openssh-server

ADD ./saltkey.pub /root/.ssh/authorized_keys
ADD ./custom.conf /root/
ADD ./init.sh /root/

