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
  source = "github.com/alexrf45/Lud.git//modules/vps?ref=v1.1.2"

  instance_type = "m5ad.large"
  key_name      = "bounty"
  ami           = "ami-0305d0b03812a425e"
  volume_size   = "70"

}

