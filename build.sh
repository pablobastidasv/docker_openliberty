#!/bin/sh
IMAGE_NAME=openliberty
VERSION=v3.1
docker image rm pablobastidasv/${IMAGE_NAME}:${VERSION}-rc || true
docker image build -t pablobastidasv/${IMAGE_NAME}:${VERSION}-rc .