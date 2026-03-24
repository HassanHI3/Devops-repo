terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }

  backend "s3" {
    bucket = "terraform-assignment-111"
    key    = "path/to/my/key"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}