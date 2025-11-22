variable "prefix" { type = string; default = "hackathon" }
variable "location" { type = string; default = "eastus" }
variable "rg_name" { type = string; default = "hackathon-rg" }

# backend variables
variable "tfstate_resource_group" { type = string; default = "tfstate-rg" }
variable "tfstate_storage_account" { type = string }
variable "tfstate_container" { type = string; default = "tfstate" }

# infra names that differ by env
variable "acr_name" { type = string }
variable "aks_name" { type = string }
variable "keyvault_name" { type = string }
