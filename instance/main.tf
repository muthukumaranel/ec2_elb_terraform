data "aws_availability_zones" "available" {}

data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "template_file" "init" {
  template = "${file("${path.module}/userdata.tpl")}"
}


resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance
  count         = var.instance_count
  subnet_id     = "${element(var.subnet_ids, count.index)}"
  user_data     = "${data.template_file.init.rendered}"

  tags = {
    Name = "WebServerInstance-${count.index + 1}"
  }
  
}
