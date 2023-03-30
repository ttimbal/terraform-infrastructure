resource "aws_sqs_queue" "sqs" {
  name                        = var.name
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.fifo_queue

  tags = merge(
    var.tags,
    {
      Name=var.name
    }
  )
}

output "sqs" {
  value = aws_sqs_queue.sqs
}