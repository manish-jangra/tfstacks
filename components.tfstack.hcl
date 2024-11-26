component "ClusterNetworkConfiguration" {
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
component "ClusterInstallation" {
  source  = "terraform-redhat/rosa-classic/rhcs"
  version = "1.6.5"
  inputs = {
    cluster_name                = "tfstacks"
    openshift_version           = "4.14.24"
    create_account_roles        = true
    create_operator_roles       = true
    create_oidc                 = true
    create_admin_user           = true
    account_role_prefix         = "tfstacks"
    autoscaling_enabled         = true
    aws_subnet_ids              = component.ClusterNetworkConfiguration.private-subnets.ids
    cluster_autoscaler_enabled  = true
    compute_machine_type        = "m6a.2xlarge"
    machine_cidr                = var.vpc_cidr
    managed_oidc                = true
    min_replicas                = 3
    max_relicas                 = 15
    multi_az                    = true
    operator_role_prefix        = "tfstacks"
    pod_cidr                    = "192.168.0.0/16"
    wait_for_create_complete    = true
  }
  providers = {
    rhcs    = provider.rhcs.rhcs_config
    null    = provider.null.null_config
    random  = provider.random.random_config
    time    = provider.time.time_config
    aws     = provider.aws.this
  }
}

# component "ClusterPostConfiguration" {
#   source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
# }

# component "DatabaseNetworkConfiguration" {
#   source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
# }

# component "MultiPlatformAWSNetworkConfiguration" {
#   source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
# }

# component "MultiPlatformIBMNetworkConfiguration" {
#   source = "git::https://github.com/redhat-appstudio/infrastructure.git//terraform/modules/network"
# }
