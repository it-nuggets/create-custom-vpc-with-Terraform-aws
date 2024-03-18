resource "aws_security_group" "terrafrom_sg" {
    name = "allow_ssh"
    description = "sg to allow ssh and port 80"
    vpc_id = aws_vpc.it-nuggets-vpc.id

    ingress {
    from_port   = 22  # SSH port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      name = "Terraform__it_nuggets_project_sg"
    }
  
}