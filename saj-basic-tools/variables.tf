variable "namespace_tools" {
  type = string
  default = "tools1"
}

#install services
variable "install_minio" {
  type = bool
  default = true
}

variable "install_keycloak" {
  type = bool
  default = true
}

variable "install_nfs" {
  type = bool
  default = true
}

variable "install_postgresql" {
  type = bool
  default = true
}

variable "install_rabbitmq" {
  type = bool
  default = true
}

variable "install_redis" {
  type = bool
  default = true
}

variable "install_mongodb" {
  type = bool
  default = true
}


#docker registry
variable "docker_registry_name" {
  type = string
  default = "unjregistry"
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

#redis
variable "redis_size" {
  type = string
  default = "8Gi"
}

#keycloak
variable "keycloak_replicas" {
  type = number
  default = 3
}

variable "keycloak_image" {
  type = string
  default = "20.4.0-1"
}

variable "keycloak_repository" {
  type = string
  default = "docker-unj-repo.softplan.com.br/unj/unj-login-keycloak"
}

variable "keycloak_db_user" {
  type = string
}

variable "keycloak_db_password" {
  type = string
}

variable "keycloak_admin_user" {
  type = string
}

variable "keycloak_admin_password" {
  type = string
}

variable "keycloak_cache_owners_count" {
  type = string
  default = "2"
}

variable "keycloak_cache_owners_auth_sessions_count" {
  type = string
  default = "2"
}

variable "keycloak_db_addr" {
  type = string
}

variable "keycloak_db_name" {
  type = string
}

variable "keycloak_db_port" {
  type = string
}

variable "keycloak_db_vendor" {
  type = string
}

variable "keycloak_db_schema" {
  type = string
}

variable "keycloak_always_https" {
  type = string
  default = "true"
}

variable "keycloak_proxy_address_forwarding" {
  type = string
  default = "true"
}

variable "keycloak_jgroups_discovery_protocol" {
  type = string
  default = "dns.DNS_PING"
}

#nfs
variable "nfs_server_ip" {
  type = string
  default = "172.21.16.215"
}

variable  "nfs_server_path" {
  type = string
  default = "/volumes/nfs"
}

#postgresql
variable "postgresql_image" {
  type = string
  default = "13.1"
}

variable "postgresql_database" {
  type = string
  default = "keycloak"
}

variable "postgresql_size" {
  type = string
  default = "20Gi"
}

variable "postgresql_password" {
  type = string
}

variable "postgresql_username" {
  type = string
  default = "admin"
}

#minio
variable "minio_size" {
  type = string
  default = "20Gi"
}

#mongodb
variable "mongodb_size" {
  type = string
  default = "8Gi"
}

#rabbitmq
variable "rabbitmq_password" {
  type = string
}

variable "rabbitmq_username" {
  type = string
  default = "admin"
}

variable "rabbitmq_memoryHighWatermark_enabled" {
  type = bool
  default = true
}

variable "rabbitmq_memoryHighWatermark_type" {
  type = string
  default = "relative"
}

variable "rabbitmq_memoryHighWatermark_value" {
  type = string
  default = "0.4"
}

variable "rabbitmq_extraPlugins" {
  type = string
  default = "rabbitmq_shovel rabbitmq_shovel_management rabbitmq_federation rabbitmq_federation_management rabbitmq_tracing rabbitmq_top"
}

variable "rabbitmq_clustering_forceBoot" {
  type = bool
  default = true
}

variable "rabbitmq_replicaCount" {
  type = number
  default = 3
}

variable "rabbitmq_resources_limits_memory" {
  type = string
  default = "2Gi"
}

variable "rabbitmq_resources_limits_cpu" {
  type = string
  default = "1000m"
}

variable "rabbitmq_resources_requests_memory" {
  type = string
  default = "2Gi"
}

variable "rabbitmq_resources_requests_cpu" {
  type = string
  default = "1000m"
}

variable "rabbitmq_size" {
  type = string
  default = "8Gi"
}

variable "rabbitmq_service_type" {
  type = string
  default = "LoadBalancer"
}

