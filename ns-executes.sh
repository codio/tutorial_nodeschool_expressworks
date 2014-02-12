#!/bin/bash 
 
# Check parameters 
if [[ "$#" -ne 3 ]]; then 
    echo "3 parameters required" 
    exit 0 
fi 
 
# Translate lesson name into correct name for Workshopper projects 
if [ $2 == "hello_world" ]; then 
    STR=" HELLO WORLD!" 
elif [ $2 == "jade" ]; then 
    STR=" JADE" 
elif [ $2 == "good_old_form" ]; then 
    STR=" GOOD OLD FORM" 
elif [ $2 == "static" ]; then 
    STR=" STATIC" 
elif [ $2 == "stylish_css" ]; then 
    STR=" STYLISH CSS" 
elif [ $2 == "param_pam_pam" ]; then 
    STR=" PARAM PAM PAM" 
elif [ $2 == "whats_in_query" ]; then 
    STR=" WHAT'S IN QUERY" 
elif [ $2 == "json_me" ]; then 
    STR=" JSON ME" 
else 
    echo UNKNOWN: Make sure you have your code file selected before running/verifying 
    exit 0 
fi 
echo SELECTED FILE IS : $STR 
 
#Select the workshopper lesson 
expressworks select $STR > /dev/null 
 
# Run or Verify? 
if [ $1 == "run" ]; then 
    expressworks run $3/$2.js 
elif [ $1 == "verify" ]; then 
    expressworks verify $3/$2.js 
else  
    echo "BAD COMMAND" 
fi