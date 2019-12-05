#!/bin/bash
yum list installed |grep httpd 
if [ $? == '0' ]
then
 echo "package has been installed"
else
  yum install httpd -y
fi
