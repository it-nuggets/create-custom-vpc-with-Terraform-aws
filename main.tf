resource "aws_vpc" "it-nuggets-vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
      Name = "it-nuggets-vpc"
    }
}
