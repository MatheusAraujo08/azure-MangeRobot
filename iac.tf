terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.0.1"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id = "250ae9c3-6c33-4030-b72a-ed22fce22920"
  features {    
  }
}

resource "azurerm_resource_group" "matheus-araujo-robot-t2-group" {
  name = "matheus-araujo-robot-t2-group"
  location = "eastus2"
}

resource "azurerm_service_plan" "matheus-araujo-robot-t2-sp" {
    name = "matheus-araujo-robot-t2-sp"
    resource_group_name = azurerm_resource_group.matheus-araujo-robot-t2-group.name
    location = azurerm_resource_group.matheus-araujo-robot-t2-group.location
    sku_name = "S1"
    os_type = "Windows"
}

resource "azurerm_windows_web_app" "matheus-araujo-robot-t2-app" {
  name = "matheus-araujo-robot-t2-app"
  resource_group_name = azurerm_resource_group.matheus-araujo-robot-t2-group.name
  location = azurerm_resource_group.matheus-araujo-robot-t2-group.location
  service_plan_id = azurerm_service_plan.matheus-araujo-robot-t2-sp.id
  site_config {
    always_on = false
  }
}


  resource "azurerm_windows_web_app_slot" "matheus-araujo-robot-t2-app-QA" {
    name = "matheus-araujo-robot-t2-app-QA"
    app_service_id = azurerm_windows_web_app.matheus-araujo-robot-t2-app.id
    site_config {   
    }
  }
