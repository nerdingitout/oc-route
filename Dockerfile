FROM rhel7:latest

USER root

MAINTAINER Ron Sengupta

# Fix per https://bugzilla.redhat.com/show_bug.cgi?id=1192200

RUN yum -y install deltarpm yum-utils –disablerepo=*-eus-* –disablerepo=*-htb-* \

–disablerepo=*-ha-* –disablerepo=*-rt-* –disablerepo=*-lb-* –disablerepo=*-rs-* –disablerepo=*-sap-*

RUN yum-config-manager –disable *-eus-* *-htb-* *-ha-* *-rt-* *-lb-* *-rs-* *-sap-* > /dev/null

COPY nginx.repo /etc/yum.repos.d/nginx.repo

RUN chmod 777 /etc/yum.repos.d/nginx.repo

RUN yum update -y; yum install nginx -y;yum clean all

RUN mkdir -p /etc/nginx/certs

RUN mkdir -p /var/www/html

COPY default.conf /etc/nginx/conf.d/default.conf

COPY clisec.rhel-cdk.10.1.2.2.xip.io.crt /etc/nginx/certs/server.crt

COPY clisec.rhel-cdk.10.1.2.2.xip.io.key /etc/nginx/certs/server.key

COPY ca.crt /etc/nginx/certs/ca.crt

RUN echo “The Nginx Web Server is Running” > /var/www/html/index.html

EXPOSE 443

# Define default command.

CMD [“nginx”, “-g”, “daemon off;”]
