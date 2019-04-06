#!/bin/bash

set -ex

trap "{ exit=$?; docker kill test ; docker rm test; exit $exit; }" EXIT
cd /workspace
docker build . -t test
docker run --network=cloudbuild -d -p 8080:80 --name=test test

sleep 2
curl localhost:8080
