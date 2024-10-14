resource "terminal" "shell" {
  title = "Vault terminal"

  target = resource.container.vault
  shell = "/bin/sh"
  user = "root"
  group = "root"
  prompt = "%%{%f%b%k%}$(build_prompt)"
  theme = "dracula"
  working_directory = "/root"
  #command = ["watch", "-n", "1", "ls -lha"]
}

resource "service" "vault_ui" {
  title = "Vault UI"

  target = resource.container.vault
  scheme = "http"
  port = 8200
  path = "/ui"
}

resource "editor" "code" {
  title = "Visual Studio Code"

  extensions = [
    "golang.go",
    "sdras.night-owl"
  ]

  theme = "Night Owl (No Italics)"
  settings = file("files/settings.json")
  
  workspace "assets" {
    directory = "files"
  }

  workspace "vault_config" {
    target = resource.container.vault
    directory = "/etc/vault.d"
  }
}

resource "note" "addendum" {
  title = "Addendum"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "note" "note2" {
  title = "Note 2"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "note" "note3" {
  title = "Note 3"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "note" "note4" {
  title = "Note 4"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "note" "note5" {
  title = "Note 5"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "note" "note6" {
  title = "Note 6"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "note" "note7" {
  title = "Note 7"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "note" "note8" {
  title = "Note 8"
  
  file = "notes/addendum.md"
  variables = {
    version = "0.12"
  }
}

resource "external_website" "iframe_same_window" {
  title = "Iframe website"

  url = "https://docs.instruqt.com"
}

resource "external_website" "iframe_new_window" {
  title = "Iframe website"

  url = "https://docs.instruqt.com"

  open_in_new_window = true
}

resource "virtual_browser" "virtual" {
  title = "Virtual browser website"

  url = "https://docs.instruqt.com"
  
  agent = "firefox"
}