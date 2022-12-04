terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }

  backend "s3" {
    bucket = "${var.candidate_id}-terraform-state"
    key = "${var.candidate_id}/${var.candidate_id}-terraform.state"
    region = "eu-west-1"
  }

}