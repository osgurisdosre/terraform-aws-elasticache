resource "aws_elasticache_parameter_group" "this" {
  count       = var.create ? 1 : 0
  name        = var.name
  family      = var.family
  description = var.description
  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}