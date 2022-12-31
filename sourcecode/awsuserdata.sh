#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><body><h1> Public IP address of this instance: </h1>" > index.html
curl http://169.254.169.254/latest/meta-data/public-ipv4 >> index.html
echo " <br> <h1>Availability Zone : </h1>" >> index.html
curl http://169.254.169.254/latest/meta-data/placement/availability-zone >> index.html
echo "</body></html>" >> index.html