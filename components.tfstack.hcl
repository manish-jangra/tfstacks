component "cluster_network" {
    source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
    inputs = {
      vpc_cidr                  = var.vpc_cidr
      cluster_name              = var.cluster_name
      private_subnets           = var.private_subnets
      public_subnets            = var.public_subnets
    }
    providers = {
        aws       = provider.aws.this
    }
}

# component "database_network" {
#   source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
# }

# component "aws_network_for_mpc" {
#   source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
# }

# # component "ibm_network_for_mpc" {
  
# # }

# component "rosa_cluster" {
#   source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
# }
