resource "iotcentral_user" "crete_user" {
  email = var.email
  roles = [ 
    {
      role = var.role
      organization = var.organization
    }
  ]
}
