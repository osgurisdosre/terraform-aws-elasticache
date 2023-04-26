output "elasticache_parameter_group_id" {
  description = "The parameter group name"
  value       = try(aws_elasticache_parameter_group.this[0].id, "")
}

output "elasticache_parameter_group_arn" {
  description = "The parameter group ARN"
  value       = try(aws_elasticache_parameter_group.this[0].arn, "")
}
