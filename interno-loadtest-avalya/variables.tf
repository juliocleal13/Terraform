variable "namespace_tools" {
  type = string
  default = "tools-terraform5"
}

variable "docker_registry_name" {
  type = string
  default = "unjregistry"
}

variable "redis_size" {
  type = string
  default = "8Gi"
}

variable "keycloak_replicas" {
  type = number
  default = 3
}

variable "keycloak_image" {
  type = string
  default = "20.4.0-1"
}

variable "nfs_server_ip" {
  type = string
  default = "172.21.16.215"
}

variable  "nfs_server_path" {
  type = string
  default = "/volumes/nfs"
}

variable "postgresql_image" {
  type = string
  default = "13.1"
}

variable "keycloak_repository" {
  type = string
  default = "docker-unj-repo.softplan.com.br/unj/unj-login-keycloak"
}

variable "postgresql_database" {
  type = string
  default = "keycloak"
}

variable "minio_size" {
  type = string
  default = "20Gi"
}

variable "postgres_size" {
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

variable "postgresql_password" {
  type = string
}

variable "postgresql_username" {
  type = string
  default = "admin"
}

variable "docker_registry_url" {
  type = string
  default = "docker-unj-repo.softplan.com.br/unj"
}

