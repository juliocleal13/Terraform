module "vpc" {
    source                  = "../../aws/vpc"
    tags                    = var.tags
    private_subnets         = var.private_subnets
    public_subnets          = var.public_subnets
    protected_subnets       = var.protected_subnets
    cidr_block              = var.cidr_block
    name                    = var.name
    desired_zones           = var.desired_zones
    auto_discovery_zones    = var.auto_discovery_zones
    key_content             = var.key_content
    # public_subnet_tags      = var.public_subnet_tags
    # private_subnet_tags     = var.private_subnet_tags
}

module "eks-cluster" {
    source       = "terraform-aws-modules/eks/aws"
    cluster_name = "eks-${var.name}"
    subnets      = module.vpc.private_subnets_ids
    vpc_id       = module.vpc.vpc_id
 


    # cluster_security_group_id    = module.vpc_saj6-ms.security_group_softplan_id
    # cluster_create_security_group = false
    #worker_additional_security_group_ids = ["${module.vpc_saj6-ms.security_group_softplan.id}"]

    worker_groups = [{
            name                    = "eks-worker-${var.name}"
            instance_type           =  var.eksnodesize
            asg_max_size     = var.asg_max_size
            asg_desired_size = var.asg_desired_capacity
            asg_min_size      = var.asg_min_size
            key_name                = module.vpc.key_name
            public_ip = false
            tags = [{
                key                 = "SERVICE",
                value               = "EKS",
                propagate_at_launch = true
            },{
                key                 = "EKS_CLUSTER",
                value               = "eks-${var.name}",
                propagate_at_launch = true
            }]
        }]
    cluster_version = var.eks_version

    tags = merge({
            Name = "eks-${var.name}"
        },
        var.tags)

}

provider "kubernetes" {
        host                   = data.aws_eks_cluster.cluster.endpoint
        cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
        token                  = data.aws_eks_cluster_auth.cluster.token
        load_config_file       = false
        version                = "~> 1.9"
}

