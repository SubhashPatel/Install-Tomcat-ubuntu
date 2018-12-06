#!/bin/bash

#######################################
# Bash script to install a Tomcat in ubuntu
# Author: Subhash (serverkaka.com)

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Prerequisite
apt-get install unzip -y

# Install Java if not allready Installed
if java -version | grep -q "java version" ; then
  echo "Java Installed"
else
  sudo add-apt-repository ppa:webupd8team/java -y  && sudo apt-get update -y  && sudo apt-get install oracle-java8-installer -y && echo JAVA_HOME=/usr/lib/jvm/java-8-oracle >> /etc/environment && echo JRE_HOME=/usr/lib/jvm/java-8-oracle/jre >> /etc/environment && source /etc/environment
fi

# Install Tomcat
cd /opt/
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.8/bin/apache-tomcat-9.0.8.zip
unzip apache-tomcat-9.0.8.zip
mv apache-tomcat-9.0.8 tomcat

# Set Permission for execute
chmod +x /opt/tomcat/bin/*.sh

# Start tomcat
/opt/tomcat/bin/startup.sh

# Clean downloades files
rm apache-tomcat-9.0.8.zip
apt-get autoremove
