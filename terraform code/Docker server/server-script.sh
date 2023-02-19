#!/bin/bash
sudo su -
yum -y update
yum install docker -y
service docker start
#useradd dockeradmin
#passwd dockeradmin
#usermod -aG docker dockeradmin
#to login to the docker user we need to modify the next file
#vi /etc/ssh/sshd_config

#useradd ansadmin
#passwd ansadmin
#visudo





#docker pull tomcat
#docker run -d --name tomcat-container -p 8081:8080 tomcat
#docker exec -it tomcat-container /bin/bash
#cd webapps.dist
#cp -R * ../webapps/


