resource "helm_release" "mongodb-tools" {
    name       = "mongodb-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://charts.bitnami.com/bitnami"
    chart      = "mongodb"

    set {
        name = "auth.enabled"
        value = false
    }

    set {
        name = "persistence.size"
        value = var.mongodb_size
    }

}
