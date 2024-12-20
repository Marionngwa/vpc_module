module "jira" {
  source = "../.."
  vpc_name = "migration_app"
  NAT_name = "Nat_migration"
}
