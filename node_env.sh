#!/bin/bash
sudo su
yum update -y
# Install Node.js 6.x repository
curl -sL https://rpm.nodesource.com/setup_6.x | bash -
# Install Node.js and npm
yum install nodejs
# Install Gulp
npm install --global gulp
# Install git
yum install git
# Install PM2
npm install pm2 -g
