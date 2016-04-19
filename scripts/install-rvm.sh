#!/usr/bin/env bash

if [[ -f /home/vagrant/.rvm/scripts/rvm ]] ; then
  echo 'rvm already installed - ignoring'
  exit
fi

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s $1

