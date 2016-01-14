#!/bin/bash

#NewRelic Server Install

sudo -i
echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -
apt-get update
apt-get install newrelic-sysmond
nrsysmond-config --set license_key=100fd566d2831cf9d2c8fb645c4561f8c846e6a5
/etc/init.d/newrelic-sysmond start

