#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$(cd -- $SCRIPT_DIR/../.. && pwd)
BASE_DOCKERFILE_DIR=$ROOT_DIR/src/base-images/azureml

docker build $BASE_DOCKERFILE_DIR -t pf:azureml