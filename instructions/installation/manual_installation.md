# Manual installation

In this section we will install the Terraform CLI.

<instruqt-video id="BFZVfwFD9cs"></instruqt-video>

Terraform comes in a number of ways to use it. You have got the ability to use the CLI, you can use the cloud hosted Terraform Cloud and there is the privately managed Terraform Enterprise.
For the purposes of this course we are using the opensource Terraform CLI.

The command line interface to Terraform is the terraform command, which accepts a variety of subcommands such as terraform init or terraform plan.
We refer to the `terraform` command line tool as "Terraform CLI". This terminology is often used to distinguish it from other components you might use in the Terraform product family, such as Terraform Cloud or the various Terraform providers, which are developed and released separately from Terraform CLI.

Open the <instruqt-switch-tab-button id="docs_same">Documentation</instruqt-switch-tab-button> tab.

To use Terraform you will need to install it. HashiCorp distributes Terraform as a binary package. You can also install Terraform using popular package managers for the different operating systems.
For the exercises, we are going to install Terraform manually.

To install Terraform manually, go over to the Terraform <a href="https://developer.hashicorp.com/terraform/downloads?product_intent=terraform" target="_blank">downloads</a> page and find the appropriate package for your system and download it as a zip archive.
From the command line, we can download the package by using either curl or wget.

<instruqt-code-group copy="true" run="true">
  <instruqt-code title="wget" language="shell">
    wget -O terraform.zip <download url>
  </instruqt-code>
  <instruqt-code title="curl" language="shell">
    curl -L -o terraform.zip <download url>
  </instruqt-code>
</instruqt-code-group>

After downloading Terraform, you can unzip the package using `unzip terraform.zip`. 
Terraform runs as a single binary named `terraform`, so any other files in the package can be safely removed and Terraform will still function.

To be able to run terraform from any location, ensure that the terraform binary is available on the <a href="https://en.wikipedia.org/wiki/PATH_(variable)" target="_blank">PATH</a>. 
You can print a colon-separated list of locations in your PATH by executing `echo $PATH`.
Move the Terraform binary to one of the listed locations e.g. `mv terraform /usr/local/bin/`.

<instruqt-task id="manual_installation">
  Install the latest version of Terraform for <a href="https://www.google.com">hi</a> Linux (AMD64) by downloading it from the [downloads](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform) page and installing it on the PATH!
</instruqt-task>
