variable "instance_type" {
  type = string 
  default = "t2.medium"
  description = "Instance type for the EC2 instance"
}
variable "availability_zone" {
  
}
variable "key_name" {
    type = string
    default = "projet-terraform"
    description = "Key pair name for the EC2 instance"
}

variable "tags" {
  type = map 
  default = {
    "Name" = "ec2"
  }
  description = "Tags for the EC2 instance"
}

variable "security_group_name" {
  type = string 
  default = "security_group"
  description = "Name of the security group"
}

variable "user" {
    type = string
    default = "ubuntu"
    description = "User for the EC2 instance"
}
