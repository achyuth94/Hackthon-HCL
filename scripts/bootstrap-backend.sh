#!/usr/bin/env bash
set -euo pipefail
AZ_SUBSCRIPTION_ID="${AZ_SUBSCRIPTION_ID:-}"
TF_RG="${TF_RG:-tfstate-rg}"
TF_LOCATION="${TF_LOCATION:-eastus}"
TF_SA_NAME="${TF_SA_NAME:-tfstate$(date +%s)}"
TF_CONTAINER="${TF_CONTAINER:-tfstate}"

if [ -z "$AZ_SUBSCRIPTION_ID" ]; then
  echo "Set AZ_SUBSCRIPTION_ID environment variable"
  exit 1
fi

az account set --subscription "$AZ_SUBSCRIPTION_ID"
az group create -n "$TF_RG" -l "$TF_LOCATION"
az storage account create -n "$TF_SA_NAME" -g "$TF_RG" -l "$TF_LOCATION" --sku Standard_LRS --kind StorageV2
az storage container create -n "$TF_CONTAINER" --account-name "$TF_SA_NAME"
echo "Done. SA: $TF_SA_NAME, container: $TF_CONTAINER, RG: $TF_RG"
