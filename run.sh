#!/bin/bash
includes=`dirname $0`

source $includes/modules.library

$includes/ibrahimelfar/configuregit.sh
module master
prereq emacs
