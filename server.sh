#!/bin/bash

local_network="192.168.1.0/24" #defining local network

: '
list all the employee phone MAC addresses
TO DO: use array or map
'

rafi="D0:13:FD:27:9C:0A"
sajib="88:11:96:E5:40:52"
emon=""

while :
do
    : '
    get all the MAC addresses from network except the server.
    used nmap.
    parse the result using awk.
    '
    result=$(sudo nmap -sn $local_network | awk '/Nmap scan report/{getline;getline;print $3;}')

    #Getting rid of unwanted last line.
    last_line=`echo "${result##*$'\n'}"`
    result=${result%$last_line}

    echo "$result"

    if [[ "$result" =~ "$rafi" ]]; then
        echo "matched"
    else
        echo "didn't match"
    fi
done