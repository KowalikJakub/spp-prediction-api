#!/bin/bash

DOCKER_REPOSITORY='kowalikjakub/spp_api'
docker tag spp_api $DOCKER_REPOSITORY

echo "Deploying branch ${TRAVIS_BRANCH}"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
if [ $TRAVIS_BRANCH == 'master' ]
then
    docker push $DOCKER_REPOSITORY
elif [ $TRAVIS_BRANCH == 'develop' ]
then
    docker push $DOCKER_REPOSITORY
else
    echo "No matching configuration for ${TRAVIS_BRANCH}, skipping deploy stage"
fi
