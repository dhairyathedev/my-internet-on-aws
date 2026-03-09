variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "sso_profile" {
  type    = string
  default = "sandbox"
}

variable "created_via" {
  type    = string
  default = "terraform"
}

variable "ami" {
  type    = string
  default = "ami-0a15c80c30715cc92"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
