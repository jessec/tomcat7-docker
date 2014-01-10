FROM quintenk/tomcat7
MAINTAINER bbytes  "info@beyondbytes.co.in"


EXPOSE 8080

ENTRYPOINT /bin/bash /tmp/rabbitmq_setup.sh