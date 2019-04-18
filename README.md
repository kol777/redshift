# Redshift Terraform Automation in AWS

In this automation, a Terraform module was created containing:
- One Redshift Cluster
- One S3 Bucket
- One Role Policy 
- One Role

## Prerequisites

In order to be able to use this automation you will have to:
- Install Terraform (https://www.terraform.io/downloads.html)

- Create a IAM user with enough rights to provision the resources

- Create an access key and a secret access key for the user

- Create a credentials file with the following configuration:

```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

## Implementation Details
A role is created for the redshift service. Based on this role, a role policy is associated with it and based on it, based on the S3 bucket which will be created. The redshift cluster will have read/write access to the bucket.

The module is based on one map variable called **redshift_cluster** which has the following keys:
- policy_name (The name of the role policy)
- role_name (The name of the role which will be associated with the S3 bucket access)
- s3_bucket_name (The name of the s3 bucket)
- bucket_tag (The tag value of the cost key for the bucket)
- redshift_tag (The tag value of the cost key for the redshift)
- cluster_identifier (The name of the cluster)
- master_username (The master username)
- master_password (The master password)
- cluster_type (The cluster type)
- node_type (The node type)
- number_of_nodes (The number of nodes)

In the main file of the root directory, there is another map variable called **provider** which has the following keys:
- region (the region in which the resources will be created; eg. us-weste-1)
- credentials_file (the path to the credentials file containing the access key and the secret access key)
- profile (the profile used from the credentials file)

All of the changes to variables values must be in **terraform.tfvars** file.
An example **terraform.tfvars** file was provided in the root directory.

## Running to code
- Go to root directory
- Get module
  `terraform init`
- Plan to see what resources are going to be created
   `terraform plan`
- Create the resources
   `terraform apply`
- If you want to remove the resources
   `terraform destroy`