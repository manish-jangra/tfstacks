# providers.tfstack.hcl
required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.7.0"
    }
}

provider "aws" "this" {
    config {
        region = "us-east-1"
        access_key = var.access_key
        secret_key = var.secret_key
    }
}
