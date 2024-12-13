variable "email" {
  description = "The email address to use for the AWS account"
  type        = string
}

variable "role" {
  description = "The role to assign to the user"
  type        = string
}

variable "organization" {
  description = "The organization to assign the user to"
  type        = string
}

