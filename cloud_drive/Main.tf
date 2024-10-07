provider "aws" {
    region = "us-east-1"
  
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Terraform_Cloud_Drive"

  instance_type          = "t2.micro"
  key_name               = "Terraform-key"
  ami = "ami-0fff1b9a61dec8a5f"
  vpc_security_group_ids = ["sg-0dd15a5d84bcf3f11"]
  subnet_id              = "subnet-0bb6c50ecc78cd78c"

  tags = {
    Terraform   = "true"
    Environment = "Prod"
    Name = "Cloud Drive device 1"
  }
}

output "ec2" {
    value = aws_instance.myec2.id
  
}
