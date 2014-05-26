#!/bin/bash

source "`dirname $0`/test-tools.sh"

# tools

function download {
    parameters \
	required url $1 \
	optional doc $2

    if supplied doc; then
	wget --quiet --output-document=$doc $url
    else
	wget --quiet $url
    fi
}

# apps

function wordpress {
    download http://wordpress.org/latest.tar.gz
    tar -xvzf latest.tar.gz
}


# tests

function test_download_all {
    file_name=somefile.html
    
    download cnn.com $file_name
    expect file $file_name
    rm -f $file_name
}

function test_download_url {
    file_name=index.html

    download cnn.com
    expect file $file_name
    rm -f $file_name
}

initialize_tests
run_test test_download_all
run_test test_download_url
report_tests
