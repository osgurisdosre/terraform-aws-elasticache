variable "create" {
  type    = bool
  default = false
}

variable "user_id" {
  type = string
}

variable "authentication_mode" {
  type = list(object({
    type      = string
    passwords = list(string)
  }))
  default = [{
    passwords = [null]
    type      = null
  }]
}
variable "user_name" {
  default = "testUserName"
}

variable "access_string" {
  default = "on ~* +@all"
}

variable "engine" {
  default = "REDIS"
}

variable "pass" {
  type    = string
  default = null
}

variable "no_password_required" {
  type    = bool
  default = false
}

variable "create_cache_password" {
  type    = string
  default = null
}
variable "password_count" {
  type    = number
  default = 1
}
