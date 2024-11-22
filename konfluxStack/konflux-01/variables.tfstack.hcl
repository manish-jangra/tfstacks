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
