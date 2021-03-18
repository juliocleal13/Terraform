
resource "aws_subnet" "protected_auto" {
    count                           = length(var.protected_subnets) * (var.auto_discovery_zones == true ? 1 : 0)

    vpc_id                          = aws_vpc.main.id
    cidr_block                      = var.protected_subnets[count.index]
    
    availability_zone               = element(data.aws_availability_zones.available.names.*, count.index)
    #ipv6_cidr_block                 = "${element(var.ipv6_cidr_blocks, count.index)}"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = false

    tags                            = merge(
        var.tags,
        var.protected_subnet_tags,
        map(
            "Name", format("subnet-Softplan-protected-%s-%d", var.name, count.index),
            "kubernetes.io/role/internal-elb", "1"
        )
    )
}

resource "aws_subnet" "private_auto" {
    count                           = length(var.private_subnets) * (var.auto_discovery_zones == true ? 1 : 0)

    vpc_id                          = aws_vpc.main.id
    cidr_block                      = var.private_subnets[count.index]
    
    availability_zone               = element(data.aws_availability_zones.available.names.*, count.index)
    #ipv6_cidr_block                 = "${element(var.ipv6_cidr_blocks, count.index)}"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = false

    tags                            = merge(
        var.tags,
        var.private_subnet_tags,
        map(
            "Name", format("subnet-Softplan-private-%s-%d", var.name, count.index),
            "kubernetes.io/role/internal-elb", "1",
            "kubernetes.io/cluster/eks-${var.name}","shared"
        )
    )
}

resource "aws_subnet" "public_auto" {
    count                           = length(var.public_subnets) * (var.auto_discovery_zones == true ? 1 : 0)

    vpc_id                          = aws_vpc.main.id
    cidr_block                      = var.public_subnets[count.index]
    availability_zone               = element(data.aws_availability_zones.available.names.*, count.index)
    
    #ipv6_cidr_block                 = "${element(var.ipv6_cidr_blocks, count.index)}"
    ipv6_cidr_block                 = element(cidrsubnets(aws_vpc.main.ipv6_cidr_block, 8, 8), count.index)
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true

    tags                            = merge(
        var.tags,
        var.public_subnet_tags,
        map(
            "Name", format("subnet-Softplan-public-%s-%d", var.name, count.index),
            "kubernetes.io/role/elb", "1",
            "kubernetes.io/cluster/eks-${var.name}","shared"
        )
    )
}

resource "aws_subnet" "protected_custom" {
    count                           = length(var.protected_subnets) * (var.auto_discovery_zones == false ? 1 : 0)

    vpc_id                          = aws_vpc.main.id
    cidr_block                      = var.protected_subnets[count.index]
    availability_zone               = element(var.desired_zones, count.index % length(var.desired_zones))
    #ipv6_cidr_block                 = "${element(var.ipv6_cidr_blocks, count.index)}"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = false

    tags                            = merge(
        var.tags,
        var.protected_subnet_tags,
        map(
            "Name", format("subnet-Softplan-protected-%s-%d", var.name, count.index),
            "kubernetes.io/role/internal-elb", "1",
            "kubernetes.io/cluster/eks-${var.name}","shared"
        )
    )
}

resource "aws_subnet" "private_custom" {
    count                           = length(var.private_subnets) * (var.auto_discovery_zones == false ? 1 : 0)

    vpc_id                          = aws_vpc.main.id
    cidr_block                      = var.private_subnets[count.index]
    availability_zone               = element(var.desired_zones, count.index % length(var.desired_zones))
    #ipv6_cidr_block                 = "${element(var.ipv6_cidr_blocks, count.index)}"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = false

    tags                            = merge(
        var.tags,
        var.private_subnet_tags,
        map(
            "Name", format("subnet-Softplan-private-%s-%d", var.name, count.index),
            "kubernetes.io/role/internal-elb", "1",
            "kubernetes.io/cluster/eks-${var.name}","shared"
        )
    )
}

resource "aws_subnet" "public_custom" {
    count                           = length(var.public_subnets) * (var.auto_discovery_zones == false ? 1 : 0)

    vpc_id                          = aws_vpc.main.id
    cidr_block                      = var.public_subnets[count.index]
    availability_zone               = element(var.desired_zones, count.index % length(var.desired_zones))
    ipv6_cidr_block                 = element(cidrsubnets(aws_vpc.main.ipv6_cidr_block, 8, 8), count.index)
    #ipv6_cidr_block                 = length(var.public_subnets_ipv6) > 0 ? element(var.public_subnets_ipv6, count.index) : ""
    #ipv6_cidr_block                 = "${element(var.ipv6_cidr_blocks, count.index)}"
    map_public_ip_on_launch         = false 
    assign_ipv6_address_on_creation = true

    tags                            = merge(
        var.tags,
        var.public_subnet_tags,
        map(
            "Name", format("subnet-Softplan-public-%s-%d", var.name, count.index),
            "kubernetes.io/role/elb", "1",
            "kubernetes.io/cluster/eks-${var.name}","shared"
        )        
    )
}