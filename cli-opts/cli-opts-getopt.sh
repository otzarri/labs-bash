#!/bin/bash

# Script example showing how to handle CLI options in Bash using getopt.
# This script simulates a system user creation.
# To test this script run: bash opts.sh --username tux -p TuxPass --enable

# Variables and default values
username=''
password='P4ssW0rd..'
enabled=false

# Parse options
args=$(getopt -l "username:,password:,enable,verbose,help" -o "u:,p:,e,v,h" -- "${@}")
eval set -- "${args}"
while [ ${#} -ge 1 ]; do
    case "${1}" in
        --) shift; break;;
        -u|--username) username="$2"; shift;;
        -p|--password) password="$2"; shift;;
        -e|--enable) enabled=true;;
        -v|--verbose) set -x;;
        -h|--help)
            echo "Usage: ${0} [options...]"
            echo "Options:"
            echo "    -u, --username <user-name>    System name for the new user"
            echo "    -p, --password <password>     Password for the new user (Default: P4ssW0rd..)"
            echo "    -e, --enable                  Enable the user after creating it (Default: false)"
            echo "    -v, --verbose                 Show more detailed output"
            echo "    -h, --help                    Show this help message"
            exit 0;;
    esac
    shift
done

# Show output
echo ""
echo "New user creation"
echo "Username: $username"
echo "Password: $password"
echo "Enabled: $enabled"
echo ""