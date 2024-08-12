resource "terminal" "shell" {
  title = "Vault terminal"

  target = resource.container.vault
  shell = "/usr/bin/zsh"
  user = "root"
  group = "root"
  prompt = "%%{%f%b%k%}$(build_prompt)"
  theme = "dracula"
  working_directory = "/app"
	command = ["watch", "-n", "1", "ls -lha"]
}

resource "service" "vault_ui" {
  title = "Vault UI"

	target = resource.container.vault
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
  settings = file("assets/settings.json")
  
	workspace "assets" {
    directory = "assets"
  }

  workspace "vault_config" {
    target = resource.container.vault
    directory = "/etc/vault.d"
  }
}

resource "note" "addendum" {
  title = "Addendum"
  
	file = "assets/notes/addendum.md"
	variables = {
		version = "0.12"
	}
}