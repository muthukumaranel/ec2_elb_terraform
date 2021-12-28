output "instance_ip" {
  value = module.instance.ec2_public_ip
}

output "instance_tags" {
  value = module.instance.ec2_tags
}

output "web_server_1_id" {
  value = module.instance.instance1_id
}

output "web_server_2_id" {
  value = module.instance.instance2_id
}