resource "gcp_project" "my_project" {
	regions = ["europe-west1"]
	services = ["compute.googleapis.com"]
	roles = ["roles/owner", "roles/storageEditor"]
}

resource "aws_account" "my_account" {
	regions = ["eu-west-1"]
	services = ["s3", "ec2", "route53"]
	
	user_iam_policy = file("assets/user_iam_policy.json")
	
	account_managed_policies = [
		"arn:aws:iam::aws:policy/IAMFullAccess"
	]
	
	account_scp_policy = file("assets/account_scp_policy.json")
}

resource "azure_subscription" "my_subscription"{
	regions = ["westeurope"]
	services = ["Microsoft.Compute"]
	roles = ["Contributor"]
}

resource "container" "vault" {
  image {
    name = "hashicorp/vault"
  }
}

resource "container" "ubuntu" {
  image {
    name = "ubuntu"
  }

  command = ["tail", "-f", "/dev/null"]
}