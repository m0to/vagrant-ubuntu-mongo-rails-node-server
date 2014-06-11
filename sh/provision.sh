#!/usr/bin/env bash

if [ -e "/etc/vagrant-provisioned" ];
then
    echo "Vagrant provisioning already completed. Skipping..."
    exit 0
else
    echo "Starting Vagrant provisioning process..."
fi

# Change the hostname so we can easily identify what environment we're on:
echo "internx-vagrant" > /etc/hostname
# Update /etc/hosts to match new hostname to avoid "Unable to resolve hostname" issue:
echo "127.0.0.1 internx-vagrant" >> /etc/hosts
# Use hostname command so that the new hostname takes effect immediately without a restart:
hostname internx-vagrant

# Install core components
echo "--------------------------------------------------"
echo "Installing core"
echo "--------------------------------------------------"
/vagrant/sh/core.sh

# Install Node.js
echo "--------------------------------------------------"
echo "Installing NodeJS"
echo "--------------------------------------------------"
/vagrant/sh/nodejs.sh

# Install MongoDB
echo "--------------------------------------------------"
echo "Installing MongoDB"
echo "--------------------------------------------------"
/vagrant/sh/mongodb.sh

# Install Beanstalk
echo "--------------------------------------------------"
echo "Installing Beanstalk"
echo "--------------------------------------------------"
/vagrant/sh/beanstalk.sh

# Install Rails
echo "--------------------------------------------------"
echo "Installing Rails"
echo "--------------------------------------------------"
/vagrant/sh/rails.sh

touch /etc/vagrant-provisioned

echo "--------------------------------------------------"
echo "Your vagrant instance is running at: 192.168.33.10"