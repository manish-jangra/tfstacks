# providers.tfstack.hcl
required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.7.0"
    }
    rhcs = {
        source = "terraform-redhat/rhcs"
        version = "1.6.5"
    }
}

provider "aws" "this" {
    config {
        region = "us-east-1"
        access_key = var.access_key
        secret_key = var.secret_key
    }
}

provider "rhcs" "rhcs_config" {
    config {
        token = var.rhcs_token
    }
}
