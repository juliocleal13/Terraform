provider "kubernetes" {
  config_path    = "/home/juliocleal/Projetos/kube/interno-dev.conf"
}



provider "helm" {
  kubernetes {
    config_path = "/home/juliocleal/Projetos/kube/interno-dev.conf"
  }
}

resource "kubernetes_namespace" "tools" {
  metadata {
    name = "julioleal-pj"
  }
}

resource "helm_release" "chronos" {
    name       = "chronos1-julioleal-pj"
    namespace  = "julioleal-pj"
    repository = "saj6"
    chart      = "pj-chronos-api"

    

set {
 name = "app.args"
 value = "[celery\\,-A\\,chronos\\,worker\\,l\\,info]"
 }

}