#!/usr/bin/env bash

echo "Custom provision INSERT HERE"
sleep 10

blockagain="
<tomcat-users>
        <role rolename="manager-gui"/>
        <user username="admin" password="admin" roles="manager-gui"/>
</tomcat-users>
"
echo "$blockagain" > "/opt/tomcat/conf/tomcat-users.xml"
echo "Restarting tomcat service..."
sudo systemctl restart tomcat Again