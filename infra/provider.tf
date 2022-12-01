terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }

  backend "s3" {
    bucket = "analytics-1027"
    key = "knr1027/analytics-1027-key.state"
    region = "eu-west-1"
  }

}