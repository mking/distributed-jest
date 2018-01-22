#!/usr/bin/env bash

set -euxo pipefail

# wait for initialization
# https://www.packer.io/docs/provisioners/shell.html
sleep 10

# configure node repo
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# configure yarn repo
# https://yarnpkg.com/lang/en/docs/install/#linux-tab
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# update repos
sudo apt-get update

# configure ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# install node
sudo apt-get install -y nodejs

# install yarn
sudo apt-get install -y yarn

# clone repo
git clone git@github.com:mking/distributed-jest.git

# install packages
cd distributed-jest/test
yarn
