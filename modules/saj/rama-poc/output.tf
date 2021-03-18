output "vpc_id" {
  value = module.vpc.vpc_id
}

# output "security_group_softplan_id" {
#   value = aws_security_group.softplan.id
# }

output "protected_subnets_ids" {
  value = module.vpc.protected_subnets_ids
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets_ids
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets_ids
}