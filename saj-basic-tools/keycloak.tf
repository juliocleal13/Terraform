resource "kubernetes_secret" "keycloak_db" {
  count = var.install_keycloak == true ? 1 : 0
  metadata {
    name = "keycloak-${kubernetes_namespace.tools.metadata[0].name}-db"
    namespace = var.namespace_tools
  }

  data = {
    DB_USER = var.keycloak_db_user
    DB_PASSWORD = var.keycloak_db_password
  }

  type = "Opaque"
}

resource "kubernetes_secret" "keycloak_adminuser" {
  count = var.install_keycloak == true ? 1 : 0
  metadata {
    name = "keycloak-${kubernetes_namespace.tools.metadata[0].name}-adminuser"
    namespace = var.namespace_tools
  }

  data = {
    KEYCLOAK_USER = var.keycloak_admin_user
    KEYCLOAK_PASSWORD = var.keycloak_admin_password
  }

  type = "Opaque"
}

resource "helm_release" "keycloak-tools" {
    count = var.install_keycloak == true ? 1 : 0
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
        name = "postgresql.enabled"
        value = false 
    }

    set {
        name = "extraEnvFrom"
        value = <<CHART
  - secretRef:
      name: 'keycloak-${kubernetes_namespace.tools.metadata[0].name}-db'
  - secretRef:
      name: 'keycloak-${kubernetes_namespace.tools.metadata[0].name}-adminuser'
        CHART
    }

    set {
        name = "extraEnv"
        value = <<CHART
   - name: CACHE_OWNERS_COUNT
     value: ${var.keycloak_cache_owners_count}
   - name: CACHE_OWNERS_AUTH_SESSIONS_COUNT
     value: ${var.keycloak_cache_owners_auth_sessions_count}
   - name: DB_ADDR
     value: ${var.keycloak_db_addr}
   - name: DB_PORT
     value: ${var.keycloak_db_port}
   - name: DB_DATABASE
     value: ${var.keycloak_db_name}
   - name: DB_VENDOR
     value: ${var.keycloak_db_vendor}
   - name: DB_SCHEMA
     value: ${var.keycloak_db_schema}
   - name: KEYCLOAK_ALWAYS_HTTPS
     value: ${var.keycloak_always_https}
   - name: PROXY_ADDRESS_FORWARDING
     value: ${var.keycloak_proxy_address_forwarding}
   - name: JGROUPS_DISCOVERY_PROTOCOL
     value: ${var.keycloak_jgroups_discovery_protocol}
   - name: JGROUPS_DISCOVERY_PROPERTIES
     value: 'dns_query={{ include "keycloak.serviceDnsName" . }}'
   - name: JAVA_OPTS
     value: >-
       -XX:+UseContainerSupport
       -XX:MaxRAMPercentage=50.0
       -Djava.net.preferIPv4Stack=true
       -Djboss.modules.system.pkgs=$JBOSS_MODULES_SYSTEM_PKGS
       -Djava.awt.headless=true
        CHART
    }

}

resource "kubectl_manifest" "keycloak_virtualservice" {
    count = var.install_keycloak == true ? 1 : 0
    yaml_body = <<YAML
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: keycloak-${var.namespace_tools}
  namespace: ${var.namespace_tools}
spec:
  gateways:
  - tj-istio-gateway.istio-system.svc.cluster.local
  hosts:
  - keycloak-loadtest-aghata.saj6.softplan.com.br
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: keycloak-${var.namespace_tools}-http
        port:
          number: 80
YAML
}

