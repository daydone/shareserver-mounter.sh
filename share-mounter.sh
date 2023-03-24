#!/bin/bash

#Mounts Windows share server using cfis
echo 'Please specify a user:'
read user
user=$1
echo 'Please specify the share path:'
read server
server=$2

#I want to add an option to check whether to run with webdav also

 

echo 'If you typoed please select enter and rerun the script!'
sudo mount -t cifs '$2' /shareserver/ -o user=$1
