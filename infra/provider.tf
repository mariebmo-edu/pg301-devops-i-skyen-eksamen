terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }

  backend "s3" {
    bucket = "knr1027-terraform-state"
    key = "knr1027/knr1027-terraform.state"
    region = "eu-west-1"
  }

}