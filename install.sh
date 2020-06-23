#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install apt-utils
apt-get install -yq \
  apt-transport-https \
  aria2 \
  asciidoc \
  autoconf \
  autoconf \
  automake \
  awscli \
  bash-completion \
  bison \
  build-essential \
  cowsay \
  curl \
  direnv \
  docker.io \
  fasd \
  fd-find \
  git \
  gpg \
  jq \
  lastpass-cli \
  libffi-dev \
  libgdbm-dev \
  libncurses5-dev \
  libreadline-dev \
  libssl-dev \
  libyaml-dev \
  lsb-release \
  npm \
  python3-pip \
  ripgrep \
  silversearcher-ag \
  software-properties-common \
  tmux \
  tree \
  wget \
  zlib1g-dev \

sudo ln -s $(which fdfind) /usr/bin/fd

# last update
apt-get update

# neovim
wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
chmod +x nvim.appimage
mv nvim.appimage /usr/local/bin/nvim

# install golang the right way
mkdir -p /tmp/installscratch
cd /tmp/installscratch
wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
tar -xvf go*
rm -rf /usr/local/go
mv go /usr/local
rm -rf /tmp/installscratch

# cf
mkdir /tmp/cf
pushd /tmp/cf
  curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx
  curl -o /usr/share/bash-completion/completions/cf https://raw.githubusercontent.com/cloudfoundry/cli/master/ci/installers/completion/cf
  mv cf /usr/local/bin
popd

# bosh
mkdir /tmp/bosh
pushd /tmp/bosh
url=$(curl -s https://api.github.com/repos/cloudfoundry/bosh-cli/releases | jq -r '.[0].assets[] | select(.name | contains("linux-amd64")).browser_download_url')
  wget -O bosh "$url"
  chmod +x bosh
  mv bosh /usr/local/bin/
popd

# fly
wget -O fly "https://networking.ci.cf-app.com/api/v1/cli?arch=amd64&platform=linux"
chmod +x fly
mv fly /usr/local/bin

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl

# the correct yq
pip3 install yq neovim

# k14s
curl -L https://k14s.io/install.sh | bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

# istioctl
mkdir /tmp/istio
pushd /tmp/istio
  curl -L https://istio.io/downloadIstio | sh -
  sudo mv istio-*/bin/istioctl /usr/local/bin
popd
