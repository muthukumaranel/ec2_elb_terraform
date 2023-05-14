output "ec2_public_ip" {
  value = aws_instance.web_server[*].public_ip
}

output "ec2_tags" {
  value = aws_instance.web_server[*].tags_all.Name
}

output "instance1_id" {
  value = "${element(aws_instance.web_server.*.id, 1)}"
}

output "instance2_id" {
  value = "${element(aws_instance.web_server.*.id, 2)}"
}