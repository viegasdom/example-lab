variable "vm_image" {
  default = "/tmp/ubuntu-cloud.img"
}

variable "disable_vm" {
  default = true
}

variable "terraform_target" {
  default = resource.container.ubuntu
}