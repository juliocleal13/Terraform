provider "kubernetes" {
  config_path    = "/home/juliocleal/Projetos/kube/interno-loadtest-avalya.conf"
}

provider "kubectl" {
  load_config_file       = true
}

provider "helm" {
  kubernetes {
    config_path = "/home/juliocleal/Projetos/kube/interno-loadtest-avalya.conf"
  }
}