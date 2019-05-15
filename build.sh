#!/bin/sh
IMAGE_NAME=openliberty
VERSION=v3
docker image rm pablobastidasv/${IMAGE_NAME}:${VERSION} || true
docker image build -t pablobastidasv/${IMAGE_NAME}:${VERSION} .

docker image rm pablobastidasv/${IMAGE_NAME}:latest || true
docker image build -t pablobastidasv/${IMAGE_NAME}:latest .
