output "elasticache_user_id" {
  description = "The group name"
  value       = try(aws_elasticache_user.this[0].id, "")
}

output "elasticache_user_arn" {
  description = "ARN"
  value       = try(aws_elasticache_user.this[0].arn, "")
}