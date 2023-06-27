output "snowflake_warehouse" {
    value = snowflake_warehouse.warehouse.name
}

output "snowflake_username" {
    value = var.sf_username
}

output "snowflake_account" {
    value = var.sf_account
}