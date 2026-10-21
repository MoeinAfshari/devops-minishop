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

