resource "lab" "example" {
  title = "Example Lab"
  description = "This is an example lab."
  tags = ["example", "lab"] 
  languages = ["en_US", "es_ES"]
  
  settings {
    theme = "modern_dark"

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
      panel = "instructions"
    }
  }

  layout "original" {
    source = module.layouts.output.original

    tab "terminal-a" {
      panel = "sandbox"
      target = resource.terminal.shell
    }

    tab "addendum" {
      panel = "sandbox"
      target = resource.note.addendum
    }

    tab "docs_same" {
      panel = "sandbox"
      target = resource.external_website.iframe_same_window
    }

    tab "docs_new" {
      panel = "sandbox"
      target = resource.external_website.iframe_new_window
    }

    tab "editor" {
      panel = "sandbox"
      target = resource.editor.code
    }

    instructions {
      panel = "instructions"
    }
  }

  layout "complex" {
    source = module.layouts.output.complex

    tab "terminal-a" {
      panel = "sandbox_top"
      target = resource.terminal.shell
    }

    tab "editor" {
      panel = "sandbox_top"
      target = resource.editor.code
    }

    tab "service" {
      panel = "sandbox_bottom"
      target = resource.service.vault_ui
    }

    instructions {
      panel = "instructions"
    }
  }

  layout "stress" {
    source = module.layouts.output.stress

    instructions {
      panel = "left_top"
    }

    tab "note4" {
      panel = "left_top"
      target = resource.note.note4
    }

    tab "note2" {
      panel = "left_bottom_left"
      target = resource.note.note2
    }

    tab "note3" {
      panel = "left_bottom_right"
      target = resource.note.note3
    }

    tab "note5" {
      panel = "center_top_left"
      target = resource.note.note5
    }

    tab "note6" {
      panel = "center_top_right"
      target = resource.note.note6
    }

    tab "note7" {
      panel = "center_bottom"
      target = resource.note.note7
    }

    tab "note8" {
      panel = "center_small"
      target = resource.note.note8
    }

    tab "terminal-a" {
      panel = "right_top"
      target = resource.terminal.shell
    }

    tab "addendum" {
      panel = "right_bottom_left"
      target = resource.note.addendum
    }

    tab "docs_same" {
      panel = "right_bottom_right"
      target = resource.external_website.iframe_same_window
    }

    tab "docs_new" {
      panel = "right_bottom_right"
      target = resource.external_website.iframe_new_window
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
      layout = "original"
    }

    chapter "summary" {
      title = "Summary"
      source = resource.chapter.summary
      layout = "minimal"
    }
  }
}