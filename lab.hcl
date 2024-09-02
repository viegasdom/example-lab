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

    instructions {
      panel = "main"
    }
  }

  layout "original" {
    source = module.layouts.output.original

    tab "terminal-a" {
      panel = "left"
      target = resource.terminal.shell
    }

    // tab "addendum" {
    //   panel = "left"
    //   target = resource.note.addendum
    // }

    instructions {
      panel = "right"
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
      layout = "minimal"
    }

    chapter "installation" {
      title = "Installation"
      source = resource.chapter.installation
      layout = "original"
    }

    chapter "workflow" {
      title = "Workflow"
      source = resource.chapter.workflow
      layout = "original"
    }

    chapter "providers" {
      title = "Providers"
      source = resource.chapter.providers
      layout = "original"
    }

    chapter "state" {
      title = "State"
      source = resource.chapter.state
      layout = "default"
    }

    chapter "summary" {
      title = "Summary"
      source = resource.chapter.summary
      layout = "minimal"
    }
  }
}