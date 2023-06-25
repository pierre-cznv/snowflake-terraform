module "domain_initial_setup" {
  source = "../../..//modules/initial"

  env    = "DEV"
  domain = "FINANCE"

  sf_account  = var.sf_account # the Snowflake account identifier
  sf_username = var.sf_username
  sf_password = var.sf_password
}
