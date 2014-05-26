#!/bin/bash

function supplied {
    if [ "${!1}" == "" ]; then
	return 1;
    else
	return 0;
    fi
}

function parameters {
    i=1
    while [ $i -le $# ]
    do
	j=$((i+1))
	k=$((i+2))
	case ${!i} in
	    required)
		declare -g ${!j}=${!k}
		((i+=3))
		;;
	    optional)
		if [ "${!k}" == "optional" ]; then
		    declare -g ${!j}=""
		    ((i+=2))
		else
		    declare -g ${!j}=${!k}
		    ((i+=3))
		fi
		;;
	    *)
		echo "error in parameters; expecting optional | required"
		
		;;
	esac
    done
}

function module {
    declare -g module_name=$1
}

function config {
    declare -g ${module_name}_$1=$2
}

function method {
    parameters \
	required name $1

    original=`declare -f $name`
    renamed=${original/$name ()/${module_name}_$name ()}
    eval "$renamed"
    unset -f $name
}
