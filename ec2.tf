module "instance" {
  source         = "./instance"
  instance_count = 2
  security_group = module.alb.security_group

}

module "alb" {
  source       = "./alb"
  vpc_id       = "vpc-16a0706e"
  instance1_id = module.instance.instance1_id
  instance2_id = module.instance.instance2_id
  subnet1      = "subnet-39602f72"
  subnet2      = "subnet-85b597fc"
}
