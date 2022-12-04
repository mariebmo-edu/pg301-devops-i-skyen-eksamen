terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }

  backend "s3" {
    bucket = "1027-terraform-state"
    key = "1027/1027-terraform.state"
    region = "eu-west-1"
  }

}