terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.10.0"
    }
  }
  backend "s3" {
    bucket                  = "terraform-s3-state-in-nuggets"
    key                     = "create-custom-vpc-with-Terraform-aws-it-nuggets"
    region                  = "eu-central-1"
    shared_credentials_file = "~/.aws/credentials"
  }
}


provider "aws" {
  # Configuration options
  region =  var.aws_region
}
