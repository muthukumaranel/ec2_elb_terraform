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

variable "my_public_key" {
  default = "muthu"
}

variable "security_group" {}