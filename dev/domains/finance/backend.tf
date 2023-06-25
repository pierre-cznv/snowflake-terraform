terraform {
  backend "s3" {
    bucket = "snowflake-terraform-dev"
    key    = "dev/domains/finance/terraform.tfstate"
    region = "eu-west-1"
  }
}
