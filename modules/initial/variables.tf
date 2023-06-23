variable "env" {
  description = "The possible environments are dev, stage, prod"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "stage", "prod"], var.env)
    error_message = "The environment must be one of the values dev, stage, prod."
  }
}

variable "domain" {
  description = "The name of the team/domain, e.g. 'finance', 'marketing'"
  type        = string
  default     = "domain_not_set"
}

