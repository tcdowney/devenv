#!/bin/bash

mkdir -p workspace
cd workspace
echo "Cloning the devenv scripts"
git clone https://github.com/tcdowney/devenv.git

cd devenv
echo "Installing required packages and tools, you may be prompted for your sudo password."
sudo ./install.sh
./configure.sh
cd ~

echo "All done! Disconnect and log back in to ensure you have everything."
