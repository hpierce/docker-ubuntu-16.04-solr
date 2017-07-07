FROM hpierce/docker-ubuntu-16.04-java8

RUN apt-get update && apt-get install python-software-properties lsof -y

COPY get_solr.sh /root 
COPY solr.list /root

RUN cd /root && bash /root/get_solr.sh

RUN cd /opt/ && tar xzf solr-6.6.0.tgz \ 
    solr-6.6.0/bin/install_solr_service.sh --strip-components=2 

ENTRYPOINT cd /opt/ && ./install_solr_service.sh solr-6.6.0.tgz && /bin/bash



