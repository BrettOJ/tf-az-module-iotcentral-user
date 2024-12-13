locals {
  naming_convention_info = {
    name = "001"
    site = "dev"
    env  = "boj"
    app  = "web"
  }
  tags = {
    "Environment" = "Dev"
  }
}


module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}
module "azurerm_iotcentral_application" {
  source                        = "git::https://github.com/BrettOJ/tf-az-module-azure-iot-central-application?ref=main"
  resource_group_name           = module.resource_groups.rg_output[1].name
  location                      = var.location
  sub_domain                    = var.sub_domain
  display_name                  = var.display_name
  public_network_access_enabled = var.public_network_access_enabled
  sku                           = var.sku
  template                      = var.template
  naming_convention_info        = local.naming_convention_info
  tags                          = local.tags
}

module "azure_iotcentral_organization_parent" {
  source                    = "git::https://github.com/BrettOJ/tf-az-module-azure-iot-central?ref=main"
  iotcentral_application_id = module.azurerm_iotcentral_application.iotc_app_output.id
  organization_id           = "boj-iot-central-org"
  display_name              = "boj-iot-central-org-parent"
  parent_organization_id    = null
}



module "iotcentral_user" {
  source       = "git::https://github.com/BrettOJ/tf-az-module-iotcentral-user?ref=main"
  email        = var.email
  role         = var.role
  organization = module.azure_iotcentral_organization_parent.iotc_org_output.id
}


