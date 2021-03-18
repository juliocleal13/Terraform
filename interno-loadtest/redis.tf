resource "helm_release" "redis-tools" {
    name       = "redis-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://charts.bitnami.com/bitnami"
    chart      = "redis"

    set {
        name = "master.persistence.size"
        value = var.redis_size
    }

    set {
        name = "slave.persistence.size"
        value = var.redis_size
    }

     set {
        name = "cluster.enabled"
        value = "true"
    }

    set {
        name = "cluster.slaveCount"
        value = 3
    }

    set {
        name = "master.service.type"
        value = "LoadBalancer"
    }

    

}