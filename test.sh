#!/bin/bash

set -ex

trap "{ exit=$?; docker kill test ; docker rm test; exit $exit; }" EXIT

docker build . -t test
docker run -d -p 8080:80 --name=test test
curl localhost:8080