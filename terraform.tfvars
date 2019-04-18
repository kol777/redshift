provider = {
    region           = "us-west-1"
    credentials_file = "~/.aws/credentials"
    profile          = "default"
}


redshift_cluster = {
    policy_name        = "s3_bucket_redshift_policy"
    role_name          = "s3_bucket_redshift_role"
    s3_bucket_name     = "s3-bucket-redshift-test"
    cluster_identifier = "redshift-cluster-7"
    master_username    = "master"
    master_password    = "b3StronG!"
    cluster_type       = "multi-node"
    node_type          = "dc1.large"
    number_of_nodes    = "2"
    redshift_tag       = "redshift"
    bucket_tag         = "bucket"
}