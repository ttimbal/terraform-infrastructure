resource "aws_s3_bucket" "s3" {
  bucket = var.name

  tags = {
    Name        = var.name
  }
}

output "s3" {
  value = aws_s3_bucket.s3
}