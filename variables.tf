variable "provider" {
  type        = "map"
  description = "Provider variables: region, credentials_file, profile" 
}

variable "redshift_cluster" {
  type        = "map"
  description = "Redshift cluster specific variables: policy_name, role_name, s3_bucket_name, bucket_tag, redshift_tag, cluster_identifier, master_username, master_password, cluster_type, node_type, number_of_nodes, tags" 
}