module "domain_initial_setup" {
  source = "../..//modules/initial"

  env    = "dev"
  domain = "finance"

}
