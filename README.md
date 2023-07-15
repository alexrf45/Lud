
# Lud

A simple Terraform Module for Bug Bounty/ Attack Surface Management

Feel free to fork and tweak the module to your liking. You may also call additional modules for more VPS instances as needed. 


## Installation

- Configure your AWS access keys 

`mkdir live`

`cd Lud/ && cp live_template live `

`ssh-keygen -t rsa -C "bug_bounty" -N '' -f ~/.ssh/bounty`

Ensure your ssh key is added to the ssh agent or manually specify it when you go to login.
    
## Deployment

To deploy this VPS run

```bash
  $ terraform init

  $ terraform plan

  $ terraform apply
```
- Jot down the Public IP output or export it $IP.

After about 5-10 minutes, ssh into the VPS and profit!

```bash

ssh ubuntu@$IP

```

## Module Configuration

Inputs and scripts are based on AWS Ubuntu 23.04 AMI

```hcl
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
```


## Deployment Demo:

[![asciicast](https://asciinema.org/a/587510.svg)](https://asciinema.org/a/587510)

## Usage Demo: 

[![asciicast](https://asciinema.org/a/587511.svg)](https://asciinema.org/a/587511)
