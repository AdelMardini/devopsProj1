#!/bin/bash
sudo su -
yum -y update
amazon-linux-extras install ansible2
#useradd ansadmin
#passwd ansadmin
#visudo
#to login to the ansible user we need to modify the next file
#vi /etc/ssh/sshd_config
#service sshd reload
#sudo su - ansadmin
#ssh-keygen
#delete everything in this file
#vi etc/ansible/hosts
#add the docker private ip
#sudo su - ansadmin
#ssh-copy-id <dockerip>
#go to home directory
#ansible all -m ping
#sudo yum install docker -y
#sudo usermod -aG docker ansadmin
#sudo service docker start
