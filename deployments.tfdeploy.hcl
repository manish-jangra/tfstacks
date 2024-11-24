# deployments.tfdeploy.hcl

# Define variables that multiple deployments use.
# locals {
#     tf_organization    = "<organization_name>"
#     tf_project_name    = "<project_name>"
# }

# deployments.tfdeploy.hcl

# identity_token "aws" {
#     audience = ["aws.workload.identity"]
# }

store "varset" "aws_keys" {
  id       = "varset-vUvaCaUvSF6SNFt3"
  category = "env"
}

deployment "tfstacks-pilot" {
    inputs = {
      access_key = store.varset.aws_keys.access_key
      secret_key = store.varset.aws_keys.secret_key
    }
}

# deployments.tfdeploy.hcl
orchestrate "auto_approve" "safe_plans" {
    # Ensure that no resource is removed.
    check {
        condition = context.plan.changes.remove == 0
        reason    = "Plan is destroying ${context.plan.changes.remove} resources."
    }
}
