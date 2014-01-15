#!/bin/bash
echo Starting "$WAR_URL" on port "$PORT"
#Copy the war file from mounted directory to tomcat webapps directory
if [ $WAR_URL ]
then
rm -r /var/lib/tomcat7/webapps/*
cd /var/lib/tomcat7/webapps/  && wget -q $WAR_URL
fi
#Add the port to the JVM args
if [ $PORT ]
then
echo "came in .....with port $PORT"
echo "export JAVA_OPTS=\"-Xms512m -Xmx1024m -Dport.http.nonssl=$PORT\"" >> /usr
else
echo "export JAVA_OPTS=\"-Xms512m -Xmx1024m -Dport.http.nonssl=8080\"" >> /usr/
fi

service tomcat7 start
tail -F /var/lib/tomcat7/logs/catalina.out
