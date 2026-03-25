variable "instance_ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
}

variable "ip_address" {
  description = "name of the personal ip address associated with my account"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}