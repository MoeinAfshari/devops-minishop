## Scenarios

### Scenario 1 - Wrong environment in the Plan

#### Situation (Incident)

The team expects the output to correspond to the `staging` environment, but the plan still indicates `development`.

#### Initial evidence (Symptoms)

- The default value iin `variables.tf` is set to `development`.
- The `staging.tfvars` file exists.
- The resource references `var.environment_name`.

#### Task (Investigation)

Investigate the cause and outline what evidence should be gathered to determine the root reason.

#### Constraint

Don't execute `apply`, and ensure no critical files are deleted or overwritten until the cause is identified.

#### Deliverable

Investigation commands, the primary hypothesis, and the method for verifying the findings.

#### Answer 

```Bash
cat staging.tfvars
terraform output
terraform state list
terraform state show local_file.minishop_status
```
Then:
```Bash
terraform fmt
terraform validate
terraform plan -var-file="staging.tfvars"
```
If the changes were ok:
```Bash
terraform apply -var-file="staging.tfvars"
```
And after apply:
```Bash
cat generated/minishop-lab-status.txt
terraform output
terraform state list
terraform state show local_file.minishop_status
```

### Scenario 2 - Provider version mismatch

Terraform shows different plans on two systems, and a collegue suggests that different provider versions are installed. 

#### Initial observations

The provider version range is defined in `versions.tf`. In one of the clones, the `.terraform.lock.hcl` file is missing. The output of `terraform init` differs between the two systems.

#### Task

Investigate the potential cause and explain how to make the provider version selection process more reproducible.

#### Constraints

Don't manually edit the lock file without a valid reason, and don't use `terraform init -upgrade` without prior investigation.

#### Deliverables

Provide the commands used for investigation, along with a method to verify that both systems have selected compatible provider versions.

#### Answer

1. Check in the two systems:
```Bash
terraform version
terraform providers
```
2. Check lock file:
```Bash
ls -la .terraform.lock.hcl
```
3. If you want both systems to use the same selected version, keep the lock file in Git and make sure both systems have received the same file. In CI, you can use this command to have Terraform throw an error if the lock needs to changed.
```Bash
terraform init -lockfile=readonly
```
4. If you want:
```Bash
terraform init -upgrade
```

### Scenario 3 - Unexpected Replacement

#### Scenario

A team member has changed the name of a resource within a Terrform file. Upon running `terraform plan`, Terraform proposed deletion the existing resource and creating  a new one whereas the team's sole intention was to rename it.

#### Your Task

Your task is to outline the troubleshooting steps. Explain what information you would examine within the configuration and state, how you would assess the risks associated with the proposed operation, and under what conditions you would proceed `terraform apply`.

##### Answer

```Bash
# Desired configuration
cat main.tf

# Actual file
ls -l generated/minishop-lab-status.txt
cat generated/minishop-lab-status.txt

# Recorded state
terraform state list
terraform state show local_file.minishop_status

# Proposed reconciliation
terraform plan
```
Next, if you are renaming a Terraform resource, don't automatically delete and recreate it. First determine whether this is only a resource-address change or whether its actual attributes also need changing. Use a moved block when appropriate, then verify the proposed actions in the plan.

For a repeatable apply workflow, use a saved plan:
```Bash
terraform fmt
terraform validate
terraform plan -out=tfplan
terraform show tfplan
terraform apply tfplan
```
This lets you inspect the actual saved plan before applying that specific plan. Afterward, check the file, the resource address, and the state again.

### Scenario 4 - Missing State on Another System

#### Scenario

A team member has received the MiniShop repository on another system. The Terraform files are there, but the terraform state list resource is not showing the expected one. A team member suggests running `terraform apply -auto-approve` immediately.

#### Your Task

Write a diagnostic program without running Apply. Check the current path, backend, workspace, state, and existence of the actual resource. Explain how you would prevent unwanted creation or replacement.

#### Answer

```Bash
git status
git check-ignore -v terraform.tfstate dev.tfvars
git ls-files '*.tfstate' '*.tfvars'
git rev-parse --show-toplevel
cd "$(git rev-parse --show-toplevel)"
cd infra/terraform/local-lab
pwd
ls -la
terraform state list
terraform state show local_file.minishop_status
ls -la generated/
terraform show
terraform output
cat generated/minishop-lab-status.txt
cat .gitignore
cat .terraform.lock.hcl
terraform plan
```
First, I find the problem and I try to solve it.

### Scenario 5 - Destructive Plan After Refactoring

#### Situation

A resource has been transfered from Root module to Child module.

#### Symptoms

Plan shows these changes:
```
local_file.minishop_status
    will be destroyed

module.status_file.local_file.status
    will be created
```
While the actual file still exists in the previous path.

#### Task

Specify what needs to be reviewed before applying and how you will decide whether the plan is acceptable.

#### Constraints

- The actual file should not be deleted or overwritten without reason. 
- The state should not be manipulated with destructive commands. 
- The decision should be provable with evidence. 

#### Expected output:

- Symptoms
- Investigation
- Possible Root Cause
- Safe Correction
- Verification

Evaluation criteria: Check order, correct address recognition, resource preservation, and use of Plan to verify the result.

#### Answer

#### Symptoms

When I run `terraform plan`, Terraform proposes destroying `local_file.mminishop_status` and creating `module.status_file.local_file.status`.

#### Investigation

First, I check the current working directory and verify that I am using the correct root module and workspace. Then I inspect the Terraform state, root ouputs, the existing generated file, and the relevant resource configurations.

I check whether the root module contains a correct moved block:

```Bash
moved {
from = local_file.minishop_status
  to   = module.status_file.local_file.status
}
```

I also verify the destination resource and investigate whether any attribute changes require replacement.

#### Possible root cause

If the resource address changed but the underlying resource remained the same, a missing or incorrect moved block could explain the unexpected destroy-and-create plan. However, a replacement may still be necessary if a resource attribute requires it.

#### Safe correction

I correct the configuration or moved block only after confirming the cause. Then I run:

```Bash
terraform fmt -recursive
terraform validate
terraform plan -out=/tmp/day46.tfplan
terraform show /tmp/day46.tfplan
```

I apply the saved plan only after confirming that its proposed operations are expected and safe:

```Bash
terraform apply /tmp/day46.tfplan
```

#### Verification

After applying the plan, I inspect the state and verify the new resource address:

```Bash
terraform state list
terraform state show module.status_file.local_file.status
terraform show
terraform output
```

I also verify the generated file's expected path, content, and permissions. I keep the moved block unless there is a specific, justified reason to remove it.

### Scenario 6 - Module Created a file in the wrong directory

#### Situation

Terraform runs successfully, but the output file is not in the expected path. 
Expected path:
```
infra/terraform/local-lab/generated/minishop-lab-status.txt
```
Observed path:
```
infra/terraform/local-lab/modules/status_file/
```

#### Task

Investigate the possible cause and identify the evidence necessary for a correct diagnosis.

#### Constraints

- Do not delete the previous file immediately. 
- Do not remove the resource from the state. 
- Changes should be limited and auditable.

#### Expected output

Explanation of the cause, configuration and state review, suggested correction, and verification method.

Evaluation criteria: Correct Path detection and prevention of creating a second Resource or losing the previous file.

#### Answer

#### Symptoms

The expected file path is:

```
infra/terraform/local-lab/generated/minishop-lab-status.txt
```

However, the file appears under the modules/status_file directory.

#### Investigation

I verify my working directory and inspect the root module and child module configurations. I check the resource's filename attribute in the configuration and state, and I inspect the relevant Terraform outputs.

I also verify the actual file paths and contents before making any changes.

#### Possible root cause

The child module may use `path.module` to construct the output path. This value points to the child module's directory, whereas `path.root` points to the root module's directory. I would confirm this by inspecting the actual configuration and the recorded filename.

#### Safe correction

If the diagnosis is confirmed, I update the configuration so that the resource uses the intended output path. For a reusable child module, I would consider passing the output path as an input variable from the root module.

Then I run:

```Bash
terraform tmt -recursive
terraform validate
terraform plan -out=/tmp/day46-path.tfplan
terraform show /tmp/day46-path.tfplan
```

I apply the saved plan only after verifying its proposed changes and confirming that the existing file's content will not be lost unexpectedlly.

#### Verification

After applying the plan, I verify the expected path from the root module directory:

```Bash
test -f generated/minishop-lab-status.txt \
  && echo "PASS: expected file exists" \
  || echo "FAIL: expected file is missing"

cat generated/minishop-lab-status.txt
stat generated/minishop-lab-status.txt
terraform output
terraform state show module.status_file.local_file.status
```

I confirm that the output and state refer to the expected file path, and that its content and permissions are correct. I remove an old file only after confirming that it is no longer needed and that deleting it is safe.

### Scenario 7 - Plan wants to replace database

#### Situation

In a Production environment, there is a Database managed by Terraform.
After changing the Configuration, the Plan indicates that the Resource needs to be replaced.
The team has noticed that prevent_destroy is enabled and Terraform is not allowing it to continue because of that.

#### Task

Prepare a brief incident report that includes the following:
- Signs of the issue
- Potential risks associated with implementing the change
- Information to be gathered from the plan and configuration
- Required assessments prior to making any decisions
- Conditions under which operations must remain halted
- Evidence that must be documented before approving any action

#### Limitations

- Don't remove prevent_destroy just to get around the error.
- Don't assume that every Replace is necessarily a Lifecycle problem.
- Don't assume that create_before_destroy is always appropriate for the Database.
- Don't perform any operations on the real Database.

Assessment criteria: Your ability to recognize risk, separate cause from symptom, make safe decisions, and document evidence is considered.

#### Answer

Incident: After a configuration change, Terraform proposed replacing a managed database. The resource has prevent_destroy = true, so Terraform rejected the destructive plan. No changes have been applied yet.

Potential impact: Replacing the database could cause downtime or data loss. I must not disable prevent_destroy without understanding why the replacement is required.

Investigation: I would inspect the plan, identify the argument that requires replacement, review the relevant configuration and dependencies, and inspect the database resource in the Terraform state. I would also investigate why prevent_destroy was enabled and verify the backup and recovery procedures.
```Bash
terraform state list
terraform state show DATABASE_RESOURCE_ADDRESS
terraform plan
```

Evidence: I would record the resource address, the relevant state attributes, the proposed changes, the working directory, and the intended Terraform root module. I would also verify the backup status and the expected application impact.

Decision: I would not apply the plan while the cause and impact remain unclear. If the replacement is necessary, I would prepare an approved change plan, verify recovery options, and remove the lifecycle protection only when the operation is understood and authorized.

### Scenario 8 - The file exists but Terraform doesn't know it

#### Situation

An operational tool has created a file on the system.
It is later discovered that the corresponding Resource does not exist in the Terraform State.
When the team reviews the Plan, they find that Terraform is planning to re-manage the same path.

#### Task

Design a review and reconciliation process that includes the following:
- Reviewing file paths and content
- Comparing configuration and state
- Assessing the actual impact of the plan
- Determining the disposition of existing files
- Evaluating the feasibility of using "import" (subject to support by the relevant provider)
- Documenting the final decision and supporting evidence

#### Limitations

- Don't delete an existing file without checking.
- Don't assume that Import is supported for all Resources.
- Don't blur state without understanding the effect of changing any command.
- Don't execute a modifier just to achieve an apparently successful output.

Evaluation Criteria: The evaluation is based on the quality of the review, risk identification, soundness of reasoning, and safety of the recovery process.

#### Answer

First, I would verify the repository root, the Terraform root module, and the exact path of the existing file. I would inspect its content, permissions, and checksum before making any changes.

Next, I would review the resource configuration, especially its filename argument, and check the current Terraform state using terraform state list. If the resource is present, I would inspect its recorded attributes with terraform state show.

If the file exists but the resource is missing from the state, I would inspect the plan carefully. A local_file resource may be proposed for creation, and applying that plan can overwrite the existing file with the content defined in the configuration.

I would not apply the plan until I had confirmed the intended file content and understood the consequences. I would preserve a backup when appropriate and verify whether the provider supports importing the existing resource.

I would remove the old file only if it is a separate file that is no longer needed, and only after verifying the replacement and confirming that deletion is safe.

```Bash
pwd
realpath generated/file_name.txt
stat generated/file_name.txt
sha256sum generated/file_name.txt
terraform state list
terraform state show RESOURCE_ADDRESS
```

#### What's Import?

In Terraform, Import is a way to introduce an existing resource to Terraform to register it in the state, without having to create that resource from scratch just to be registered.

For example, in sources that support it, the general command looks like this:
```Bash
terraform import RESOURCE_ADDRESS RESOURCE_ID
```
The meaning of the two parts: 
- `RESOURCE_ADDRESS`: The address that the Resource should be managed with in Terraform. 
- `RESOURCE_ID`: The identifier that the Provider uses to identify the existing Resource.

Import depends on the provider's support and the resource type; it is not available for all resources.

