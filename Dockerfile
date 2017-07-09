FROM hpierce/docker-ubuntu-16.04-java8

RUN apt-get update && apt-get install python-software-properties lsof -y

ADD http://apache.osuosl.org/lucene/solr/6.6.0/solr-6.6.0.tgz \
    /opt/solr-6.6.0.tgz

RUN cd /opt/ && tar xzf solr-6.6.0.tgz \ 
    solr-6.6.0/bin/install_solr_service.sh --strip-components=2 

ENTRYPOINT cd /opt/ && ./install_solr_service.sh solr-6.6.0.tgz && /bin/bash



