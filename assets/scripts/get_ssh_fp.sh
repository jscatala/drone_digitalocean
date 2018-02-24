#!/bin/bash

read -p "Input full path for public key (like /home/user/.ssh/id_rsa.pub): " pubpath 

fp=$(ssh-keygen -E md5 -lf $pubpath | awk '{print $2}'| cut -c5-)

echo "your ssh footprint is: $fp"
