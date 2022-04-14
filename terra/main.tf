terraform {    
  required_providers {    
    azurerm = {    
      source = "hashicorp/azurerm"    
    }    
  }    
}    
provider "azurerm" {    
  features {}    
}    
resource "azurerm_resource_group" "mygrop" {    
  name = "RG"    
  location = "eastus"    
}   
resource "azurerm_app_service_plan" "terraplan" {  
  name                = "terraf"  
  location            = "eastus"  
  resource_group_name = azurerm_resource_group.mygrop.name  
  
  sku {  
    tier = "Free"  
    size = "F1"  
  }  
}  
  
resource "azurerm_app_service" "myapp" {  
  name                = "terrafweba"  
  location            = "eastus"  
  resource_group_name = azurerm_resource_group.mygrop.name  
  app_service_plan_id = azurerm_app_service_plan.terraplan.id  
  
  app_settings = {  
    "DeviceName" = "SampleDevice",  
    "DeviceId" = "2"  
  }  
} 
