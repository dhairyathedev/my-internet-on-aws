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

variable "key_pair_bastion" {
  type    = string
  default = "1password-sandbox-account-ap-south-1"
}

variable "key_pair_bird" {
  type    = string
  default = ""
}

variable "bird_ami" {
  type    = string
  default = "ami-0e58a14a3275f1a7f"
}
