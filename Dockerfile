FROM tomcat:8.0
MAINTAINER sandeep
WORKDIR /
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
#COPY target/samplee-7.0.war /usr/local/tomcat/webapps
COPY sample.war /usr/local/tomcat/webapps
CMD [ "catalina.sh", "run" ] 
#COPY /var/lib/jenkins/workspace/maven/san.txt /usr/local/tomcat/webapps
