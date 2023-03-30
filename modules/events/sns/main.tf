resource "aws_sns_topic" "sns" {
  name            = var.name

  tags = merge(
    var.tags,
    {
      Name=var.name
    }
  )

  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false
  }
}
EOF
}

output "sns" {
  value = aws_sns_topic.sns
}