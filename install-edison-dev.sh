#!/usr/bin/env bash

apt-get install -y ruby
which chef-solo || {
  wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef_12.0.3-1_amd64.deb
  dpkg -i chef_12.0.3-1_amd64.deb
  rm chef_12.0.3-1_amd64.deb
}
sed 's?COOKBOOK_PATH?'`pwd`'\/cookbooks?' solo.rb.in > solo.rb
chef-solo -c solo.rb -j edison-dev.json
