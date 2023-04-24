output "elasticache_parameter_group_id" {
  description = "The group name"
  value       = try(aws_elasticache_parameter_group.this[0].id, "")
}

output "elasticache_parameter_group_arn" {
  description = "ARN"
  value       = try(aws_elasticache_parameter_group.this[0].arn, "")
}