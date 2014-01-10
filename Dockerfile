FROM quintenk/tomcat7
MAINTAINER bbytes  "info@beyondbytes.co.in"


EXPOSE 8080

ADD deploy_run.sh /tmp/deploy_run.sh
chmod +x /tmp/deploy_run.sh
ENTRYPOINT ["/tmp/deploy_run.sh"]