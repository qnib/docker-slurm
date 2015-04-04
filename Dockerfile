###### QNIBng image
FROM qnib/terminal
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y slurm
ADD etc/supervisord.d/munged.ini /etc/supervisord.d/
ADD etc/consul.d/check_munged.json /etc/consul.d/
## User slurm
RUN useradd -u 2001 -d /home/slurm slurm
## install consul-template
RUN yum install -y git-core make golang && cd /tmp/ && \
    git clone https://github.com/hashicorp/consul-template.git && \
    cd /tmp/consul-template && \
    GOPATH=/root/ make && \
    mv /tmp/consul-template/bin/consul-template /usr/local/bin/ && \
    rm -rf /tmp/consul-template
ADD etc/consul-template/templates/slurm.conf.tmpl /etc/consul-template/templates/
ENV LD_LIBRARY_PATH=/usr/local/lib/
