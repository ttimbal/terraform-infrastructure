module "initial_resources" {
  source = "./resources"
  bucket_name = "timbal-terraform-state"
  dynamo_table_name = "terraform-state-lock"
  versioning = true
}