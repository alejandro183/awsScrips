#!/bin/sh
echo "Installing Utils and Environment"
sudo yum upgrade -y
sudo yum install docker python3 git -y

echo "Downloading the project"
git clone https://github.com/alejandro183/pythonApi.git

echo "Downloading the mongo Image for Docker"
docker pull mongo

echo "Setting up the API rest env"
pip3 install pipenv

pipenv shell

pip install flask
pip install pymongo

