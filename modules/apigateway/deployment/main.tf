resource "time_static" "created_at" {}

resource "aws_api_gateway_deployment" "deploy_api" {
  rest_api_id = var.rest_api_id
  variables   = merge(
    var.variables,
    {
      created_at = time_static.created_at.rfc3339
      updated_at = timestamp()
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/apigateway/${var.rest_api_id}/${var.stage_name}"
  retention_in_days = 7
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deploy_api.id
  rest_api_id   = var.rest_api_id
  stage_name    = var.stage_name

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.log_group.arn
    format          = "{ \"requestId\":\"$context.requestId\", \"ip\": \"$context.identity.sourceIp\", \"requestTime\":\"$context.requestTime\", \"httpMethod\":\"$context.httpMethod\",\"routeKey\":\"$context.routeKey\", \"status\":\"$context.status\",\"protocol\":\"$context.protocol\", \"responseLength\":\"$context.responseLength\" }"
  }

  depends_on    = [aws_cloudwatch_log_group.log_group]
}

resource "aws_api_gateway_method_settings" "method_settings" {
  rest_api_id = var.rest_api_id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  method_path = "*/*"


  settings {
    metrics_enabled = var.metrics_enabled
    logging_level   = var.logging_level
  }
}