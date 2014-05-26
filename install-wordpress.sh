#!/bin/bash

source `dirname $0`/general-tools.sh
source `dirname $0`/install-tools.sh

web_root=/var/www

module wordpress
config working_folder  /tmp
config latest_location http://wordpress.org/latest.tar.gz
config latest_file     latest.tar.gz
config source_folder   wordpress
config target_folder   ${web_root}/wordpress

function prepare {
    rm -rf latest.tar.gz
    rm -rf wordpress
}

function install {
    download "http://wordpress.org/latest.tar.gz"
    tar -xzf latest.tar.gz

    # do something with the resulting wordpress folder.
}

function cleanup {
    rm -rf latest.tar.gz
    rm -rf wordpress
}

method prepare
method install
method cleanup

wordpress_prepare
wordpress_install
wordpress_cleanup