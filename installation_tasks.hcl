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

resource "task" "verify_installation" {
  prerequisites = [
    resource.task.manual_installation
  ]

  config {
    user   = "root"
    target = variable.terraform_target
  }

  condition "help_command" {
    description = "Use the terraform -help command"

    check {
      script          = "checks/installation/verify_installation/help_command"
      failure_message = "'terraform -help' command was not used to explore the possibilities of the CLI"
    }

    solve {
      script = "checks/installation/verify_installation/solve"
    }
  }
}

resource "task" "terraform_version" {
  prerequisites = [
    resource.task.verify_installation
  ]

  config {
    user   = "root"
    target = variable.terraform_target
  }

  condition "version_command" {
    description = "Use the terraform version command"

    check {
      script          = "checks/installation/terraform_version/version_command"
      failure_message = "'terraform version' command was not used to validate the installed version"
    }

    solve {
      script = "checks/installation/terraform_version/solve"
    }
  }
}