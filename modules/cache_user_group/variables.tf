variable "create" {
  type    = bool
  default = false
}

variable "engine" {
  type    = string
  default = "REDIS"
}

variable "user_group_id" {
  type = string
}

variable "user_ids" {
  type    = list(string)
  default = null
}
  