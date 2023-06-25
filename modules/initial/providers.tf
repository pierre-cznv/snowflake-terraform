# PROVIDER SETUP

terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.59.0"
    }
  }
}

# SYSADMIN CONNECTION

provider "snowflake" {
  account  = var.sf_account # the Snowflake account identifier
  username = var.sf_username
  password = var.sf_password
  role     = "ACCOUNTADMIN"
}