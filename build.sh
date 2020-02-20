#!/usr/bin/env bash

set -eou pipefail

rm -rf build/kubano
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o build/kubano

docker build -t danielgormly/drone-plugin-kube:0.1.0 build
docker push danielgormly/drone-plugin-kube:0.1.0
