
variable "env" {
  description = "The possible environments are 'DEV', 'PROD'."
  type        = string

  validation {
    condition     = contains(["DEV", "PROD"], var.env)
    error_message = "The environment must be one of the values 'DEV', 'PROD'."
  }
}

variable "domain" {
  description = "The name of the team/domain, e.g. 'finance', 'marketing'"
  type        = string
}

variable "sf_account" {
  type        = string
  description = "Snowflake account ID + region"
}

variable "sf_username" {
  type        = string
  description = "Snowflake user name"
}

variable "sf_password" {
  type        = string
  description = "Snowflake user password"
}