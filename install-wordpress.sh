#!/bin/bash

web_root=/var/www

module wordpress
config working_folder  /tmp
config latest_location http://wordpress.org/latest.tar.gz
config latest_file     latest.tar.gz
config source_folder   wordpress
config target_folder   ${web_root}/wordpress

