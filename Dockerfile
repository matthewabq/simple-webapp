FROM tomcat:8.0
MAINTAINER Matthew Barker 

LABEL version="01"
LABEL security="badandreallyhorrible"

# don't ask me why this is needed
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

# update and install openssh-server
RUN apt-get update && apt-get install -y apt-transport-https openssh-server

# install vim so we can edit files
RUN apt-get install -y vim

# Statically deploy the application war file 
ADD target/java-hello-world.war /usr/local/tomcat/webapps



