#!/bin/sh
echo "Installing Utils and Environment"
sudo yum upgrade -y
sudo yum install python3 git -y
sudo amazon-linux-extras install docker

echo "Downloading the project"
git clone https://github.com/alejandro183/pythonApi.git

echo "Downloading the mongo Image for Docker"
sudo service docker start
docker pull mongo

sudo docker create -it --name MongoTest -p 5000:27017 mongo
sudo docker start MongoTest
echo "MongoDB running on Docker in port 5000"

echo "Setting up the API rest env"
sudo pip3 install pipenv

echo "Done!"
