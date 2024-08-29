resource "task" "install_provider" {
  prerequisites = [
    resource.chapter.workflow
  ]

  config {
    user   = "root"
    target = resource.container.ubuntu
  }

  condition "provider_added" {
    description = "The vault provider is added to the code"

    check {
      script          = "scripts/providers/install_provider/provider_added"
      failure_message = "The \"hashicorp/vault\" provider was not added to required_providers"
    }

    solve {
      script  = "scripts/providers/install_provider/solve"
      config {
        timeout = 120
      }
    }
  }

  condition "provider_installed" {
    description = "The vault provider is installed"

    check {
      script          = "scripts/providers/install_provider/provider_installed"
      failure_message = "the vault provider was not correctly initialized"
    }
  }
}

resource "task" "provider_configuration" {
  prerequisites = [
    resource.task.install_provider
  ]

  config {
    user   = "root"
    target = resource.container.ubuntu
  }

  condition "configuration_added" {
    description = "The provider configuration is added"

    check {
      script          = "scripts/providers/provider_configuration/configuration_added"
      failure_message = "The provider configuration does not specify the Vault address"
    }

    solve {
      script = "scripts/providers/provider_configuration/solve"
    }
  }
}