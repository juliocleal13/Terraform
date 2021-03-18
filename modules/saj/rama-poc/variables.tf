variable "private_subnets" {
    type    = list
    default = []
}
variable "public_subnets" {
    type    = list
    default = []
}
variable "protected_subnets" {
    type    = list
    default = []
}
variable "private_subnet_tags" {
    type    = map
    default = {}
}
variable "public_subnet_tags" {
    type    = map
    default = {}
}
variable "protected_subnet_tags" {
    type    = map
    default = {}
}

variable "name" {}
variable "sufixo" {
    default = ""
}

variable "tags" {
    type    = map
    default = {}
}

variable "cidr_block" {
}

variable "desired_zones" {
    default = []
}

variable "auto_discovery_zones" {
    default = true
}

variable "pgkeycloak_username" {
    default = "keycloak"
}

#variable "pgkeycloak_password" {}

variable "eksnodesize" {
    default = "m5.4xlarge"
}

variable "eks_version" {
    default = "1.17"
}

variable "eks_tag_subnets" {
    default = false
}

variable "key_content" {}
variable "region" {}

variable "asg_max_size" {
    default = 4
}

variable "asg_min_size" {
    default = 0
}

variable "asg_desired_capacity" {
    default = 4
}
