variable "vpc_cidr" {
    description = "IP Address CIDR for the VPC"
    type        = string
    default     = "10.29.67.0/24"
    sensitive   = false
}

variable "private_subnets" {
    description = "IP Address CIDR for the VPC"
    type        = list(string)
    default     = ["10.29.67.0/26", "10.29.67.64/26", "10.29.67.128/26"]
    sensitive   = false
}

variable "public_subnets" {
    description = "IP Address CIDR for the VPC"
    type        = list(string)
    default     = ["10.29.67.192/28", "10.29.67.208/28", "10.29.67.224/28"]
    sensitive   = false
}

variable "cluster_name" {
    description = "IP Address CIDR for the VPC"
    type    = string
    default = "stone-prod-p02"
    sensitive   = false
}

variable "access_key" {
    description = "AWS ACCESS KEY"
    type    = string
    sensitive   = true
    ephemeral = true
}

variable "secret_key" {
    description = "AWS SECRET ACCESS KEY"
    type    = string
    sensitive   = true
    ephemeral = true
}

variable "rhcs_token" {
    description = "OCM API Token"
    type    = string
    sensitive   = true
    ephemeral = true
}

variable "az" {
    description = "OCM API Token"
    type    = list(string)
    default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}
