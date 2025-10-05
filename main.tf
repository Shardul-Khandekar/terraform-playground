provider "aws" {
  region = "us-west-2"
}

# Define IAM role
resource "aws_iam_role" "lambda_access_role" {
  name = "lambda_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach policy to the role
resource "aws_iam_role_policy_attachment" "lambda_s3_access_role_policy_attachment" {
  role       = aws_iam_role.lambda_access_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Output ARN of the IAM role
output "role_arn" {
  value = aws_iam_role.lambda_access_role.arn

}