#!/bin/bash -ex

tag=$(echo ${PWD} | tr / - | cut -b2- | tr A-Z a-z)
params="-v ${PWD}:${PWD} --rm -w ${PWD} ${tag}"

docker build --tag=${tag} docker

docker run $params $@
