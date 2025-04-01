resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  availability_zone = var.availability_zone
  security_groups = [ "${var.security_group_name}"]
  tags = {
    Name = var.tag_name
  }
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
    encrypted = true
    delete_on_termination = true
  }
  provisioner "remote-exec" {
    script = "../app/files/install.sh"
     connection {
       type = "ssh"
       host = self.public_ip
       user = "var.user"
       private_key = file("../app/files/${var.keyname}")
     }
  }
}