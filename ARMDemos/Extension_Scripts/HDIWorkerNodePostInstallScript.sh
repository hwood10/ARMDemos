#!/bin/bash

#mnt_filesystem=%1
#mnt_directory="/apps/LoyaltyJ4U/data"
#mnt_user=%2
#mnt_pwd=%3
#mnt_options="vers=3.0,user=$mnt_user,password=$mnt_pwd,dir_mode=0777,file_mode=0777"

#sudo mkdir -p $directory
#echo "$mnt_filesystem mnt_directory cifs $mnt_options" | sudo tee -a /etc/fstab

#sudo mount -a

mnt_directory="/apps/LoyaltyJ4U/data"
sudo mkdir -p $mnt_directory
mnt_filesystem=%1
echo "$mnt_filesystem" | sudo tee -a /apps/LoyaltyJ4U/data/test.log

mnt_user=%2
echo "$mnt_user" | sudo tee -a /apps/LoyaltyJ4U/data/test.log

mnt_pwd=%3
echo "$mnt_pwd" | sudo tee -a /apps/LoyaltyJ4U/data/test.log

mnt_options="vers=3.0,user=$mnt_user,password=$mnt_pwd,dir_mode=0777,file_mode=0777"
echo "$mnt_options" | sudo tee -a /apps/LoyaltyJ4U/data/test.log

