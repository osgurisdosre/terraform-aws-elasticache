output "elasticache_user_id" {
  description = "The user name"
  value       = try(aws_elasticache_user.this[0].id, "")
}

output "elasticache_user_arn" {
  description = "The user name ARN"
  value       = try(aws_elasticache_user.this[0].arn, "")
}
