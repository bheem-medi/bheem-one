# Generate an SSH key pair (private + public)
resource "tls_private_key" "pemkey" {
    algorithm = "RSA"
    rsa_bits = 4096
}

# Register the public key with AWS EC2
resource "aws_key_pair" "key_local" {
    key_name = "terra_key_pair"  ## Not the local name, it is name which we provide while creating the pem file in aws
    public_key = tls_private_key.pemkey.public_key_openssh
}

# Use your existing key pair (no tls_private_key resource)
resource "aws_key_pair" "key_local" {
    key_name   = "terra_key_pair"
    public_key = file("${path.module}/terra_key_pair.pub")  # Reference your existing public key
}


resource "aws_instance" "terra_ec2" {
   ami = "ami-0b09ffb6d8b58ca91"
   instance_type = "t2.micro"
   vpc_security_group_ids = [aws_security_group.ssh_access.id]
   key_name = aws_key_pair.key_local.key_name  # Take the value of the key_name attribute from the resource named key_local of type aws_key_pair.
   user_data = <<-EOF
              #!/bin/bash
              yum update -y

              # Install Docker
              yum install -y docker

              # Start Docker service
              systemctl start docker
              systemctl enable docker

              # Add ec2-user to docker group 
              usermod -aG docker ec2-user

              # Install Git
              yum install git -y

            EOF
   tags = {
    Name = "terra-inst"
   }
}


# Add security group resource
resource "aws_security_group" "ssh_access" {
  name        = "ssh-access-sg"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Jenkins
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SonarQube
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-access"
  }
}

