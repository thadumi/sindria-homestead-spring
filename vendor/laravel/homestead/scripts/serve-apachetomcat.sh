#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
sudo service nginx stop
sudo apt install wget git curl vim htop -y
echo "Installing java-8-oracle JDK..."
sudo apt-get install software-properties-common -y
#sudo apt-add-repository ppa:webupd8team/java -y
sudo apt-get update -y
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz
mkdir /opt/java
tar -zxf jdk-8u172-linux-x64.tar.gz -C /opt/java
java="JAVA_HOME=\"/opt/java/jdk1.8.0_172/bin/java\""
sudo echo "$java" > "/etc/environment"
path="export PATH=$PATH:/opt/java/jdk1.8.0_172/bin"
sudo echo "$path" > "/etc/environment"
source /etc/environment
echo $JAVA_HOME
echo $PATH
java -version
#echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
#sudo apt-get install oracle-java8-installer -y
#sudo apt install oracle-java9-installer -y
#sudo apt install oracle-java9-set-default -y
echo "java-8-oracle installed successfully"
sleep 5
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

Environment=JAVA_HOME=/opt/java/jdk1.8.0_172/
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

block2="
<tomcat-users>
        <role rolename="manager-gui"/>
        <user username="admin" password="admin" roles="manager-gui"/>
</tomcat-users>
"

echo "$block2" > "/opt/tomcat/conf/tomcat-users.xml"
echo "Restarting tomcat service..."
sudo systemctl restart tomcat

cd /tmp
wget http://ftp.wayne.edu/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.zip
unzip apache-maven-3.5.2-bin.zip
mv apache-maven-3.5.2 maven
sudo cp -R maven/ /opt/

block3="
export JAVA_HOME=/opt/java/jdk1.8.0_172/
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=/opt/maven/bin:${PATH}
"

echo "$block3" > "/etc/profile.d/maven.sh"
source /etc/profile.d/maven.sh
echo "Maven installed successfully"
mvn -version

##########################################
# custom by thadumi
##########################################

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install nodejs
echo "nodejs installed successfully"

sudo apt install npm
npm install -g npm@latest
echo "npm installed successfully"

##########################################
sleep 10
echo "Done."
