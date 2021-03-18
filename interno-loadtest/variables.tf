variable "namespace_tools" {
  type = string
  default = "tools-terraform1"
}

variable "docker_registry_name" {
  type = string
  default = "unjregistry"
}

variable "redis_size" {
  type = string
  default = "8Gi"
}

variable "minio_size" {
  type = string
  default = "20Gi"
}

variable "mongodb_size" {
  type = string
  default = "8Gi"
}

variable "docker_registry_username" {
  type = string
}

variable "docker_registry_password" {
  type = string
}

variable "docker_registry_url" {
  type = string
  default = "docker-unj-repo.softplan.com.br/unj"
}

