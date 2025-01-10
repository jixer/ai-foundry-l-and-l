#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$(cd -- $SCRIPT_DIR/../.. && pwd)

cd $ROOT_DIR/deployments/infra/terraform/

# fetch vars from the output
app_rg=$(terraform output -raw apps_resource_group)
app=$(terraform output -raw promptflow_app)
acr=$(terraform output -raw container_registry)

# nav back to starting directory
cd --

az webapp deployment container config --enable-cd true --name $app --resource-group $app_rg

az webapp config container set \
    --name $app \
    --resource-group $app_rg \
    --docker-custom-image-name "$acr/promptflow/flows/grand-canyon:latest" \
    --docker-registry-server-url "https://$acr"