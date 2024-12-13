# tf-az-module-iotcentral-user

## iotcentral\_user (Resource)

## [Example Usage](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#example-usage)

```terraform
data "iotcentral_role" "example" { display_name = "Org Administrator" } resource "iotcentral_organization" "example" { id = "example" display_name = "Example" } resource "iotcentral_user" "example" { email = "example@example.net" roles = [ { role = data.iotcentral_role.example.id organization = iotcentral_organization.example.id } ] }
```

## [Schema](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#schema)

### [Required](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#required)

-   [`email`](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#email-1) (String) Email address of the user.
-   [`roles`](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#roles-1) (Attributes Set) List of role assignments that specify the permissions to access the application. (see [below for nested schema](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#nestedatt--roles))

### [Read-Only](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#read-only)

-   [`id`](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#id-1) (String) Unique ID of the user.

### [Nested Schema for `roles`](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#nested-schema-for-roles)

Required:

-   [`role`](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#role-1) (String) ID of the role for this role assignment.

Optional:

-   [`organization`](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#organization-1) (String) ID of the organization for this role assignment.

## [Import](https://registry.terraform.io/providers/KenSpur/azure-iot-central/latest/docs/resources/user#import)

Import is supported using the following syntax:

```shell
terraform import iotcentral_user.example Id
```