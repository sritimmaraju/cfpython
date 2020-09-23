FROM alpine:3.7
LABEL name="Sri Timmaraju"

ADD autoscaler-for-pcf-cliplugin-linux64-binary-2.0.233 cf_plugins/

RUN yum update -y && \
    yum install wget -y && \
    yum install gnupg2 -y && \
    sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo && \
    yum install software-properties-common -y && \
    yum install python -y && \
    yum install ansible -y && \
    yum install git -y && \
    yum install curl -y && \
    yum install vim -y && \
    yum install cf-cli -y && \
    cf install-plugin cf_plugins/autoscaler-for-pcf-cliplugin-linux64-binary-2.0.233 -f
