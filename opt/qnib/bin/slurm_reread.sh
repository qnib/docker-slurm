#!/bin/bash

odd_cnt=$(grep "^PartitionName=odd" /usr/local/etc/slurm.conf|grep -o ","|wc -l)
even_cnt=$(grep "^PartitionName=even" /usr/local/etc/slurm.conf|grep -o ","|wc -l)
rm -f /tmp/slurm.conf
if [ ${odd_cnt} -le ${even_cnt} ];then
    mv /usr/local/etc/slurm.conf /tmp/slurm.conf
    grep -v ^PartitionName /tmp/slurm.conf > /usr/local/etc/slurm.conf
    grep "^PartitionName=even" /tmp/slurm.conf >> /usr/local/etc/slurm.conf
    grep "^PartitionName=odd" /tmp/slurm.conf|sed -e 's/Default=YES/Default=NO/' >> /usr/local/etc/slurm.conf
else
    mv /usr/local/etc/slurm.conf /tmp/slurm.conf
    grep -v ^PartitionName /tmp/slurm.conf > /usr/local/etc/slurm.conf
    grep "^PartitionName=even" /tmp/slurm.conf|sed -e 's/Default=YES/Default=NO/' >> /usr/local/etc/slurm.conf
    grep "^PartitionName=odd" /tmp/slurm.conf >> /usr/local/etc/slurm.conf
fi
## check if partition is empty?
sed -i '/\ Nodes=\ /d' /usr/local/etc/slurm.conf
if [ -f /var/run/slurmctld.pid ];then
    kill -HUP $(cat /var/run/slurmctld.pid)
fi
if [ -f /var/run/slurmd.pid ];then
    #kill -HUP $(cat /var/run/slurmd.pid)
    supervisorctl restart slurmd
fi
sleep 5
