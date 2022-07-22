terraform {
  backend "azurerm" {
    resource_group_name = "tfstate"
    storage_account_name = "terraformstatelesss"
    container_name = "statey"
    key = "testcluster.tfstate"
    }
  
}
