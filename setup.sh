#!/bin/bash

setup-ec2 () 
{

	cd /tmp && wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip

	sudo mkdir -fp /usr/local/ec2
	sudo unzip -o ec2-api-tools.zip -d /usr/local/ec2

	# export JHOME if not set
	eval ${JAVA_HOME:=export JAVA_HOME="$(/usr/libexec/java_home)"}

	local VERSION=( "$(ls -l /usr/local/ec2/ |grep ec2-api-tools |sort -V |awk '{print$9}' |awk -F '-' '{print$4}')" )
	local VERSION=$(printf "${VERSION}\n" |head -1)

	eval export EC2_HOME=/usr/local/ec2/ec2-api-tools-${VERSION}
	eval export PATH=$PATH:$EC2_HOME/bin 

}

setup-ec2