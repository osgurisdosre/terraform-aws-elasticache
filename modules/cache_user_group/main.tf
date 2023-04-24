resource "aws_elasticache_user_group" "this" {
  count         = var.create ? 1 : 0
  engine        = var.engine
  user_group_id = var.user_group_id
  user_ids      = var.user_ids
}