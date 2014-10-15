#!/usr/bin/bash

PROVISION_DIR="/var/vagrant_provision"
GIT_VERSION="git-1.9.0"
VIM_VERSION="vim-7.4"

if [ -e "$PROVISION_DIR" ]; then
    exit 0
fi

mkdir $PROVISION_DIR && cd $PROVISION_DIR

## RHEL/CentOS 7 64-Bit ##
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
rpm -ivh epel-release-7-2.noarch.rpm

## Git ##
echo Installing ${GIT_VERSION} ...
yum install -y zlib-devel perl-devel gettext gcc curl-devel
wget https://git-core.googlecode.com/files/${GIT_VERSION}.tar.gz
tar zxf ${GIT_VERSION}.tar.gz
cd ${GIT_VERSION}
./configure
make
make install
cd ..

## Vim ##
yum install -y ncurses-devel
wget ftp://ftp.vim.org/pub/vim/unix/${VIM_VERSION}.tar.bz2
tar jxvf ${VIM_VERSION}.tar.bz2
cd vim74
./configure --with-features=huge --enable-multibyte --disable-selinux --prefix=/usr/local --enable-rubyinterp
make
make install
cd ..

## tmux, zsh
yum install -y tmux zsh
