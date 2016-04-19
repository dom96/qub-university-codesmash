#!/usr/bin/env bash

source /home/vagrant/.rvm/scripts/rvm

app_path="$1"

cd $1
gem install bundle
bundle
