#!/usr/bin/env bash

docker login -u $DOCKER_USER -p $DOCKER_PASS

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

REGISTRY="hub.docker.com"

docker build -f Dockerfile -t ${REGISTRY}/${IMAGE_NAME}:${TAG}
docker push ${REGISTRY}/${IMAGE_NAME}