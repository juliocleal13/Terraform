resource "helm_release" "rabbitmq_tools" {
    count = var.install_rabbitmq == true ? 1 : 0
    name       = "rabbitmq-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://charts.bitnami.com/bitnami"
    chart      = "rabbitmq"

    set {
        name = "replicaCount"
        value = var.rabbitmq_replicaCount
    }

    set {
        name = "resources.limits.memory"
        value = var.rabbitmq_resources_limits_memory
    }

    set {
        name = "resources.limits.cpu"
        value = var.rabbitmq_resources_limits_cpu
    }

    set {
        name = "resources.requests.memory"
        value = var.rabbitmq_resources_requests_memory
    }

    set {
        name = "resources.requests.cpu"
        value = var.rabbitmq_resources_requests_cpu
    }

    set {
        name = "auth.password"
        value = var.rabbitmq_password
    }

    set {
        name = "auth.username"
        value = var.rabbitmq_username
    }

    set {
        name = "memoryHighWatermark.enabled"
        value = var.rabbitmq_memoryHighWatermark_enabled
    }

    set {
        name = "memoryHighWatermark.type"
        value = var.rabbitmq_memoryHighWatermark_type
    }

    set {
        name = "memoryHighWatermark.value"
        value = var.rabbitmq_memoryHighWatermark_value
    }

    set {
        name = "extraPlugins"
        value = var.rabbitmq_extraPlugins
    }

    set {
        name = "clustering.forceBoot"
        value = var.rabbitmq_clustering_forceBoot
    }

    set {
        name = "persistence.size"
        value = var.rabbitmq_size
    }

    set {
        name = "service.type"
        value = var.rabbitmq_service_type
    }

    provisioner "local-exec" {
        command = "echo $(kubectl get secret --namespace ${kubernetes_namespace.tools.metadata[0].name} ${self.name} -o jsonpath={.data.rabbitmq-password} | base64 --decode) >> rabbitmq-password.txt"
    }
}


