terraform {
  source = "../../../../..//modules/snowflake/domains"
}

locals {
  # Parse the file path we're in to read the env name: e.g., env
  # will be "dev" in the dev folder, "stage" in the stage folder,
  # etc.
  folder_name = basename(get_terragrunt_dir())
  parsed      = regex(".*/live/(?P<env>.*?)/.*", get_terragrunt_dir())
  env         = local.parsed.env
}

inputs = {
  env    = upper(local.env)
  domain = lower(local.folder_name)

  sf_account  = "ozyswfl-${local.env}"
  sf_username = "pierre"
  sf_password = get_env("SF_PASSWORD_${upper(local.env)}")
}

# Automatically find the root terragrunt.hcl and inherit its
# configuration
include {
  path = find_in_parent_folders()
}