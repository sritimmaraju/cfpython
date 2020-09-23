FROM ubuntu
LABEL name="Sri Timmaraju"

ADD autoscaler-for-pcf-cliplugin-linux64-binary-2.0.233 cf_plugins/

RUN apt-get update && \
    apt-get install wget -y && \
    apt-get install gnupg2 -y && \
    wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - && \
    echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt-get install ansible -y && \
    apt-get install git -y && \
    apt-get install curl -y && \
    apt-get install vim -y && \
    apt-get install python-jmespath -y && \
    apt-get install cf-cli -y && \
    cf install-plugin cf_plugins/autoscaler-for-pcf-cliplugin-linux64-binary-2.0.233 -f
