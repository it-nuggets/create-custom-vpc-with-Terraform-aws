output "PublicIP" {
  value = aws_instance.terraform-instance.public_ip
}