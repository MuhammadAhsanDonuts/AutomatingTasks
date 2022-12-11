#! /bin/bash

#https://dev.to/francoislp/simple-docker-compose-continuous-deployment-50nf 
#SOURCE ____________---____________________________________________-----___________

if [ -z "$1" ];  then
        echo "  [!] No argument supplied, this script expects a docker tag to run."
        exit 1
fi

tag=$1
image="user/project"

echo "[>] Starting deployment"

echo "  [+] Remove containers, volume and networks older than 1 week..."
docker system prune --force --filter "until=168h"

cd /docker

echo "  [+]  Bitbucket commit ID: $tag"

echo "  [+]  Pull image $image:$tag"
pull=$(docker pull $image:$tag)

# Check if docker pull returns empty string
if [[ -z "$pull" ]]; then
        echo "  [!] Fail to pull image with tag $tag"
        exit 1
fi

echo "  [+] Start (or Restart) containers: docker-compose up -d"
TAG=$tag docker-compose up -d

echo "[>] Deployment done."

