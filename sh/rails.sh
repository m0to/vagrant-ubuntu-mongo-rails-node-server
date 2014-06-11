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
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

#rbenv install 2.1.0
#rbenv global 2.1.0
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc