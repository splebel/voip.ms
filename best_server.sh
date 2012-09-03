#!/bin/sh

for server in $(cat servers.txt); do
	time=$(ping -c 5 -t 2 $server|egrep -o 'time=[0-9]*\.[0-9]*'|awk -F \= '{print $2}'|sort -n|head -n 1)
	echo "$time ms : $server"
done | sort -n

