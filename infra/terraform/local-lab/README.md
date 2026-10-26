## Terraform Practice Lab

This repository contains a local Terraform practice lab. I uses the hashicorp/local provider to create and manage a text file without requiring a cloud accouont.

### Lab Purpose

The goal of this lab is to practice Terraform fundamentals, including:
- Input variables and validation
- Local values and outputs
- Resource addresses and state inspection
- Plan review and drift detection
- Git hygiene and state safety

### Repository Structure 

```
.
├── .gitignore
├── .terraform.lock.hcl
├── dev.tfvars.example
├── main.tf
├── outputs.tf
├── README.md
├── variables.tf
└── versions.tf
```
This tree shows the project files intended to be tracked in Git. Generated files, local state files, and downloaded provider files are excluded.

### Requirements
    
- Terraform CLI
- The hashicorp/local provider
- A local Linux environment

The provider must be available to Terraform during initialization, either through the configured provider installation source or an existing local installation.

### Initialize and Validate

Run these commands from the Terraform lab directory:
```Bash
terraform init
terraform fmt
terraform validate
```

- `terraform init` initializes the working directory and installs the required providers.
- `terraform fmt` formats Terraform configuration files.
- `terraform validate` checks the configuration for syntax and consistency errors.

### Input Variables

Copy the example variables file before creating your local input file:
```Bash
cp dev.tfvars.example dev.tfvars
```
Edit `dev.tfvars` with the input values for your environment.
Run a plan using those values:
```Bash
terraform plan -var-file="dev.tfvars"
```
The `dev.tfvars` file is not automatically loaded by terraform. It must be specified with -var-file, unless the file is renamed to a supported automatically loaded filename.
Use the same input file when applying the reviewed configuration:
```Bash
terraform apply -var-file="dev.tfvars"
```
Review the plan before confirming the apply operation.

### Inspect Terraform State

List the resource addresses recorded in the current state:
```Bash
terraform state list
```
Inspect the MiniShop status resource:
```Bash
terraform state show local_file.minishop_status
```
Display the current state:
```Bash
terraform show
```
Display the configured outputs:
```Bash
terraform output
```
The state file records information Terraform uses to manage resources. It's not a PostgreSQL database backup.

### Check the Generated File

Display the generated file:
```Bash
cat generated/minishop-lab-status.txt
```
Compare its actual content with the expected content defined by the Terraform configuration.

### Drift Detection

Drift occurs when the real resource differs from the expected configuration.

Use a plan to inspect the proposed changes:
```Bash
terraform plan -var-file="dev.tfvars"
```
Review the plan carefully. Check whether Terraform proposes creation, an in-place update, deletion, or replacement.

Do not run terraform apply if the proposed changes are unexpected. Investigate the configuration, resource address, state, and real resource first.

If the plan contains only expected changes, apply them with the same input file:
```Bash
terraform apply -var-file="dev.tfvars"
```
After applying, verify the result:
```Bash
cat generated/minishop-lab-status.txt
terraform state list
terraform state show local_file.minishop_status
```

### Git Hygiene

The following local files and directories should be excluded from Git:
```
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
*.tfvars
*.tfvars.json
generated/
```
Keep `.terraform.lock.hcl` under version control. It records the selected provider versions and checksums.

Commit `dev.tfvars.example` as a sample configuration file, but do not commit the actual `dev.tfvars` file if it may contain sensitive values.

Never commit Terraform state files, state backups, or saved plan files to a public repository.

### Troubleshooting

If Terraform behaves unexpectedly, follow this procedure:

1. Confirm the current repository path.
2. Check the current Git status.
3. List the resource addresses recorded in state.
4. Inspect the expected resource in the configuration.
5. Compare the configuration and real resource with the proposed plan.
6. Investigate unexpected deletion or replacement before applying any changes.

Useful commands:
```Bash
git rev-parse --show-toplevel
git status --short
terraform state list
terraform state show local_file.minishop_status
cat main.tf
cat generated/minishop-lab-status.txt
terraform plan -var-file="dev.tfvars"
```
Only apply changes after reviewing the plan and confirming that the proposed operations are expected.

### Learning Outcomes

After completing this lab, I should be able to:

- Define and validate Terraform input variables.
- Use local values and outputs.
- Inspect Terraform state and resource addresses.
- Review plans before applying changes.
- Recognize potential drift between configuration and real resources.
- Keep local state files and sensitive inputs out of Git.

### Root & Child modules

#### Purpose of Root Module and Child Module 

#### Module Responsibilities Related to State File 

#### Module Variables and Outputs 

#### Reason for Using Moved Block 

#### Init, Plan and Apply Execution Method 

#### File Verification Method and State
