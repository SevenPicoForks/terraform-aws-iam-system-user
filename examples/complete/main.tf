provider "aws" {
  region = var.region
}

provider "awsutils" {
  region = var.region
}

module "iam_system_user" {
  #checkov:skip=CKV_AWS_273:skipping 'Ensure access is controlled through SSO and not AWS IAM defined users'
  source = "../../"

  force_destroy = true
  pgp_key       = ""

  context = module.this.context
}
