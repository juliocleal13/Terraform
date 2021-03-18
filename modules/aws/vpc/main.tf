resource "aws_vpc" "main" {
    cidr_block                          = var.cidr_block
    assign_generated_ipv6_cidr_block    = "true"
    enable_dns_hostnames                = true

    tags = merge(var.tags, map(
            "Name", format("vpc-Softplan-%s", var.name),
            "kubernetes.io/cluster/eks-${var.name}", "shared"
            )
        )
}

resource "aws_nat_gateway" "main" {
    count           = length(var.private_subnets) > 0 ? 1 : 0 #) * (var.auto_discovery_zones == true ? 1 : 0)
    allocation_id   = element(aws_eip.nat.*.id, 0)

    subnet_id       = element( concat(aws_subnet.public_custom.*.id, aws_subnet.public_auto.*.id), 0)

    tags            = merge(var.tags,
                            map("Name", format("natgw-Softplan-%s", var.name)
                        )
                    )
}

resource "aws_eip" "nat" {
    count   = length(var.private_subnets) > 0 ? 1 : 0

    tags    = merge(var.tags,
                map("Name", format("eip-%s-natgw", var.name)
            )
        )
}

resource "aws_internet_gateway" "main" {
    count = length(var.public_subnets) > 0 ? 1 : 0

    vpc_id = aws_vpc.main.id

    tags = merge(var.tags, map("Name", format("igw-Softplan-%s", var.name)))
}


resource "aws_key_pair" "softplan" {
  key_name   = "softplan-${var.name}"
  public_key = var.key_content 
  #"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkv3KsYZzAKG/ZaD2dx0pMp1S7HlWZeQfMi4paMwCFh1TRE5v2h5rEVUApJ0wf+bh8XbRsWQ7EmAhyf9RJ4DDtt/iOeturqQQZa0WGQb/YqZFLNo26b6/JpSwD9aE2fkO1wYL68wqrrX0f/gxVgksuCIcdcyK3GZA6ywS8GfIxlVDb/iqqXZodxv/9JTIPC30AmHyHQ0zZrekrwbnb3nzx3u0118nirWlxzbMx0uShGb3GTtqUvPgWY6dBfmoJA3vlMkcX+FDB9zmnB+lUAG9mXvtdA7rjkyPIIRj1RBi5G2iBZDNGFtfQMPMfTsQTmLeJIZh9BD03hS8TmzlEAQ/V"
}


resource "aws_security_group" "softplan-protected" {
    name    = "secgrp-Softplan-protected-${var.name}"
    vpc_id  = aws_vpc.main.id

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["189.39.26.160/28","187.94.103.224/27","189.22.10.128/26","189.22.10.112/28","172.21.0.0/16","172.23.0.0/16","172.25.0.0/16","10.253.0.0/22"]

    }
}

resource "aws_security_group" "softplan-private" {
    name    = "secgrp-Softplan-private-${var.name}"
    vpc_id  = aws_vpc.main.id

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["189.39.26.160/28","187.94.103.224/27","189.22.10.128/26","189.22.10.112/28","172.21.0.0/16","172.23.0.0/16","172.25.0.0/16","10.253.0.0/22"]

    }
}

resource "aws_security_group" "softplan-public" {
    name    = "secgrp-Softplan-public-${var.name}"
    vpc_id  = aws_vpc.main.id

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["189.39.26.160/28","187.94.103.224/27","189.22.10.128/26","189.22.10.112/28","172.21.0.0/16","172.23.0.0/16","172.25.0.0/16","10.253.0.0/22"]

    }
}
