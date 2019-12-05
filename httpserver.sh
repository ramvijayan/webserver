#!/bin/bash
if ["yum list installed|grep \"httpd\""];then
 echo "package has been installed"
else
  yum install httpd -y
fi
