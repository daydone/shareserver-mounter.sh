#!/bin/bash

# Mounts Windows share server using CIFS

# Prompt the user for the necessary information
read -p "Please specify the username: " username
read -p "Please specify the server address: " server

# Add an option to check whether to run with WebDAV also
read -p "Do you want to run with WebDAV? [y/n]: " webdav_option

# Define the mount point
mount_point="/shareserver"

# Check if the mount point exists and create it if necessary
if [ ! -d "$mount_point" ]; then
    sudo mkdir "$mount_point"
fi

# Construct the mount command with the appropriate options
if [[ $webdav_option =~ ^[Yy]$ ]]; then
    # Use WebDAV
    mount_cmd="sudo mount -t davfs \"$server\" \"$mount_point\" -o username=$username"
else
    # Use CIFS
    mount_cmd="sudo mount -t cifs \"$server\" \"$mount_point\" -o username=$username"
fi

# Mount the share
echo "Mounting $server to $mount_point..."
eval "$mount_cmd"

# Check if the mount was successful
if [ $? -eq 0 ]; then
    echo "Mount successful!"
else
    echo "Mount failed."
fi
