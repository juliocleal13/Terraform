variable "cidr_block" {
    description = "This is a mandatory parameter to be able to create a VPC, you should inform the IPv4 CIDR"
}

variable "tags" {
    type = map
}

variable "name" {
    description = "Name of the environment"
}

variable "sufixo" {
    default = ""
}

variable "private_subnets" {
    type = list
    default = []
}

variable "public_subnets" {
    type = list
    default = []
}

variable "protected_subnets" {
    type = list
    default = []
}

variable "public_subnet_tags" {
    type = map
    default = {}
}

variable "private_subnet_tags" {
    type = map
    default = {}
}

variable "protected_subnet_tags" {
    type = map
    default = {}
}

variable "private_propagating_vgws" {
    default = true
}

variable "config_transit_gateway_softplan" {
    default = false
}

variable "auto_discovery_zones" {
    description = "Auto discovery the enabled zones for the current region"
    default = true
}

variable "desired_zones" {
    description = "Manually inform the desired zones to deploy resources to"
    type        = list
    default     = []
}

variable "key_content" {}
#variable "location" {}