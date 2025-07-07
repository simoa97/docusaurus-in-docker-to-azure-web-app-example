output "web_app_hostname" {
  description = "hostname of the web app"
  value       = azurerm_linux_web_app.docusaurus.default_hostname
}