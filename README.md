<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_elasticache_parameter_group"></a> [elasticache\_parameter\_group](#module\_elasticache\_parameter\_group) | ./modules/cache_parameter_group | n/a |
| <a name="module_elasticache_subnet_group"></a> [elasticache\_subnet\_group](#module\_elasticache\_subnet\_group) | ./modules/cache_subnet_group | n/a |
| <a name="module_elasticache_user"></a> [elasticache\_user](#module\_elasticache\_user) | ./modules/cache_user | n/a |
| <a name="module_elasticache_user_group"></a> [elasticache\_user\_group](#module\_elasticache\_user\_group) | ./modules/cache_user_group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_replication_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [random_password.master_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_string"></a> [access\_string](#input\_access\_string) | Access permissions string used for this user. | `string` | `null` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Whether to enable encryption at rest. | `bool` | `true` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | Password used to access a password protected server | `string` | `null` | no |
| <a name="input_authentication_mode"></a> [authentication\_mode](#input\_authentication\_mode) | Denotes the user's authentication properties. Possible of type options are: password, no-password-required or iam. | <pre>list(object({<br>    type      = optional(string)<br>    passwords = optional(string)<br>  }))</pre> | <pre>[<br>  {<br>    "passwords": null,<br>    "type": null<br>  }<br>]</pre> | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Specifies whether minor version engine upgrades will be applied automatically to the underlying | `bool` | `false` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | `bool` | `true` | no |
| <a name="input_create"></a> [create](#input\_create) | Create the resource? | `bool` | `true` | no |
| <a name="input_create_cache"></a> [create\_cache](#input\_create\_cache) | Create the elasticache Redis? | `bool` | `false` | no |
| <a name="input_create_cache_password"></a> [create\_cache\_password](#input\_create\_cache\_password) | Create the password? | `bool` | `false` | no |
| <a name="input_create_elasticache_parameter_group"></a> [create\_elasticache\_parameter\_group](#input\_create\_elasticache\_parameter\_group) | Create the parameter group? | `bool` | `false` | no |
| <a name="input_create_elasticache_replication_group"></a> [create\_elasticache\_replication\_group](#input\_create\_elasticache\_replication\_group) | Create the replication group? | `bool` | `false` | no |
| <a name="input_create_elasticache_subnet_group"></a> [create\_elasticache\_subnet\_group](#input\_create\_elasticache\_subnet\_group) | Create the subnet group? | `bool` | `false` | no |
| <a name="input_create_elasticache_user"></a> [create\_elasticache\_user](#input\_create\_elasticache\_user) | Create the user? | `bool` | `false` | no |
| <a name="input_create_elasticache_user_group"></a> [create\_elasticache\_user\_group](#input\_create\_elasticache\_user\_group) | Create the user group? | `bool` | `false` | no |
| <a name="input_data_tiering_enabled"></a> [data\_tiering\_enabled](#input\_data\_tiering\_enabled) | Enables data tiering | `bool` | `false` | no |
| <a name="input_description_parameter"></a> [description\_parameter](#input\_description\_parameter) | The description of the ElastiCache parameter group. | `string` | `null` | no |
| <a name="input_description_redis"></a> [description\_redis](#input\_description\_redis) | User-created description for the replication group. Must not be empty | `string` | `""` | no |
| <a name="input_description_subnet"></a> [description\_subnet](#input\_description\_subnet) | The Description of the ElastiCache Subnet Group. | `string` | `null` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Name of the cache engine to be used for the clusters in this replication group. | `string` | `"redis"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version number of the cache engine to be used for the cache clusters in this replication group. | `string` | `"6.x"` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the ElastiCache parameter group. | `string` | `"redis6.x"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final node group (shard) snapshot. | `string` | `null` | no |
| <a name="input_global_replication_group_id"></a> [global\_replication\_group\_id](#input\_global\_replication\_group\_id) | The ID of the global replication group to which this replication group should belong. | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the key that you wish to use if encrypting at rest. | `string` | `null` | no |
| <a name="input_log_delivery_configuration"></a> [log\_delivery\_configuration](#input\_log\_delivery\_configuration) | block allows the streaming of Redis SLOWLOG or Redis Engine Log to CloudWatch Log | `list(map(string))` | `[]` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `"sat:03:00-sat:06:00"` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Specifies whether to enable Multi-AZ Support for the replication group. | `bool` | `false` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Instance class to be used. | `string` | n/a | yes |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | ARN of an SNS topic to send ElastiCache notifications to | `string` | `null` | no |
| <a name="input_num_cache_clusters"></a> [num\_cache\_clusters](#input\_num\_cache\_clusters) | Number of cache clusters (primary and replicas) this replication group will have. | `number` | `3` | no |
| <a name="input_num_node_groups"></a> [num\_node\_groups](#input\_num\_node\_groups) | Number of node groups (shards) for this Redis replication group. | `number` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the ElastiCache parameter group. | `string` | `null` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | List of DB parameters to apply | `list(map(string))` | `[]` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the user. | `list(string)` | `[]` | no |
| <a name="input_password_create"></a> [password\_create](#input\_password\_create) | Password Create | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | Port number on which each of the cache nodes will accept connections. | `number` | `6379` | no |
| <a name="input_preferred_cache_cluster_azs"></a> [preferred\_cache\_cluster\_azs](#input\_preferred\_cache\_cluster\_azs) | List of EC2 availability zones in which the replication group's cache clusters will be created. | `list(string)` | `null` | no |
| <a name="input_random_password_length"></a> [random\_password\_length](#input\_random\_password\_length) | The length of the string desired. | `number` | `16` | no |
| <a name="input_replicas_per_node_group"></a> [replicas\_per\_node\_group](#input\_replicas\_per\_node\_group) | Number of replica nodes in each node group. | `number` | `null` | no |
| <a name="input_replication_group_id"></a> [replication\_group\_id](#input\_replication\_group\_id) | Replication group identifier. This parameter is stored as a lowercase string. | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | One or more Amazon VPC security groups associated with this replication group. | `list(string)` | `[]` | no |
| <a name="input_security_group_names"></a> [security\_group\_names](#input\_security\_group\_names) | List of cache security group names to associate with this replication group. | `list(string)` | `null` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | Name of a snapshot from which to restore data into the new node group. | `string` | `null` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `number` | `7` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | Daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `"00:00-02:00"` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | The Name of the ElastiCache Subnet Group. | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The Subnet IDs of the ElastiCache Subnet Group. | `list(string)` | <pre>[<br>  null<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Whether to enable encryption in transit. | `bool` | `true` | no |
| <a name="input_user_group_id"></a> [user\_group\_id](#input\_user\_group\_id) | The user group identifier. | `string` | `null` | no |
| <a name="input_user_group_ids"></a> [user\_group\_ids](#input\_user\_group\_ids) | User Group ID to associate with the replication group. | `list(string)` | `null` | no |
| <a name="input_user_id"></a> [user\_id](#input\_user\_id) | The ID of the user. | `string` | `null` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The username of the user. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cache_instance_endpoint"></a> [cache\_instance\_endpoint](#output\_cache\_instance\_endpoint) | The DNS address of the Primary Cache |
| <a name="output_cache_instance_password"></a> [cache\_instance\_password](#output\_cache\_instance\_password) | The cache password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_db_instance_endpoint_reader"></a> [db\_instance\_endpoint\_reader](#output\_db\_instance\_endpoint\_reader) | The DNS address of the Reader Cache |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Authors

Module is maintained by [Emidio Neto](https://github.com/emdneto), [Leonardo Jardim](https://github.com/leojaardim) and [Yuri Azeredo](https://github.com/yuriazeredo)
## License

Apache 2 Licensed. See [LICENSE](https://github.com/osgurisdosre/terraform-aws-documentdb/blob/main/LICENSE) for full details.
