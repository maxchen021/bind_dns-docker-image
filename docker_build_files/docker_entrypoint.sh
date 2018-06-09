#!/bin/bash

/usr/sbin/named-checkconf -z /usr/local/named/named.conf

#if command is not empty
if [ ! -z $1 ]; then
    if [ "$1" == "reload" ]; then
        /bin/kill -HUP `cat /run/named/named.pid`
        echo 'Named reloaded successfully'
        exit
    fi
else
    #ipv4 for now
    /usr/sbin/named -u named -4 -c /usr/local/named/named.conf
    echo 'Named started successfully'
fi



fail_count=0
max_fail_count=3

while true;
do
    if [ `ps -ef | grep named | grep -v grep | wc -l` -eq 0 ]; then
        fail_count=$(( $fail_count + 1 ))
    fi

    if [ $fail_count -gt $max_fail_count ]; then
        echo "Error: named failed more than ${max_fail_count} time"
        exit
    fi

    sleep 60
done
