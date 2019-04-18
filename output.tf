output "bucket_arn" {
  value = "${module.redshift.bucket_arn}"
}

output "redshift_endpoint" {
  value = "${module.redshift.redshift_endpoint}"
}