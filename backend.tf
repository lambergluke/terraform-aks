terraform {
  backend "azurerm" {
    resource_group_name = "state"
    storage_account_name = "terraformstateless"
    container_name = "statey"
    key = "testcluster.tfstate"
    }
  
}
