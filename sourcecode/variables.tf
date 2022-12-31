
# VPC details

variable "custom_vpc" {
  description = "VPC for dev environment"
  type        = string
  default     = "10.0.0.0/16"
}


# AWS EC2 Details

variable "instance_tenancy" {
  description = "it defines the tenancy of VPC. Whether it's defsult or dedicated"
  type        = string
  default     = "default"
}

variable "ami_id" {
  description = "ami id"
  type        = string
  default     = "ami-087c17d1fe0178315"
}

variable "instance_type" {
  description = "Instance type to create an instance"
  type        = string
  default     = "t2.micro"
}
