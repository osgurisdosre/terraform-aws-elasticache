
output "cache_instance_password" {
  description = "The cache password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = random_password.master_password.*.result
  sensitive   = true
}
output "cache_instance_endpoint" {
  description = "The DNS address of the DocDB Cluster"
  value       = try(aws_elasticache_replication_group.this[0].primary_endpoint_address, "")
}

output "db_instance_endpoint_reader" {
  description = "The DNS address of the DocDB Cluster"
  value       = try(aws_elasticache_replication_group.this[0].reader_endpoint_address, "")
}
