module "instance" {
  source         = "./instance"
  instance_count = 2
}

module "alb" {
  source       = "./alb"
  vpc_id       = "vpc-16a0706e"
  instance1_id = module.instance.instance1_id
  instance2_id = module.instance.instance2_id
  subnet1      = "subnet-d24b7788"

  subnet2 = "subnet-e5f5fecd"
}
