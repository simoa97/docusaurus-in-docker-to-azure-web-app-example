resource "azurerm_resource_group" "docusaurus" {
  name     = "${var.app_name}-rg"
  location = var.location

  tags = {
    Application = var.app_name
  }
}

resource "azurerm_container_registry" "docusaurus" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.docusaurus.name
  location            = azurerm_resource_group.docusaurus.location
  sku                 = var.acr_sku
  admin_enabled       = true

  tags = {
    Application = var.app_name
  }
}

resource "azurerm_service_plan" "docusaurus" {
  name                = "${var.app_name}-service-plan"
  resource_group_name = azurerm_resource_group.docusaurus.name
  location            = azurerm_resource_group.docusaurus.location
  os_type             = "Linux"
  sku_name            = var.app_service_sku

  tags = {
    Application = var.app_name
  }
}

resource "azurerm_linux_web_app" "docusaurus" {
  name                = "${var.app_name}-app"
  resource_group_name = azurerm_resource_group.docusaurus.name
  location            = azurerm_service_plan.docusaurus.location
  service_plan_id     = azurerm_service_plan.docusaurus.id

  site_config {
    always_on = false

    application_stack {
      docker_image_name        = "${var.image_name}:latest"
      docker_registry_url      = "https://${azurerm_container_registry.docusaurus.login_server}"
      docker_registry_username = azurerm_container_registry.docusaurus.admin_username
      docker_registry_password = azurerm_container_registry.docusaurus.admin_password
    }
  }

  tags = {
    Application = var.app_name
  }
}