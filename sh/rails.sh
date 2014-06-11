#!/bin/bash

# Install rbenv, ruby, gem & rails

# Prerequisites
# install git
apt-get -y install git-core
# install ruby developer packages
apt-get -y install make build-essential libssl-dev libreadline6-dev zlib1g-dev libyaml-dev libsqlite3-dev libssl-dev libc6-dev libpq-dev libcurl4-openssl-dev libksba8 libksba-dev libqtwebkit-dev
# headless requirements
apt-get -y install xvfb

# install rbenv and ruby-build
sudo -u vagrant git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
sudo -u vagrant echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
sudo -u vagrant echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
sudo -u vagrant git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

# no rdoc for installed gems
sudo -u vagrant echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc

# install required ruby versions
sudo -u vagrant -i rbenv install 2.0.0-p0
sudo -u vagrant -i rbenv global 2.0.0-p0
sudo -u vagrant -i ruby -v
sudo -u vagrant -i gem install bundler --no-ri --no-rdoc
sudo -u vagrant -i rbenv rehash