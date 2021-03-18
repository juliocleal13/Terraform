output "vpc_id" {
  value = aws_vpc.main.id
}

output "security_group_softplan-public_id" {
  value = aws_security_group.softplan-private.id
}

output "security_group_softplan-protected_id" {
  value = aws_security_group.softplan-protected.id
}

output "security_group_softplan-private_id" {
  value = aws_security_group.softplan-private.id
}

output "key_name" {
  value = aws_key_pair.softplan.id
}

output "protected_subnets_ids" {
  value = concat(aws_subnet.protected_auto.*.id, aws_subnet.protected_custom.*.id)
}

output "private_subnets_ids" {
  value = concat(aws_subnet.private_auto.*.id, aws_subnet.private_custom.*.id)
}

output "public_subnets_ids" {
  value = concat(aws_subnet.public_auto.*.id, aws_subnet.private_custom.*.id)
}