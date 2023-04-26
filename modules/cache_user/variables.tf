variable "create" {
  type    = bool
  default = false
}

variable "user_id" {
  type = string
}

variable "authentication_mode" {
  type = list(object({
    type      = optional(string)
    passwords = optional(string)
  }))
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

variable "create_cache_password" {
  type    = bool
  default = false
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources"
}

variable "password" {
  description = "Password for the user."
  type        = list(string)
  default     = []
}

variable "random_password_length" {
  type        = number
  default     = 16
  description = "The length of the string desired. "
}

variable "password_create" {
  type        = string
  default     = null
  description = "Password Create"
}
