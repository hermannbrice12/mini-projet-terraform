data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners = [ "ubuntu" ]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "securitygroup" {
  source = "../modules/securitygroup"
  security_group_name = "devops_sg"
}

module "ec2" {
  source = "../modules/ec2"
  tag_name = "devops_ec2"
  security_group_name = module.securitygroup.security_group_name
  user = "ubuntu"
  key_name = "devops"
  availability_zone = "us-east-1a"
  ami = 

}

module "eip" {
  source = "../modules/eip"
  eip_name = "devops_eip"
}

module "ebs" {
  source = "../modules/ebs"
  ebs_size = 10
  ebs_zone = "us-east-1a"
  ebs_tags = "devops_ebs"
}

resource "aws_eip_association" "eip_association" {
  instance_id = module.ec2.ec2_id
  allocation_id = module.eip.eip_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  instance_id = module.ec2.ec2_id
  volume_id = module.ebs.ebs_id
}