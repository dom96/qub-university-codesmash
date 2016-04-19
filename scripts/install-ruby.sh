#!/usr/bin/env bash

source /home/vagrant/.rvm/scripts/rvm

version=$1
gemset=$2

rvm use --default --install --create $version@$gemset
