##############################################################################################
#Create resources
variable "create" {
  type        = bool
  default     = true
  description = "Create the resource?"
}
variable "create_cache" {
  type        = bool
  default     = false
  description = "Create the elasticache Redis?"
}

variable "create_elasticache_replication_group" {
  type        = bool
  default     = false
  description = "Create the replication group?"
}

variable "create_elasticache_parameter_group" {
  type        = bool
  default     = false
  description = "Create the parameter group?"
}
variable "create_elasticache_subnet_group" {
  type        = bool
  default     = false
  description = "Create the subnet group?"
}

variable "create_elasticache_user" {
  type        = bool
  default     = false
  description = "Create the user?"
}

variable "create_elasticache_user_group" {
  type        = bool
  default     = false
  description = "Create the user group?"
}

variable "create_cache_password" {
  type        = bool
  default     = false
  description = "Create the password?"
}
##############################################################################################
#Replication Group
variable "engine" {
  type        = string
  default     = "redis"
  description = "Name of the cache engine to be used for the clusters in this replication group."
}

variable "replication_group_id" {
  type        = string
  description = "Replication group identifier. This parameter is stored as a lowercase string."
}

variable "preferred_cache_cluster_azs" {
  type        = list(string)
  default     = null
  description = "List of EC2 availability zones in which the replication group's cache clusters will be created."
}

variable "automatic_failover_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
}

variable "node_type" {
  type        = string
  description = "Instance class to be used."
}
variable "num_cache_clusters" {
  type        = number
  default     = 3
  description = "Number of cache clusters (primary and replicas) this replication group will have."
}

variable "engine_version" {
  type        = string
  default     = "6.x"
  description = "Version number of the cache engine to be used for the cache clusters in this replication group."
}

variable "port" {
  type        = number
  default     = 6379
  description = "Port number on which each of the cache nodes will accept connections."
}

variable "apply_immediately" {
  type        = bool
  default     = false
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
}

variable "at_rest_encryption_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable encryption at rest."
}

variable "auth_token" {
  type        = string
  default     = null
  description = "Password used to access a password protected server"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = false
  description = "Specifies whether minor version engine upgrades will be applied automatically to the underlying"
}

variable "data_tiering_enabled" {
  type        = bool
  default     = false
  description = "Enables data tiering"
}

variable "final_snapshot_identifier" {
  type        = string
  default     = null
  description = "The name of your final node group (shard) snapshot."
}

variable "global_replication_group_id" {
  type        = string
  default     = null
  description = "The ID of the global replication group to which this replication group should belong."
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "The ARN of the key that you wish to use if encrypting at rest."
}

variable "maintenance_window" {
  type        = string
  default     = "sat:03:00-sat:06:00"
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed."
}

variable "multi_az_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether to enable Multi-AZ Support for the replication group."
}

variable "notification_topic_arn" {
  type        = string
  default     = null
  description = "ARN of an SNS topic to send ElastiCache notifications to"
}

variable "num_node_groups" {
  type        = number
  default     = null
  description = "Number of node groups (shards) for this Redis replication group."
}

variable "replicas_per_node_group" {
  type        = number
  default     = null
  description = "Number of replica nodes in each node group."
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "One or more Amazon VPC security groups associated with this replication group."
}

variable "security_group_names" {
  type        = list(string)
  default     = null
  description = "List of cache security group names to associate with this replication group."
}

variable "snapshot_retention_limit" {
  type        = number
  default     = 7
  description = "Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
}

variable "snapshot_window" {
  type        = string
  default     = "00:00-02:00"
  description = "Daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
}

variable "snapshot_name" {
  type        = string
  default     = null
  description = "Name of a snapshot from which to restore data into the new node group."
}
variable "transit_encryption_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable encryption in transit."
}

variable "user_group_ids" {
  type        = list(string)
  default     = null
  description = "User Group ID to associate with the replication group."
}

variable "description_redis" {
  type        = string
  default     = ""
  description = "User-created description for the replication group. Must not be empty"
}
variable "log_delivery_configuration" {
  type        = list(map(string))
  default     = []
  description = "block allows the streaming of Redis SLOWLOG or Redis Engine Log to CloudWatch Log"
}

##############################################################################################
#Subnet Group
variable "description_subnet" {
  type        = string
  default     = null
  description = "The Description of the ElastiCache Subnet Group."
}

variable "subnet_group_name" {
  type        = string
  default     = null
  description = "The Name of the ElastiCache Subnet Group."
}
variable "subnet_ids" {
  description = "The Subnet IDs of the ElastiCache Subnet Group."
  type        = list(string)
  default     = [null]
}

##############################################################################################
#Parameter Group
variable "parameter_group_name" {
  type        = string
  default     = null
  description = "The name of the ElastiCache parameter group."
}
variable "family" {
  type        = string
  default     = "redis6.x"
  description = "The family of the ElastiCache parameter group."
}
variable "description_parameter" {
  type        = string
  default     = null
  description = "The description of the ElastiCache parameter group."
}
variable "parameters" {
  type        = list(map(string))
  default     = []
  description = "List of DB parameters to apply"
}
##############################################################################################
#User
variable "user_id" {
  type        = string
  default     = null
  description = "The ID of the user."
}
variable "user_name" {
  type        = string
  default     = null
  description = "The username of the user."
}
variable "access_string" {
  type        = string
  default     = null
  description = "Access permissions string used for this user. "
}

variable "authentication_mode" {
  type = list(object({
    type      = optional(string)
    passwords = optional(string)
  }))
  description = "Denotes the user's authentication properties."
}
##############################################################################################
#User Group
variable "user_group_id" {
  type        = string
  default     = null
  description = "The user group identifier."
}
##############################################################################################
#User Password

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
##############################################################################################
#Common
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources"
}
##############################################################################################
