locals {
  config = yamldecode(file("${path.module}/sg.yml"))
}

# wip..

#locals {
#  yml = [
#    for file in fileset(path.root) :
#    yamldecode(file(file))
#  ]
#}

#resource "azurerm_resource_group" "example" {
#  name = local.config.name
#  location = local.config.location
#}

