resource "aws_iam_role_policy" "this" {
  
  name = "${lookup(var.redshift_cluster, "policy_name")}"
  role = "${aws_iam_role.this.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ListObjectsInBucket",
            "Effect": "Allow",
            "Action": ["s3:ListBucket"],
            "Resource": ["${aws_s3_bucket.this.arn}"]
        },
        {
            "Sid": "AllObjectActions",
            "Effect": "Allow",
            "Action": "s3:*Object",
            "Resource": ["${aws_s3_bucket.this.arn}/*"]
        }
    ]
}
EOF
}

resource "aws_iam_role" "this" {
  name = "${lookup(var.redshift_cluster, "role_name")}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "this" {
  bucket = "${lookup(var.redshift_cluster, "s3_bucket_name")}"
  acl    = "private"
  tags = {
    Cost = "${lookup(var.redshift_cluster, "bucket_tag")}"
  }  
}

resource "aws_redshift_cluster" "this" {
  cluster_identifier  = "${lookup(var.redshift_cluster, "cluster_identifier")}"
  master_username     = "${lookup(var.redshift_cluster, "master_username")}"
  master_password     = "${lookup(var.redshift_cluster, "master_password")}"
  node_type           = "${lookup(var.redshift_cluster, "node_type")}"
  cluster_type        = "${lookup(var.redshift_cluster, "cluster_type")}"
  number_of_nodes     = "${lookup(var.redshift_cluster, "number_of_nodes")}"
  iam_roles           = ["${aws_iam_role.this.arn}"]
  tags = {
    Cost = "${lookup(var.redshift_cluster, "redshift_tag")}"
  }
  skip_final_snapshot = "true"
}