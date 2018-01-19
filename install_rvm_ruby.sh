#!/bin/bash

sudo add-apt-repository ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm

source /etc/profile.d/rvm.sh
rvm install ruby

source ~/.zshrc

gem install bundler rake rspec wirble sinatra mysql2 cucumber rails --no-doc --no-ri
