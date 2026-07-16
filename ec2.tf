resource "aws_instance" "wordpress" {
  ami = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [

    aws_security_group.wordpress.id

  ]

user_data = file("${path.module}/cloud-init.yaml")

  tags = {

    Name = var.instance_name

  }

}



