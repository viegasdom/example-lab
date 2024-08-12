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