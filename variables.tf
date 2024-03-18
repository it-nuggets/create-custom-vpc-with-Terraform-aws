variable "aws_region" {
    description = "AWS region"
    default = "eu-central-1"
  
}

variable "cidr_block" {
    description = "cidr block for the vpc"
    default = "10.0.0.0/16"
  
}

variable "ZONE1" {
  default = "eu-central-1a"
}

variable "ZONE2" {
  default = "eu-central-1b"
}



variable "AMIS" {
  default = {
    eu-central-1 = "ami-064573ac645743ea8"
  }
}

variable "USER" {
  default = "user-ec2"
}

variable "PUB_KEY" {
  default = "access_ec2"
}