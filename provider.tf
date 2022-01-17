terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQC5DQCKMXY6L347G"
  secret_key = "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"
}
