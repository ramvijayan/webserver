#!/bin/bash
#installing httpd package
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
