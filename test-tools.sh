#!/bin/bash

function initialize_tests {
    test_error_message=
    test_count=0
    test_failed_count=0
    test_passed_count=0
}

function expect {
    case $1 in
	file)
	    if [ -f $2 ]; then
		message="file does not exist: $2"
	    fi
	    ;;
	*)
	    message="unknown validation: $1."
	    ;;
    esac

    test_error_message=$message
}

function echo_failed {
    echo -e "\e[31mfailed\e[39m"
}

function echo_passed {
    echo -e "\e[32mpassed\e[39m"
}

function run_test {
    echo -n "running $1..."
    ((test_count++))
    test_error_message=
    $1
    if [ "$test_error_message" == "" ]; then
	((test_passed_count++))
	echo_passed
    else
	((test_failed_count++))
	echo_failed
	echo "test error: $test_error_message."
	test_error_message=
    fi
}

function report_tests {
    echo "Tests run: $test_count." \
	"Passed: $test_passed_count." \
	"Failed: $test_failed_count."
    initialize_tests
}
