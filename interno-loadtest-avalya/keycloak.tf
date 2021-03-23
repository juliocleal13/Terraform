resource "helm_release" "keycloak-tools" {
    name       = "keycloak-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://codecentric.github.io/helm-charts"
    chart      = "keycloak"

    values = [
        file("files/values_keycloak.yaml")
    ]

    set {
        name = "replicas"
        value = var.keycloak_replicas
    }

    set {
        name = "image.tag"
        value = var.keycloak_image
    }

    set {
        name = "image.repository"
        value = var.keycloak_repository
    }

    set {
        name = "postgresql.enabled"
        value = false 
    }

    set_sensitive {
        name = "dbUser"
        value = var.keycloak_db_user
    }

    set_sensitive {
        name = "dbPassword"
        value = var.keycloak_db_password
    }

    set_sensitive {
        name = "adminUser"
        value = var.keycloak_admin_user
    }

    set_sensitive {
        name = "adminPassword"
        value = var.keycloak_admin_password
    }

}
