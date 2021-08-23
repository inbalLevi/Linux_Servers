#!/bin/bash  
sed  -i  's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/i'  /etc/ssh/ssh_config
service ssh restart
cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
mv /vagrant/.ssh/id_rsa /home/vagrant/.ssh/
