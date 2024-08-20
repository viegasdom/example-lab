resource "task" "manual_installation" {
  prerequisites = []

  config {
    user   = "root"
    target = variable.terraform_target
  }

  condition "binary_exists" {
    description = "Terraform installed on path"

    check {
      script          = "scripts/installation/manual_installation/binary_exists"
      failure_message = "terraform binary not found on the PATH"
    }

    solve {
      script  = "scripts/installation/manual_installation/solve"
      timeout = 60
    }
  }

  condition "latest_version" {
    description = "Terraform binary is the latest version"

    check {
      script          = "scripts/installation/manual_installation/version_latest"
			variables       = { 
				name = "terraform" 
			}
      failure_message = "terraform binary is not the latest version"
    }
  }
}





















resource "task" "install_terraform" {
	config {
		target = resource.container.vault
		timeout = 10
		user = "root"
		group = "root"
		working_directory = "/"
	}

	condition "terraform_path" {
		description = "Terraform is available on the PATH"
		
		setup {
			script = "scripts/setup_terraform_path.sh"
		}
		
		check {
			script = "scripts/check_terraform_path.sh"
			failure_message = "Cannot find the terraform binary on the PATH: {{error}}"
			
			config {
				timeout = 60
			}
		}
		
		solve {
			script = "scripts/solve_terraform_path.sh"
		}
		
		cleanup {
			script = "scripts/cleanup_terraform_path.sh"
		}
	}

	success_message = "Good job"
}

resource "task" "verify_terraform" {
	prerequisites = [resource.task.install_terraform]

	condition "verify" {
		description = "Run terraform --version"

		check {
			script = "scripts/check_terraform_version.sh"
			failure_message = "Terraform is not installed: {{error}}"
			
			config {
				timeout = 30
			}
		}
	}
}

resource "task" "init" {
}

resource "task" "plan" {
	prerequisites = [resource.task.init]
}

resource "task" "apply" {
	prerequisites = [resource.task.plan]
}