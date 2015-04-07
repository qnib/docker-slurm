#!/bin/bash

if [ -f /var/run/slurmctld.pid ];then
    kill -HUP $(cat /var/run/slurmctld.pid)
fi
if [ -f /var/run/slurmd.pid ];then
    kill -HUP $(cat /var/run/slurmd.pid)
fi
sleep 5
