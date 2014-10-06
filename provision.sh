#!/usr/bin/bash

PROVISION_DIR="/var/vagrant_provision"
GIT_VERSION="1.9.0"

if [ -e "$PROVISION_DIR" ]; then
    exit 0
fi

mkdir $PROVISION_DIR && cd $PROVISION_DIR

## RHEL/CentOS 7 64-Bit ##
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
rpm -ivh epel-release-7-2.noarch.rpm

## Git
echo Installing git- ${GIT_VERSION} ...
yum install -y zlib-devel perl-devel gettext gcc curl-devel
wget https://git-core.googlecode.com/files/git-${GIT_VERSION}.tar.gz
tar zxf git-${GIT_VERSION}.tar.gz
cd git-${GIT_VERSION}
./configure
make
make install
