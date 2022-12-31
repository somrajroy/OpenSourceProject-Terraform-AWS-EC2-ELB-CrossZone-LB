terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = "PUT_YOUR_ACCESS_KEY"
  secret_key = "PUT_YOUR_SECRET_KEY"
}