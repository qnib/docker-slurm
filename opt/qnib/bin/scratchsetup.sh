#!/bin/bash

su -c 'touch /scratch/test' alice
if [ $? -eq 1 ];then
   chmod 777 /scratch/
fi
su -c 'touch /scratch/test' alice
if [ $? -eq 1 ];then
   exit 1
fi
su -c 'touch /scratch/test' john
if [ $? -eq 1 ];then
   exit 1
fi
