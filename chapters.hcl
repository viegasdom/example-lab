resource "chapter" "introduction" {
  title = "Introduction"

  page "terraform" {
    file = "instructions/introduction/what_is_terraform.md"
  }

  page "platform" {
    file = "instructions/introduction/workshop_environment.md"
  }

  page "outline" {
    file = "instructions/introduction/what_will_you_learn.md"
  }
}

resource "chapter" "installation" {
  title = "Install terraform"

  tasks = {
    manual_installation = resource.task.manual_installation
    verify_installation = resource.task.verify_installation
    terraform_version   = resource.task.terraform_version
  }

  page "manual_installation" {
    file = "instructions/installation/manual_installation.md"
  }

  page "verify_installation" {
    file = "instructions/installation/verify_installation.md"
  }

  page "terraform_version" {
    file = "instructions/installation/terraform_version.md"
  }
}

resource "chapter" "workflow" {
  title = "Terraform workflow"

  tasks = {
    terraform_init    = resource.task.terraform_init
    terraform_plan    = resource.task.terraform_plan
    terraform_apply   = resource.task.terraform_apply
    update_resources  = resource.task.update_resources
    terraform_destroy = resource.task.terraform_destroy
  }

  page "terraform_init" {
    file = "docs/workflow/terraform_init.md"
  }

  page "terraform_plan" {
    file = "docs/workflow/terraform_plan.md"
  }

  page "terraform_apply" {
    file = "docs/workflow/terraform_apply.md"
  }

  page "update_resources" {
    file = "docs/workflow/update_resources.md"
  }

  page "terraform_destroy" {
    file = "docs/workflow/terraform_destroy.md"
  }
}

resource "chapter" "providers" {
  title = "Providers"

  tasks = {
    install_provider       = resource.task.install_provider
    provider_configuration = resource.task.provider_configuration
  }

  page "install_provider" {
    file = "instructions/providers/install_provider.md"
  }

  page "provider_configuration" {
    file = "instructions/providers/provider_configuration.md"
  }
}

resource "chapter" "state" {
  title = "State"

  tasks = {
    viewing_state = resource.task.viewing_state
    list_state    = resource.task.list_state
    show_state    = resource.task.show_state
  }

  page "viewing_state" {
    file = "instructions/state/viewing_state.md"
  }

  page "list_state" {
    file = "instructions/state/list_state.md"
  }

  page "show_state" {
    file = "instructions/state/show_state.md"
  }
}

resource "chapter" "summary" {
  title = "Summary"

  page "summary" {
    file = "instructions/summary/page.md"
  }
}