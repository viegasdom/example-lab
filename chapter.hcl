resource "chapter" "introduction" {
  title = "Introduction"

  page "platform" {
    title = "Platform instructions"
    file = "instructions/introduction/platform.md"
  }
}

resource "chapter" "installation" {
  title = "Installation"

  prerequisites = [
    // resource.chapter.introduction
  ]
  
  page "installation" {
    title = "Installing Terraform"
    file = "instructions/installation/installation.md"
    
    variables = {
      terraform_version = "0.12"
    }
    
    tasks = {
      "install_terraform" = resource.task.install_terraform
    }
  }

  page "verification" {
    title = "Checking the Installation"
    file = "instructions/installation/verification.md"
  
    variables = {
      terraform_version = "0.12"
    }

    tasks = {
      "verify_terraform" = resource.task.verify_terraform
    }
  }

  page "recap" {
    file = "instructions/installation/recap.md"

    quizzes = {
      // "installation" = resource.quiz.installation
    }
  }
}

resource "chapter" "workflow" {
  title = "Workflow"

  prerequisites = [
    resource.chapter.installation
  ]

  page "workflow" {
    title = "Terraform Workflow"
    file = "instructions/workflow/page.md"

    tasks = {
      "init" = resource.task.init
      "plan" = resource.task.plan
      "apply" = resource.task.apply
    }
  }
}

resource "chapter" "conclusion" {
  title = "conclusion"

  page "conclusion" {
    title = "Conclusion"
    file = "instructions/conclusion/page.md"
  }
}