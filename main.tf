terraform {
  required_version = ">= 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.49.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "drift_detector_test" {
  bucket = "my-unique-drift-detector-bucket-india"

  tags = {
    Name        = "drift-detector-test"
    Environment = "dev"
  }
}