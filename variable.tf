variable "region" {}
variable "instance_type" {
    default = "ml.t2.medium"
}
variable "notebook_name" {
    default = "default-instance-terraform"
}
variable "volume_size" {
    default = "5"
}