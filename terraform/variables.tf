variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "app_name" {
  description = "Base name for the application"
  type        = string
}

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  type        = string
}

variable "app_service_sku" {
  description = "SKU for App Service Plan"
  type        = string
}

variable "image_name" {
  description = "Docusaurus image name"
  type        = string
}