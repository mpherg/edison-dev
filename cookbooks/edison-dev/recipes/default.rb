#
# Cookbook Name:: edison-dev
# Recipe:: default
#
# No rights reserved - use at your own risk.
#

packages = %w[
  make
  automake
  gcc
  g++
  build-essential
  gcc-multilib
  git
  unzip
]

# Install prerequisite packages
packages.each do |pkg|
  package pkg
end

# Download the Intel Edison SDK
sdk_zip = "edison-sdk-linux64-rel1-maint-rel1-ww42-14.zip"
sdk_zip_cache = "#{Chef::Config[:file_cache_path]}/" + sdk_zip
sdk_installer = "poky-edison-eglibc-x86_64-edison-image-core2-32-toolchain-1.6.sh"
sdk_installer_cache = "#{Chef::Config[:file_cache_path]}/" + sdk_installer

remote_file sdk_zip_cache do
  source "http://downloadmirror.intel.com/24389/eng/" + sdk_zip
  not_if { ::File.exists?(sdk_zip_cache) }
end

# Unzip the SDK (unzips to a .sh file)
execute "Unzip SDK" do
  command "unzip " + sdk_zip
  cwd "#{Chef::Config[:file_cache_path]}"
  not_if { ::File.exists?(sdk_installer_cache) }
end

# Run shell script to install SDK
execute "Install SDK" do
  command "./poky-edison-eglibc-x86_64-edison-image-core2-32-toolchain-1.6.sh -y"
  cwd "#{Chef::Config[:file_cache_path]}"
  not_if { ::File.exists?("/opt/poky-edison/1.6/version-core2-32-poky-linux") }
end
