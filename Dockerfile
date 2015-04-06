###### QNIBng image
FROM qnib/terminal
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y slurm
ADD etc/supervisord.d/munged.ini /etc/supervisord.d/
ADD etc/consul.d/check_munged.json /etc/consul.d/
## User slurm
RUN useradd -u 2001 -d /home/slurm slurm
## Cluster user 'cluser'
RUN useradd -u 3000 -d /chome/cluser -M cluser
## install consul-template
ADD etc/consul-template/templates/slurm.conf.tmpl /etc/consul-template/templates/
ADD usr/local/etc/slurm.conf /usr/local/etc/slurm.conf
ENV LD_LIBRARY_PATH=/usr/local/lib/
