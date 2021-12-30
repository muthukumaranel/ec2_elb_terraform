variable "ami_id" {
  type    = string
  default = "ami-830c94e3"
}

variable "instance" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "subnet_ids" {
  default =  [ "subnet-39602f72", "subnet-85b597fc" ]
}

