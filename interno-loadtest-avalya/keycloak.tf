resource "helm_release" "keycloak-tools" {
    name       = "keycloak-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://codecentric.github.io/helm-charts"
    chart      = "keycloak"

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
        name = "imagePullSecrets"
        value = kubernetes_secret.unjregistry_tools.metadata[0].name
    }

    set {
        name = "postgresql.enabled"
        value = false 
    }

}
helm upgrade --install keycloak-tools --set "replicas=3" --set "image.repository=docker-unj-repo.softplan.com.br/unj/unj-login-keycloak" --set "image.tag=20.3.3-RC-0" --set-string "dbUser=postgres" --set-string "dbPassword=dd4b93476250d12aa71a1c586ebeffedaee5e1bfd72289ec1855e8feb348b1b9a1f7b584" --set-string "adminUser=admin" --set-string "adminPassword=86dd38eabc01dcd6" --values "/home/juliocleal/Projetos/Anotacoes/Arquivos_Config_Ambientes/Ambientes/interno-dev/keycloak/values.yaml" codecentric/keycloak --namespace=tools