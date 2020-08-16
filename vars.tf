variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "ap-northeast-1"
}
variable "AMI" {
  type = map(string)
  default = {
    ap-northeast-1 = "ami-0cc75a8978fbbc969"
  }
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

