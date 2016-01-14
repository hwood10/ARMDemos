#!/bin/bash

mnt_filesystem=%1
mnt_directory="/apps/LoyaltyJ4U/data"
mnt_user=%2
mnt_pwd=%3
mnt_options="vers=3.0,user=$mnt_user,password=$mnt_pwd,dir_mode=0777,file_mode=0777"

sudo mkdir -p $directory
echo "$mnt_filesystem mnt_directory cifs $mnt_options" | sudo tee -a /etc/fstab

sudo mount -a
