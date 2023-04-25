locals {
  password = var.create_cache_password ? random_password.master_password[0].result : var.password_create
}
resource "aws_elasticache_user" "this" {
  count = var.create ? 1 : 0

  user_id              = var.user_id
  user_name            = var.user_name
  access_string        = var.access_string
  engine               = upper(var.engine)
  no_password_required = var.no_password_required
  dynamic "authentication_mode" {
    for_each = var.authentication_mode
    content {
      type = try(authentication_mode.value.type, null)
      passwords = (
        authentication_mode.value.type == "iam" || authentication_mode.value.type == "no-password-required"
        ? null
        : [coalesce(local.password, authentication_mode.value.passwords, "")]
      )


    }
  }
  tags = var.tags
}

resource "random_password" "master_password" {
  count = var.create_cache_password ? 1 : 0

  length  = var.random_password_length
  special = false

  lifecycle {
    ignore_changes = all
  }
}
