provider "azurerm" {}
terraform {
  backend "azurerm" {}
  required_version = ">= 0.12"
}

resource "azurerm_resource_group" "acidemobook" {
name = "demoBook"
location = "westus2"
}
variable "imageversion" {
description ="Tag of the image to deploy"
}
variable "dockerhub-username" {
description ="Tag of the image to deploy"
}

resource "azurerm_container_group" "aci-myapp" {
 name = "aci-agent"
 location = "West Europe"
 resource_group_name = azurerm_resource_group.acidemobook.name
 os_type = "linux"
 container {
 name = "vamsi"
 image  = "docker.io/${var.dockerhub-username}/vamsi:${var.imageversion}"
 cpu = "0.5" memory = "1.5"
 ports {
 port = 80
 protocol = "TCP"
 }
 }
}