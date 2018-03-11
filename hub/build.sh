#!/usr/bin/env bash
IMAGE_NAME=nielsbohr/jupyterhub
IMAGE_VERS=edge

docker build -t $IMAGE_NAME:$IMAGE_VERS .
docker build -t $IMAGE_NAME:$IMAGE_VERS -f Dockerfile.test .
