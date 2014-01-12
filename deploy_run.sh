#!/bin/bash
echo Starting "$1" on port "$2"
#Copy the war file from mounted directory to tomcat webapps directory
if [ $1 ]
then
rm -r /var/lib/tomcat7/webapps/*
cd /var/lib/tomcat7/webapps/  && wget $1
fi
#Add the port to the JVM args
if [ $2 ]
then
echo "export JAVA_OPTS=\"-Xms512m -Xmx1024m -Dport.http.nonssl=$2\"" >> /usr/share/tomcat7/bin/setenv.sh
else
echo "export JAVA_OPTS=\"-Xms512m -Xmx1024m -Dport.http.nonssl=8080\"" >> /usr/share/tomcat7/bin/setenv.sh
fi

service tomcat7 start
tail -F /var/lib/tomcat7/logs/catalina.out
