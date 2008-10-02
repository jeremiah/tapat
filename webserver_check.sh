#!/bin/bash

# Name:                    webserver_check.sh
# Purpose:                 Check that a web server is responding to requests

# We use a library to get the functionality we need
source tap_functions.sh
plan_tests 2 # TAP
 
if [ -e tap_functions.sh ] ; then 
    pass "$0: Library file exists"
else 
    fail "$0: File does not exist"
fi

# Most of the work gets done by expect
if ./check_webserver.exp one jeremiahfoster.com ; then
    pass "$0: Server answered"
else 
    fail "$0: Server may be down."
fi
