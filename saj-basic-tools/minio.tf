resource "helm_release" "minio-tools" {
    count = var.install_minio == true ? 1 : 0
    name       = "minio-${var.namespace_tools}"
    namespace  = kubernetes_namespace.tools.metadata[0].name
    repository = "https://helm.min.io/"
    chart      = "minio"

    set {
        name = "persistence.size"
        value = var.minio_size
    }
}

resource "kubectl_manifest" "minio-virtualservice" {
    count = var.install_minio == true ? 1 : 0
    yaml_body = <<YAML
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: minio-${var.namespace_tools}
  namespace: ${var.namespace_tools}
spec:
  gateways:
  - tj-istio-gateway.istio-system.svc.cluster.local
  hosts:
  - minio-loadtest-aghata.saj6.softplan.com.br
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: minio-${var.namespace_tools}
        port:
          number: 9000
YAML
}