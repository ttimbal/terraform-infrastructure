resource "aws_api_gateway_rest_api" "rest_api" {
  name        = var.name
  description = var.description

  endpoint_configuration {
    types = [var.type]
  }

  tags = merge(
    var.tags,
    {
      Name=var.name
    }
  )
}

output "rest_api" {
  value = aws_api_gateway_rest_api.rest_api
}

/*resource "aws_api_gateway_model" "empty_model" {
  rest_api_id  = aws_api_gateway_rest_api.api_gateway.id
  name         = "Empty"
  description  = "Empty model"
  content_type = "application/json"

  schema = jsonencode({
    type = "object"
  })
}*/