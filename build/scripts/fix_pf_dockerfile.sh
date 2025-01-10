#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[ ! -d "dist" ] && echo "A dist folder was not found. Ensure you're in the prompt flow directory and have already executed the 'pf build ...' command" && exit 1

docker ps > /dev/null 2>&1
[ $? -eq 1 ] && echo "Docker does not appear to be running so this script cannot complete. Please start Docker and try again" && exit 1

image_match=$(docker images | grep pf | grep python-3.10)
[ -z "$image_match" ] && echo "The base pf image doesn't exist. You'll need to execute the 'build_pf_base.sh' script first" && exit 1

echo "Copying new Dockerfile to ./dist/Dockerfile"
cp $SCRIPT_DIR/../resources/pfapp.Dockerfile dist/Dockerfile