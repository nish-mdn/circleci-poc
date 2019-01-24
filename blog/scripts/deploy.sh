#!/bin/bash
cd ~/circleci-poc && wget https://31-166982537-gh.circle-artifacts.com/0/root/project/own-artifact/own_artifact.zip && unzip own_artifact.zip
cd /usr/src/app

source ~/.bash_profile;
kill -9 $(lsof -i tcp:3000 -t)
echo 'Benchmarking $(pwd)...'
bundle install && rails s -b 0.0.0.0 -d

