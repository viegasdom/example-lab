resource "task" "viewing_state" {
  prerequisites = [
    resource.chapter.providers
  ]

  config {
    user   = "root"
    target = resource.container.ubuntu
  }

  condition "show_command" {
    description = "The Terraform state is viewed"

    setup {
      script = "checks/state/viewing_state/setup"
    }

    check {
      script          = "checks/state/viewing_state/show_command"
      failure_message = "The terraform show command was not used to view the state"
    }

    solve {
      script = "checks/state/viewing_state/solve"
    }
  }

  condition "json_flag" {
    description = "The state is in a machine-readable format"

    check {
      script          = "checks/state/viewing_state/json_flag"
      failure_message = "The terraform state was not viewed in a machine-readable format such as JSON"
    }
  }
}

resource "task" "list_state" {
  prerequisites = [
    resource.task.viewing_state
  ]

  config {
    user   = "root"
    target = resource.container.ubuntu
  }

  condition "list_command" {
    description = "The state for all resources is listed"

    check {
      script          = "checks/state/list_state/list_command"
      failure_message = "The terraform state list command was not used"
    }

    solve {
      script = "checks/state/list_state/solve"
    }
  }
}

resource "task" "show_state" {
  prerequisites = [
    resource.task.list_state
  ]

  config {
    user   = "root"
    target = resource.container.ubuntu
  }

  condition "show_command" {
    description = "The state of the Vault Docker container was shown"

    check {
      script          = "checks/state/show_state/show_command"
      failure_message = "The terraform state show command was not used to view the state for docker_container.vault"
    }

    solve {
      script = "checks/state/show_state/solve"
    }
  }
}
