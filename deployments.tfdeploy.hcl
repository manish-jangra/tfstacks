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

deployment "kflux_prd_rh02" {
    inputs = {
      access_key = store.varset.aws_keys.access_key
      secret_key = store.varset.aws_keys.secret_key
      rhcs_token = store.varset.aws_keys.ocm_token
    }
}

# deployments.tfdeploy.hcl
orchestrate "auto_approve" "safe_plans" {
    # Ensure that no resource is removed.
    check {
        condition = context.plan.changes.remove == 1
        reason    = "Plan is destroying ${context.plan.changes.remove} resources."
    }
}
