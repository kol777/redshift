output "bucket_arn" {
  value = "${aws_s3_bucket.this.arn}"
}

output "redshift_endpoint" {
  value = "${aws_redshift_cluster.this.endpoint}"
}