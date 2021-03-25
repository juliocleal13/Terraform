resource "helm_release" "nfs-client-provisioner" {
    count = var.install_nfs == true ? 1 : 0
    name       = "nfs-client-profisioner"
    namespace  = "kube-system"
    repository = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/"
    chart      = "nfs-subdir-external-provisioner"

    set {
        name = "nfs.server"
        value = var.nfs_server_ip
    }

    set {
        name = "nfs.path"
        value = var.nfs_server_path
    }

    set {
        name = "storageClass.name"
        value = "managed-nfs-storage"
    }

    set {
        name = "storageClass.defaultClass"
        value = true
    }

    set {
        name = "storageClass.accessModes"
        value = "ReadWriteMany"
    }
   
}

