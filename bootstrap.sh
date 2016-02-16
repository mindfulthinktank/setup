#!/bin/bash
apt-get -qq -y install git
git clone https://github.com/mindfulthinktank/setup.git
cd setup
./run.sh
