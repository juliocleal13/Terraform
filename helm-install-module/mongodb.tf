resource "helm_release" "mongodb-tools" {
    count = var.install_mongodb == true ? 1 : 0
    name       = "mongodb-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://charts.bitnami.com/bitnami"
    chart      = "mongodb"
    version    = "7.8.10"

    set {
        name = "auth.enabled"
        value = false
    }

    set {
        name = "persistence.size"
        value = var.mongodb_size
    }

}
