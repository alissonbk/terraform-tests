variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_tags" {
  type = map(string)

}