#!/bin/bash

sudo add-apt-repository ppa:rael-gc/rvm
sudo apt-get update -y
sudo apt-get install rvm -y

source /etc/profile.d/rvm.sh
rvm install ruby

gem install bundler rake rspec wirble sinatra mysql2 cucumber rails --no-doc --no-ri
