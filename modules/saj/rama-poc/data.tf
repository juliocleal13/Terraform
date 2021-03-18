data "aws_eks_cluster" "cluster" {
        name = module.eks-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
        name = module.eks-cluster.cluster_id
}

/* data "aws_ami" "database" {
  most_recent = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["Microsoft Windows Server 2019 with SQL Server 2017 Standard"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "database-aux" {
  most_recent = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["Microsoft Windows Server 2019 Base"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}  */
 
/* data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["Ubuntu Server 20.04 LTS (HVM), SSD Volume Type"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["self"]
} 
 */

/* data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
} */