#!/bin/bash

for u in $*;do
    cp /tmp/home/bashrc /home/${u}/.bashrc && chown ${u}: /home/${u}/.bashrc
    cp /tmp/home/bash_profile /home/${u}/.bash_profile && chown ${u}: /home/${u}/.bash_profile
    mkdir -p /home/${u}/.ssh/
    cp /tmp/home/id_rsa /home/${u}/.ssh/id_rsa && chmod 600 /home/${u}/.ssh/id_rsa && chown ${u}: /home/${u}/.ssh/id_rsa
    cp /tmp/home/id_rsa.pub /home/${u}/.ssh/id_rsa.pub && chmod 644 /home/${u}/.ssh/id_rsa.pub && chown ${u}: /home/${u}/.ssh/id_rsa.pub
    cp /home/${u}/.ssh/id_rsa.pub /home/${u}/.ssh/authorized_keys && chown ${u}: /home/${u}/.ssh/authorized_keys
done

