resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.dynamo_table_name
  hash_key       = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}