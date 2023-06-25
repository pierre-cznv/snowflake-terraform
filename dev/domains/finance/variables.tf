variable "sf_account" {
  type        = string
  description = "Snowflake account ID + region"
  default     = "ig29163.eu-west-1"
}

variable "sf_username" {
  type        = string
  description = "Snowflake user name"
}

variable "sf_password" {
  type        = string
  description = "Snowflake user password"
}