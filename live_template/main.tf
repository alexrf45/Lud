terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Purpose   = "Bug Bounty"
      ManagedBy = "Terraform"
    }
  }
}

module "vps" {
  source = "github.com/alexrf45/Lud.git//modules/vps?ref=v1.0.1"

  instance_type = "m5ad.large"
  key_name      = "bounty"
  ami           = "ami-016ce77a68234f5e3"
  volume_size   = "70"

}

