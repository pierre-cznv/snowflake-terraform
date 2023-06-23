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
  account  = "ig29163" # the Snowflake account identifier
  username = "tf-snow"
  password = "PhFZ#ZRBjfnGKA2"
  role     = "ACCOUNTADMIN"
}

# ROLE CREATION

resource "snowflake_role" "role" {
  name     = "tf_role_${var.domain}_${var.env}"
}


# DATABASE CREATION AND GRANT

resource "snowflake_database" "db" {
  name     = "tf_database_${var.domain}_${var.env}"
}

resource "snowflake_database_grant" "grant" {
  database_name     = snowflake_database.db.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}


# SCHEMA CREATION AND GRANT

resource "snowflake_schema" "schema" {
  database   = snowflake_database.db.name
  name       = "tf_schema_${var.domain}_${var.env}"
  is_managed = false
}

resource "snowflake_schema_grant" "grant" {
  database_name     = snowflake_database.db.name
  schema_name       = snowflake_schema.schema.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}


# WAREHOUSE CREATION AND GRANT

resource "snowflake_warehouse" "warehouse" {
  name           = "tf_warehouse_${var.domain}_${var.env}"
  warehouse_size = "x-small"
  auto_suspend = 30
  statement_timeout_in_seconds = 120
  max_concurrency_level = 4
  statement_queued_timeout_in_seconds = 30
  enable_query_acceleration = false
  query_acceleration_max_scale_factor = 0
}

resource "snowflake_warehouse_grant" "grant" {
  enable_multiple_grants = true
  warehouse_name    = snowflake_warehouse.warehouse.name
  privilege         = "MODIFY"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}

# USER CREATION

resource "snowflake_user" "user" {
  name              = "tf_user_${var.domain}_${var.env}"
  default_warehouse = snowflake_warehouse.warehouse.name
  default_role      = snowflake_role.role.name
  default_namespace = "${snowflake_database.db.name}.${snowflake_schema.schema.name}"
  default_secondary_roles = ["ALL"]
  password = "secret"
}

# ROLE GRANTED TO USER

resource "snowflake_role_grants" "grants" {
  role_name = snowflake_role.role.name
  users     = [snowflake_user.user.name]
}