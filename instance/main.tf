data "aws_availability_zones" "available" {}

data "aws_ami" "centos" {
  owners      = ["445425982647"]
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
  instance_type = var.instance
  ami           = "${data.aws_ami.centos.id}"
  count         = var.instance_count
  subnet_id     = "${element(var.subnet_ids, count.index)}"
  key_name      = "muthu"
  user_data     = "${data.template_file.init.rendered}"
  vpc_security_group_ids = ["${var.security_group}"]

  tags = {
    Name = "WebServerInstance-${count.index + 1}"
  }
  
}

resource "aws_ebs_volume" "web_server_ebs" {
  count             = 2
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  size              = 1
  type              = "gp2"
}

resource "aws_volume_attachment" "my-vol-attach" {
  count        = 2
  device_name  = "/dev/xvdh"
  instance_id  = "${aws_instance.web_server.*.id[count.index]}"
  volume_id    = "${aws_ebs_volume.web_server_ebs.*.id[count.index]}"
  force_detach = true
}
