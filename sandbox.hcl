resource "gcp_project" "my_project" {
	regions = ["europe-west1"]
	services = ["compute.googleapis.com"]

  user {
    name = "admin"
    roles = ["roles/editor"]
  }

  user {
    name = "user"
    roles = ["roles/viewer"]
  }

  service_account {
    name = "admin"
    roles = ["roles/editor"]
  }
}

resource "aws_account" "my_account" {
	regions = ["eu-west-1"]
	services = ["s3", "ec2", "route53"]
	
	user_iam_policy = file("files/user_iam_policy.json")
	
	account_managed_policies = [
		"arn:aws:iam::aws:policy/IAMFullAccess"
	]
	
	account_scp_policy = file("files/account_scp_policy.json")
}

resource "azure_subscription" "my_subscription"{
	regions = ["westeurope"]
	services = ["Microsoft.Compute"]
	roles = ["Contributor"]
}

resource "network" "main" {
	subnet = "10.0.5.0/24"
}

resource "container" "vault" {
  image {
    name = "hashicorp/vault"
  }

  port {
    local = 8200
    host  = 8200
  }

	network {
		id = resource.network.main.meta.id
	}
}

resource "container" "ubuntu" {
  image {
    name = "ubuntu"
  }

  command = ["tail", "-f", "/dev/null"]

	network {
		id = resource.network.main.meta.id
	}
}

resource "vm" "test" {
  disabled = variable.disable_vm || system("os") == "darwin"

  config {
    arch = "x86_64" // default to host arch
  }

  resources {
    cpu = 2 // cores
    memory = 2048 // mb
  }

  disk {
    boot = true
    type = "qcow2"
    source = variable.vm_image
  }

  volume {
    source = "/tmp"
    destination = "/mnt/test"
  }

  network {
    id = resource.network.main.meta.id
  }

  port {
    local  = 22
    host   = 2201
  }

  vnc {
    port = 8999
  }

  cloud_init {
    meta_data = <<-EOF
    instance-id: instruqt
    local-hostname: instruqt
    EOF

    user_data = <<-EOF
    #cloud-config
    password: password
    chpasswd:
      expire: False
    debug: True
    disable_root: False
    ssh_deletekeys: False
    ssh_pwauth: True
    EOF
  }
}