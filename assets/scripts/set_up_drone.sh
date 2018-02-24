#!/bin/bash

sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables-save 
sudo systemctl restart docker 

sudo docker run -d --name nginx -p80:80 -p443:443 nginx:latest

