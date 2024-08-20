# Show state

In this section we will inspect individual resources in the Terraform state.

<instruqt-video id="o9LJasr3SS0"></instruqt-video>

The `terraform state show` command is used to show the attributes of a single resource in the state file that matches the given address.
This command requires an address that points to a single resource in the state. 
Addresses are in <a href="https://developer.hashicorp.com/terraform/cli/state/resource-addressing" target="_blank">resource addressing format</a>.

The output of `terraform state show` is intended for human consumption, not programmatic consumption. 

### Command-line flags

<instruqt-api-table>
  <instruqt-api-field name="state" type="string" required="false" value="terraform.tfstate">
    Path to the state file. Defaults to "terraform.tfstate". Ignored when remote state is used.
  </instruqt-api-field>
</instruqt-api-table>

<instruqt-task id="show_state">
  Show the state for the Docker container resource `vault`.
</instruqt-task>