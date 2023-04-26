output "elasticache_subnet_group_id" {
  description = "The subnet group name"
  value       = try(aws_elasticache_subnet_group.this[0].id, "")
}

output "elasticache_subnet_group_arn" {
  description = "The subnet group ARN"
  value       = try(aws_elasticache_subnet_group.this[0].arn, "")
}
