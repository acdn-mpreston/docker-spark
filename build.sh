#!/bin/bash

set -e

TAG=2.4.5-scala2.12

build() {
    NAME=$1
    IMAGE=gcr.io/npav-172917/spark-backfill-$NAME:$TAG
    cd $([ -z "$2" ] && echo "./$NAME" || echo "$2")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE .
    cd -
}

build base
build master
build worker
build submit
build java-template template/java
build scala-template template/scala
build python-template template/python
