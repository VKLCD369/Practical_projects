#!/bin/bash

#################################
# Author: vamshikiran
# date: 14th jan
# version: V1
# Script: Automatically install packages through shell script
# #####################################



LOG_FILE="/var/log/Package_install.log"

echo "=====================================" | tee -a $LOG_FILE
echo "Package installation started at $(date)" | tee -a $LOG_FILE
echo "=====================================" | tee -a $LOG_FILE

#functions to check and install packages
install_package() {
  PACKAGE_NAME=$1

  if dpkg -l | grep -qw "$PACKAGE_NAME" ; then
    echo "$PACKAGE_NAME is already installed" | tee -a $LOG_FILE
  else
    echo "Installing Package $PACKAGE_NAME...." | tee -a $LOG_FILE
    sudo apt install -y "$PACKAGE_NAME" | tee -a $LOG_FILE 2>&1
  fi
}

#Update System

echo "Updating Package list.........." | tee -a $LOG_FILE
sudo apt update -y >> tee -a $LOG_FILE 2>&1

#Install Packages

install_package git
install_package curl

#Install Node js
if [ ! command -v node >/dev/null 2>&1 ]; then
  echo "Installing node js....." | tee -a $LOG_FILE
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - >> tee -a $LOG_FILE 2>&1
  sudo apt install -y nodejs >> tee -a $LOG_FILE 2>&1
else
  echo "Node. js is already installed..." | tee -a $LOG_FILE
fi

#Install Docker
if [ ! command -v docker >/dev/null 2>&1 ]; then
  echo "Installing Docker...." | tee -a $LOG_FILE
  sudo apt install -y ca-certificates gnupg lsb-release >> tee -a $LOG_FILE 2>&1
  curl -fsSL https://get.docker.com | sudo sh >> tee -a $LOG_FILE 2>&1
  sudo usermod -aG docker $USER
else
  echo "Docker is already installed..." | tee -a $LOG_FILE
fi

echo "====================================" | tee -a $LOG_FILE
echo "package installation completed at $(date)" | tee -a $LOG_FILE
