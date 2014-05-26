#!/bin/bash

source `dirname $0`/general-tools.sh
source `dirname $0`/install-tools.sh

# From other "modules"

web_root=/var/www
mysql_user=root
mysql_pass=root

module wordpress

config working_directory /tmp
config latest_url        http://wordpress.org/latest.tar.gz
config latest_file       latest.tar.gz
config target_directory  ${web_root}/wordpress

config database          wordpress
config user              wordpressuser
config pass              password

function prepare {
    pushd $wordpress_working_directory
    rm -rf latest.tar.gz
    rm -rf wordpress
}

function _mysql {
    mysql -h localhost -u $mysql_user -p$mysql_pass -e "$@"
}

function install {
#    download $wordpress_latest_url  $wordpress_latest_file
#    tar -xzf $wordpress_latest_file

    _mysql '
create database
  if not exists
  $wordpress_database;

grant all
  on $wordpress_database.*
  to $wordpress_user@localhost
  identified by "$wordpress_pass";

flush privileges;
'


    # do something with the resulting wordpress folder.
}

function cleanup {
    rm -rf latest.tar.gz
    rm -rf wordpress
    popd
}

method prepare
method install
method cleanup

wordpress_prepare
wordpress_install
wordpress_cleanup