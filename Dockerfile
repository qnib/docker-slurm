###### QNIBng image
FROM qnib/terminal
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y slurm
ADD etc/supervisord.d/munged.ini /etc/supervisord.d/
ADD etc/consul.d/check_munged.json /etc/consul.d/
## User slurm
RUN useradd -u 2001 -d /home/slurm slurm
