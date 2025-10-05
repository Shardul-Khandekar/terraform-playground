terraform {
  required_providers {
    # For every provider, specify the source and version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
  # Specify the required Terraform version
  required_version = ">= 1.2"
}