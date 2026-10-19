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

