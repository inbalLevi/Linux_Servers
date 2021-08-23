#!/bin/bash
sed  -i  's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/i'  /etc/ssh/ssh_config

service ssh restart


su - vagrant -c "ssh-keygen -t rsa -N '""' -f /home/vagrant/.ssh/id_rsa" 

cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys


mkdir /vagrant/.ssh
cp /home/vagrant/.ssh/id_rsa* /vagrant/.ssh/  
