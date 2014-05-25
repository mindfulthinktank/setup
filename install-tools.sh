#!/bin/bash

source "`dirname $0`/test-tools.sh"

# tools

function download {
    wget -q $1
}


# tests

function test_download {
    download cnn.com
    expect file index.html && rm -f index.html || return 1
}

initialize_tests
run_test test_download
report_tests
