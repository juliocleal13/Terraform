

resource "kubernetes_namespace" "tools" {
  metadata {
    name = var.namespace_tools
  }
}


resource "kubernetes_secret" "unjregistry_tools" {
  metadata {
    name = var.docker_registry_name
    namespace = var.namespace_tools
  }

  data = {
    ".dockerconfigjson" = <<DOCKER
{
  "auths": {
    "${var.docker_registry_url}": {
      "auth": "${base64encode("${var.docker_registry_username}:${var.docker_registry_password}")}"
    }
  }
}
DOCKER
  }

  type = "kubernetes.io/dockerconfigjson"
}


