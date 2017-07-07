#!/bin/bash
cd /root
echo Downloading netselect
wget -q http://http.us.debian.org/debian/pool/main/n/netselect/netselect_0.3.ds1-28+b1_amd64.deb
dpkg -i netselect_0.3.ds1-28+b1_amd64.deb 
rm netselect_0.3.ds1-28+b1_amd64.deb 
echo Running netselect to find fastest solr mirror
mirror=`netselect -s 10 -t 40 $(cat solr.list) | head -1 | awk '{print $2}'`
echo Fastest mirror is $mirror
cd /opt
echo Downloading solr
wget -q $mirror/solr-6.6.0.tgz
echo Downloading solr done
