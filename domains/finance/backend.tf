terraform {
  backend "s3" {
    bucket = "snowflake-terraform-dev"
    key    = "modules/initial/terraform.tfstate"
    region = "eu-west-1"
  }
}
