#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
sudo service nginx stop
sudo apt-get update
sudo apt install wget git curl vim htop -y
echo "Installing java-8-oracle JDK..."
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:webupd8team/java -y
sudo apt-get update -y
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer -y
echo "java-8-oracle installed successfully"
sleep 5
#sudo apt-get install default-jdk -y
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
cd /tmp
wget http://it.apache.contactlab.it/tomcat/tomcat-8/v8.5.30/bin/apache-tomcat-8.5.30.tar.gz
sudo tar -xzvf apache-tomcat-8.5.30.tar.gz
sudo mv apache-tomcat-8.5.30 tomcat
sudo cp -R tomcat/ /opt/
sudo chgrp -R tomcat /opt/tomcat
sudo chown -R tomcat /opt/tomcat
sudo chmod -R 755 /opt/tomcat

#sudo update-java-alternatives -l

block="[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-8-oracle
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
"

sudo echo "$block" > "/etc/systemd/system/tomcat.service"

sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl status tomcat
sudo ufw allow 8080
sudo systemctl enable tomcat
sudo mkdir /opt/tomcat/conf
sudo touch /opt/tomcat/conf/tomcat-users.xml

block2="
<tomcat-users>
<!--
  <role rolename="tomcat"/>
  <role rolename="role1"/>
  <user username="tomcat" password="tomcat" roles="tomcat"/>
  <user username="both" password="tomcat" roles="tomcat,role1"/>
  <user username="role1" password="tomcat" roles="role1"/>
-->

        <role rolename="manager-gui"/>
        <user username="admin" password="admin" roles="manager-gui"/>

</tomcat-users>
"

echo "$block2" > "/opt/tomcat/conf/tomcat-users.xml"
echo "Restarting tomcat service..."
sudo systemctl restart tomcat

#echo "Grant access to tomcat..."
#sed -i 's/allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />/allow="10\.249\.197\.1|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />/g' /opt/tomcat/webapps/host-manager/META-INF/context.xml
#sed -i 's/allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />/allow="10\.249\.197\.1|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />/g' /opt/tomcat/webapps/manager/META-INF/context.xml

#sudo sed -i '20s/.*/allow="10\.249\.197\.1|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />/' /opt/tomcat/webapps/host-manager/META-INF/context.xml
#sudo sed -i '20s/.*/allow="10\.249\.197\.1|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />/' /opt/tomcat/webapps/manager/META-INF/context.xml
#echo "Restarting tomcat service Again..."
#sudo systemctl restart tomcat

cd /tmp
wget http://ftp.wayne.edu/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.zip
unzip apache-maven-3.5.2-bin.zip
mv apache-maven-3.5.2 maven
sudo cp -R maven/ /opt/

block3="
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=/opt/maven/bin:${PATH}
"

echo "$block3" > "/etc/profile.d/maven.sh"
source /etc/profile.d/maven.sh
echo "Maven installed successfully"
mvn -version
sleep 10
echo "Done."