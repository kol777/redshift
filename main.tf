
provider "aws" {
  region                  = "${lookup(var.provider, "region")}"
  shared_credentials_file = "${lookup(var.provider, "credentials_file")}"
  profile                 = "${lookup(var.provider, "profile")}"
}
module "redshift" {
  source           = "./modules/redshift"
  redshift_cluster = "${var.redshift_cluster}"
}
