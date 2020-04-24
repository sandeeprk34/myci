FROM tomcat:8.0
MAINTAINER sandeep
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
COPY /var/lib/jenkins/workspace/maven/target/samplee-7.0.war /usr/local/tomcat/webapps/
