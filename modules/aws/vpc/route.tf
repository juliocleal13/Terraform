resource "aws_route_table" "private" {
    count               = length(var.private_subnets) > 0 ? 1 : 0

    vpc_id              = aws_vpc.main.id
    #propagating_vgws    = var.public_propagating_vgws

    tags                = merge(var.tags,
                                map("Name", format("rt-Softplan-private-%s", var.name)
                            )
                        )
}

resource "aws_default_route_table" "default_route_table" {
    count = length(var.public_subnets)
    
    default_route_table_id = aws_vpc.main.default_route_table_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = element(aws_internet_gateway.main.*.id,0)
    }

    route {
        ipv6_cidr_block = "::/0"
        gateway_id = element(aws_internet_gateway.main.*.id,0)
    }

    tags = {
        Name = "rt-Softplan-${var.name}-default"
    }
}

# resource "aws_route_table_association" "private_auto" {
#     count = length(var.private_subnets) * (var.auto_discovery_zones == true ? 1 : 0)

#     subnet_id      = element(aws_subnet.private_auto.*.id, count.index)
#     route_table_id = element(aws_route_table.private.*.id, 0)
# }

resource "aws_route_table_association" "private" {
    count = length(var.private_subnets)# * (var.auto_discovery_zones == false ? 1 : 0)

    subnet_id      = element( concat(aws_subnet.private_auto.*.id, aws_subnet.private_custom.*.id), count.index)
    route_table_id = element(aws_route_table.private.*.id, 0)
}

# resource "aws_route" "private_default_auto" {
#     count = (length(var.private_subnets) > 0 ? 1 : 0) * (var.auto_discovery_zones == true ? 1 : 0)

#     route_table_id         = element(aws_route_table.private.*.id,0)
#     destination_cidr_block = "0.0.0.0/0"
#     nat_gateway_id             = element(aws_nat_gateway.auto.*.id,0)
# }

resource "aws_route" "private_default" {
    count = length(var.private_subnets) > 0 ? 1 : 0#) * (var.auto_discovery_zones == true ? 1 : 0)

    route_table_id         = element(aws_route_table.private.*.id,0)
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id             = element(aws_nat_gateway.main.*.id ,0)
}