resource "aws_elasticache_user" "this" {
  count = var.create ? 1 : 0

  user_id       = var.user_id
  user_name     = var.user_name
  access_string = var.access_string
  engine        = var.engine

  dynamic "authentication_mode" {
    for_each = var.authentication_mode
    content {
      type = try(authentication_mode.value.type, null)
      passwords = [
        for password in authentication_mode.value.passwords :
        length(regexall("\\S", password)) > 0 ? password : ""
        if authentication_mode.value.type != "no-password-required" && authentication_mode.value.type != "iam" || length(authentication_mode.value.passwords) <= 2
      ]
    }
  }
  tags = var.tags
}
