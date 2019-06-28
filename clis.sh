#!/bin/bash

wget https://github.com/cloudfoundry/bosh-bootloader/releases/download/v7.6.0/bbl-v7.6.0_linux_x86-64
chmod +x bbl-v7.6.0_linux_x86-64
mv bbl-v7.6.0_linux_x86-64 /usr/bin/bbl

wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.4.0/credhub-linux-2.4.0.tgz
tar -xvf credhub-linux-2.4.0.tgz
mv credhub /usr/bin/credhub

wget https://github.com/cloudfoundry/bosh-cli/releases/download/v5.5.0/bosh-cli-5.5.0-linux-amd64
chmod +x bosh-cli-5.5.0-linux-amd64
mv bosh-cli-5.5.0-linux-amd64 /usr/bin/bosh

curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.43.0&source=github-rel" | tar -zx
mv cf /usr/bin/cf
