# add the below resource in the ec2.tf file to launch an ec2 instance

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners      = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "terraform-instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = var.PUB_KEY
  vpc_security_group_ids = [aws_security_group.terrafrom_sg.id]
  tags = {
    Name = "Terraform_Instance_it_nuggets"
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo yum -y update
                sudo yum -y install httpd
                sudo systemctl start httpd
                sudo systemctl enable httpd
                EOF
  lifecycle {
    create_before_destroy = true
    }  


}
