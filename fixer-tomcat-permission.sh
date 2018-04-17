#!/bin/sh

echo "Insert app-name:"
read appname
cp /opt/tomcat/webapps/source_$appname/host-manager/META-INF/context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
cp /opt/tomcat/webapps/source_$appname/manager/META-INF/context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
echo "Permission has been fixed, thank you."
