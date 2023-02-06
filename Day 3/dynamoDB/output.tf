output "dynamoDB-arn" {
  value = aws_dynamodb_table.terraform_locks.arn
}

output "dynamoDB-name" {
  value = aws_dynamodb_table.terraform_locks.name
}