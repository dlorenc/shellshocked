#!/bin/bash

set -ex
version=v1
project="$(gcloud config get-value project)"
image="gcr.io/${project}/demo:${version}"
docker build . -t "${image}"
docker push "${image}"
