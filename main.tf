locals {
  elasticache_parameter_group = var.create_elasticache_parameter_group ? module.elasticache_parameter_group.elasticache_parameter_group_id : var.parameter_group_name
  elasticache_subnet_group    = var.create_elasticache_subnet_group ? module.elasticache_subnet_group.elasticache_subnet_group_id : var.subnet_group_name
  elasticache_user            = var.create_elasticache_user ? module.elasticache_user.elasticache_user_id : var.user_id
  elasticache_user_group      = var.create_elasticache_user_group ? module.elasticache_user_group.elasticache_user_group_id : var.user_group_id
  password                    = var.create_cache_password ? random_password.master_password[0].result : var.password_create
}

resource "random_password" "master_password" {
  count = var.create_cache_password ? 2 : 0

  length  = var.random_password_length
  special = false

  lifecycle {
    ignore_changes = all
  }
}

resource "aws_elasticache_replication_group" "this" {
  count = var.create_cache ? 1 : 0

  automatic_failover_enabled  = var.automatic_failover_enabled
  replication_group_id        = var.replication_group_id
  description                 = var.description_redis
  node_type                   = var.node_type
  num_cache_clusters          = var.num_cache_clusters
  engine                      = var.engine
  engine_version              = var.engine_version
  parameter_group_name        = var.parameter_group_name
  port                        = var.port
  preferred_cache_cluster_azs = var.preferred_cache_cluster_azs
  apply_immediately           = var.apply_immediately
  at_rest_encryption_enabled  = var.at_rest_encryption_enabled
  auth_token                  = var.auth_token
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  data_tiering_enabled        = var.data_tiering_enabled
  final_snapshot_identifier   = var.final_snapshot_identifier
  global_replication_group_id = var.global_replication_group_id
  kms_key_id                  = var.kms_key_id
  maintenance_window          = var.maintenance_window
  multi_az_enabled            = var.multi_az_enabled
  notification_topic_arn      = var.notification_topic_arn
  num_node_groups             = var.num_node_groups
  replicas_per_node_group     = var.replicas_per_node_group
  security_group_ids          = var.security_group_ids
  security_group_names        = var.security_group_names
  snapshot_retention_limit    = var.snapshot_retention_limit
  snapshot_window             = var.snapshot_window
  snapshot_name               = var.snapshot_name
  subnet_group_name           = var.subnet_group_name
  transit_encryption_enabled  = var.transit_encryption_enabled
  user_group_ids              = try(var.user_group_ids, module.elasticache_user_group.id)
  #log_delivery_configuration  = var.log_delivery_configuration
  tags = {
    Name = var.replication_group_id
  }
  depends_on = [
    module.elasticache_parameter_group
  ]
}


module "elasticache_parameter_group" {
  source = "./modules/cache_parameter_group"

  create = var.create_elasticache_parameter_group

  name        = var.parameter_group_name
  family      = var.family
  description = var.description_parameter
  parameters  = var.parameters
}

module "elasticache_subnet_group" {
  source = "./modules/cache_subnet_group"
  create = var.create_elasticache_subnet_group

  name        = var.subnet_group_name
  subnet_ids  = var.subnet_ids
  description = var.description_subnet
}

module "elasticache_user" {
  source                = "./modules/cache_user"
  create                = var.create_elasticache_user
  create_cache_password = var.create_cache_password

  user_id       = var.user_id
  user_name     = var.user_name
  access_string = var.access_string
  engine        = upper(var.engine)
  authentication_mode = [{
    type      = var.authentication_mode[0].type
    passwords = try(var.password, random_password.master_password.*.result)
  }]

}

module "elasticache_user_group" {
  source = "./modules/cache_user_group"
  create = var.create_elasticache_user_group

  engine        = upper(var.engine)
  user_group_id = var.user_group_id
  user_ids      = [var.user_id]
}
