variable "name" {}
variable "tags" {
    type = map
}
variable "private_subnets" {}
variable "username" {}
variable "password" {}
variable "type" {}
variable "size" {}
variable "skip_final_snapshot" {
    default = false
}
variable "vpc_id" {}
variable "dbname" {}