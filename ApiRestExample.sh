#!/bin/sh
echo "Installing Utils and Environment"
sudo yum upgrade -y
sudo yum install docker python3 git -y

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

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
