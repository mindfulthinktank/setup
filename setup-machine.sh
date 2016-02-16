#!/bin/bash +x
includes=`dirname $0`

source $includes/wordpress.module

wordpress_prepare
wordpress_install
wordpress_cleanup
