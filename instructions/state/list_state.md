# List state

In this section we will inspect the resources Terraform has created.

<instruqt-video id="j4FYabDFYiQ"></instruqt-video>

The `terraform state list` command is used to list all resources in the state file matching the given addresses (if any). 
If no addresses are given, all resources are listed.

The resources listed are sorted according to module depth order followed by alphabetical. 
This means that resources that are in your immediate configuration are listed first, and resources that are more deeply nested within modules are listed last.

For complex infrastructures, the state can contain thousands of resources. 
To filter these, provide one or more patterns to the command. 
Patterns are in <a href="https://developer.hashicorp.com/terraform/cli/state/resource-addressing" target="_blank">resource addressing format</a>.

### Command-line flags

<instruqt-api-table>
  <instruqt-api-field name="state" type="string" required="false" value="terraform.tfstate">
    Path to the state file. Defaults to "terraform.tfstate". Ignored when remote state is used.
  </instruqt-api-field>
  <instruqt-api-field name="id" type="string" required="false" value="">
    ID of resources to show. Ignored when unset.
  </instruqt-api-field>
</instruqt-api-table>

<instruqt-task id="list_state">
  List all the resources in the state.
</instruqt-task>