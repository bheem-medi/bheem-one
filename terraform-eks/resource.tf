resource "aws_instance" "dev-env" {
ami = "ami-02457590d33d576c3"
instance_type = "t2.medium"
tags = {
Name = "camp-server"
Environment = "dev"
Client = "bheem_medi"
}
key_name = "devops_practice_key"
availability_zone = "us-east-1d"

root_block_device {
  volume_size = 20
}
}
