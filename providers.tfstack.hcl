# providers.tfstack.hcl
required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.7.0"
    }
    rhcs = {
        source  = "terraform-redhat/rhcs"
        version = "1.6.5"
    }
    null = {
        source = "hashicorp/null"
        version = "3.2.3"
    }
    random = {
        source = "hashicorp/random"
        version = "3.6.3"
    }
    time = {
        source = "hashicorp/time"
        version = "0.12.1"
    }
}

provider "aws" "this" {
    config {
        region      = "us-east-1"
        access_key  = var.access_key
        secret_key  = var.secret_key
    }
}

provider "rhcs" "rhcs_config" {
    config {
        token = var.rhcs_token
    }
}

provider "null" "null_config" {}

provider "random" "random_config" {}  

provider "time" "time_config" {}
