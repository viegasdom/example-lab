resource "lab" "example" {
  title = "Example Lab"
  description = "This is an example lab."
  tags = ["example", "lab"] 
  languages = ["en_US", "es_ES"]
  
  settings {
    theme = "default"

    timelimit {
      duration = 60
      extend = 10
      show_timer = true
    }

    idle {
      timeout = 5
      show_warning = true
    }

    controls {
      show_stop = true
    }
  }

  layout "minimal" {
    default = true
    source = module.layouts.output.minimal

    tab "terminal-a" {
      panel = "main"
      target = resource.terminal.shell
    }

    tab "service" {
      panel = "main"
      target = resource.service.vault_ui
    }

    tab "editor" {
      panel = "main"
      target = resource.editor.code
    }

    instructions {
      panel = "main"
    }
  }

  layout "complex" {
    source = module.layouts.output.complex

    tab "terminal-a" {
      panel = "top_left"
      target = resource.terminal.shell
    }

     tab "editor" {
      panel = "top_left"
      target = resource.editor.code
    }

    tab "service" {
      panel = "bottom_left"
      target = resource.service.vault_ui
    }

    instructions {
      panel = "right"
    }
  }

  content {
    chapter "introduction" {
      title = "Introduction"
      source = resource.chapter.introduction
    }

    chapter "installation" {
      title = "Installation"
      source = resource.chapter.installation
    }

    chapter "workflow" {
      title = "Workflow"
      source = resource.chapter.workflow
      layout = "complex"
    }

    chapter "providers" {
      title = "Providers"
      source = resource.chapter.providers
    }

    chapter "state" {
      title = "State"
      source = resource.chapter.state
    }

    chapter "summary" {
      title = "Summary"
      source = resource.chapter.summary
    }
  }
}