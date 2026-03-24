terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
  backend "s3" {
    bucket = "terraform-remote-24march"
    key    = "path/to/my/key" #create the key next time
    region = "us-east-1"
  }
}



provider "aws" {
  #configure the AWS provider with your credentials and region
  region = "us-east-1"
}