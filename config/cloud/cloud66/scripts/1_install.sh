#!/bin/bash
FILE=/tmp/install_done

if [ -f $FILE ]
then
	echo "File $FILE exists..."
else
	source /var/.cloud66_env
	apt-get install libicu-dev -y
    apt-get install acl -y
    apt-get install pkg-config -y
    apt-get install cmake -y
    apt-get install -y python-software-properties
    yes | add-apt-repository ppa:git-core/ppa
    apt-get -y update
    apt-get -y upgrade
    apt-get install -y sendmail
    mv /usr/bin/ruby /usr/bin/ruby_old
    sudo touch /tmp/install_done
fi





