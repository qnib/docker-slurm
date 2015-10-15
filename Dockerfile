###### QNIBng image
FROM qnib/terminal
MAINTAINER "Christian Kniep <christian@qnib.org>"

ADD etc/yum.repos.d/qnib.repo /etc/yum.repos.d/
RUN echo "2015-04-12";yum --disablerepo=* --enablerepo=qnib-* clean all;yum install -y slurm
ADD etc/supervisord.d/munged.ini /etc/supervisord.d/
ADD etc/consul.d/check_munged.json /etc/consul.d/
## User slurm
RUN useradd -u 2001 -d /home/slurm slurm
## Cluster users
RUN groupadd -g 3000 clusers && \
    useradd -u 3001 -G clusers -d /home/alice -m alice && \
    useradd -u 3002 -G clusers -d /home/bob -m bob && \
    useradd -u 3003 -G clusers -d /home/carol -m carol && \
    useradd -u 3004 -G clusers -d /home/dave -m dave && \
    useradd -u 3005 -G clusers -d /home/eve -m eve && \
    groupadd -g 4000 guests && \
    useradd -u 4001 -G guests -d /home/john -m john && \
    useradd -u 4002 -G guests -d /home/jane -m jane 
ADD home/ /tmp/home/
RUN /tmp/home/usersetup.sh alice bob carol dave eve john jane && rm -rf /tmp/home 

## install consul-template
ADD etc/consul-template/templates/slurm.conf.tmpl /etc/consul-template/templates/
ADD usr/local/etc/slurm.conf /usr/local/etc/slurm.conf
ENV LD_LIBRARY_PATH=/usr/local/lib/
# Setup slurm (soft) restart, if cluster size changes
ADD opt/qnib/bin/slurm_reread.sh /opt/qnib/bin/
ADD etc/supervisord.d/slurm_update.ini /etc/supervisord.d/
