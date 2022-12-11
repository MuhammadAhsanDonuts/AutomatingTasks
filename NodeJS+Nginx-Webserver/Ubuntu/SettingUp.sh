#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

. ~/.nvm/nvm.sh

nvm install --lts

node -e "console.log('Running Node.js ' + process.version)"

#Installing Nginx Server -- 

#will enable and install the package from extras.
sudo amazon-linux-extras install -y nginx1

#Restarting the service after
sudo systemctl start nginx.service



