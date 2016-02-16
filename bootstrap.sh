#!/bin/bash
sudo ufw allow 22
apt-get -qq -y install git
git clone https://github.com/mindfulthinktank/setup.git
cd setup
./run.sh
