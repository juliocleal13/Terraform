resource "helm_release" "postgres-tools" {
    count = var.install_postgresql == true ? 1 : 0
    name       = "postgres-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://charts.bitnami.com/bitnami"
    chart      = "postgresql"

    set {
        name = "persistence.size"
        value = var.postgresql_size
    }

    set {
        name = "postgresqlPassword"
        value = var.postgresql_password
    }

    set {
        name = "postgresqlUsername"
        value = var.postgresql_username
    }

    set {
        name = "image.repository"
        value = "postgres"
    }

    set {
        name = "image.tag"
        value = var.postgresql_image
    }

    set {
        name = "postgresqlDatabase"
        value = var.postgresql_database
    }

}
