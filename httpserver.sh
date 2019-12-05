#!/bin/bash
#installing httpd package
setenforce 0
iptables -F
systemctl stop firewalld
systemctl status firewalld
test -f /tmp/index.html
if [ $? -eq '0' ];then
   yum list installed |grep httpd 
   if [ $? == '0' ]
   then
      echo "package has been installed"
   else
      yum install httpd -y
   fi
   #adding the webdeveloper user
   id webdeveloper  >/dev/null 2>&1
   if [ $? -eq '0' ]; then 
      echo "user has been created alreday"
   else
      adduser webdeveloper >/dev/null 2>&1
   fi
   grep "Listen 8080" /etc/httpd/conf/httpd.conf
   if [ $? -eq '0' ];then
      echo "port cahnegs has been done already"
   else
     sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
   fi
   cp /tmp/index.html /var/www/html
   systemctl restart httpd
else 
   echo "please upload the website before execution of script"
fi
