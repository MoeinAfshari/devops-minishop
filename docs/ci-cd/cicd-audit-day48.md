# CI/CD Audit — Day 48

## 1. Scope

This report documents my review of the MiniShop CI/CD configuration and the local quality checks performed on the repository.

The following components were reviewed:

- `.github/workflows/ci.yml`
- `scripts/ci-local.sh`
- The Backend npm configuration
- The relevant Terraform and Docker Compose configurations, where applicable

I also created a local CI script:

```bash
./scripts/ci-local.sh
```

I run this script from the root of the Git repository.

The purpose of this audit is to identify the existing CI/CD checks, evaluate their results, and document missing or unverified checks.

## 2. Existing Workflow

The project currently has one GitHub Actions workflow:

```text
.github/workflows/ci.yml
```

### Workflow triggers

The workflow is triggered by:

- Push events to the `main` branch.
- Pull requests targeting the `main` branch.

### Jobs

The workflow contains the following jobs:

1. `backend-test`
2. `backend-docker-build`
3. `backend-publish`
4. `deploy-backend`

The `backend-publish` and `deploy-backend` jobs are restricted to push events on the `main` branch. Pull requests targeting `main` run the CI checks without running these deployment-related jobs.

The exact job dependencies and execution conditions should be reviewed through their `needs` and `if` definitions in the workflow file.

## 3. Local Quality Gate

I created a local CI script to run a set of repeatable checks before submitting changes.

The checks and their results are summarized below.

| Check | Execution status | Result | Notes |
|---|---|---|---|
| Git whitespace | PASS | Successful | No whitespace errors were reported. |
| Bash syntax | PASS | Successful | Bash syntax checks completed successfully. |
| ShellCheck | NOT VERIFIED | No confirmed result | ShellCheck was installed after an initial installation issue, but the check did not complete as expected. The exact error and exit code need further investigation. |
| Terraform formatting | PASS | Successful | Terraform formatting checks completed successfully. |
| Docker Compose configuration | PASS | Successful | Docker Compose configuration validation completed successfully. |
| GitHub Actions workflow lint | SKIP | Not executed | `actionlint` was unavailable because its installation was unsuccessful. |

**Important:** `SKIP` and `NOT VERIFIED` do not mean that a check passed. The ShellCheck and actionlint results must not be reported as successful.

## 4. Findings

### 4.1. ShellCheck

The ShellCheck installation initially encountered a problem. Although I attempted to install it, the corresponding check did not complete successfully.

The exact error message and exit code have not yet been recorded.

Further investigation is required to determine whether the problem is related to the installation, command availability, or the ShellCheck findings in the scripts.

### 4.2. actionlint

`actionlint` is not currently available in my local environment.

Therefore, the GitHub Actions workflow lint check was skipped.

I need to install and configure actionlint before this check can be considered part of the successfully executed local quality gate.

### 4.3. Backend tests

The Backend uses Jest as its test framework or test runner.

However, the number and coverage of the existing test files still need to be verified.

The current test coverage is not sufficient to demonstrate that all important Backend functionality works correctly.

Additional tests, especially Unit Tests and Integration Tests, are needed.

### 4.4. CI/CD coverage

The existing workflow contains separate jobs for testing, Docker image building, publishing, and deployment.

However, successful static checks and a limited number of application tests do not prove that the entire application is healthy.

The test coverage and the relationship between the CI and deployment jobs require further improvement and verification.

## 5. Missing Checks and Improvements

The following items require further work:

- Complete the ShellCheck installation and verify its execution.
- Install and configure actionlint.
- Verify the existing Jest test files and improve Backend test coverage.
- Add appropriate Unit Tests for important Backend functionality.
- Add Integration Tests for interactions between application components.
- Verify that required test failures cause the CI workflow to fail.
- Review the dependencies between the build, publish, and deployment jobs.

A skipped check must remain visible in the audit report until it has been successfully executed or intentionally excluded with a documented reason.

## 6. Security Review

### Secrets

Sensitive values are stored as GitHub Actions Secrets.

The workflow references these secrets by name rather than storing their actual values directly in the YAML file.

For example:

```yaml
${{ secrets.SECRET_NAME }}
```

The actual secret values are managed through GitHub repository or environment settings and must not be printed in workflow logs or committed to Git.

### GITHUB_TOKEN Permissions

The workflow uses `contents: read` permissions for repository access.

The current configuration also grants `packages: write` to deployment-related jobs.

This permission assignment needs a more detailed review:

- The `backend-publish` job needs `packages: write` if it publishes Docker images to GitHub Packages.
- The `deploy-backend` job should receive only the permissions required for deployment. If it only downloads an existing image, it may need `packages: read` rather than `packages: write`.

The permissions must be verified independently for each job.

### Pull Request Security

The workflow is triggered by `pull_request` events targeting the `main` branch.

The event type, token permissions, secret availability, and handling of pull requests from forks must be reviewed.

In particular, untrusted pull request code must not be executed in a workflow that exposes privileged credentials.

## 7. Safe Next Steps

The following improvements are planned:

1. Resolve the ShellCheck execution problem and confirm its final result.
2. Install actionlint and run it against `.github/workflows/ci.yml`.
3. Inspect the existing Jest configuration and test files.
4. Add meaningful Backend Unit Tests.
5. Add Integration Tests for important application interactions.
6. Review GitHub Actions job dependencies and `GITHUB_TOKEN` permissions.
7. Improve the separation between CI, image publishing, and deployment.
8. Investigate the network connectivity limitation affecting deployment to the local server.

These improvements should be implemented and verified incrementally rather than changing the entire workflow at once.

## 8. Limitations

The MiniShop deployment target is a local server.

The GitHub Actions deployment job cannot currently access this server because the runner does not have the required network connectivity to the local environment.

As a result, the `deploy-backend` job fails when it attempts to deploy the Backend to the local server.

This is currently a deployment environment and network connectivity limitation, rather than confirmed evidence of an application or Docker build problem.

Further investigation is needed to confirm the runner type, the exact connection error, and the network requirements.

A possible future solution is to use a dedicated self-hosted runner within the local network. Another option is to keep CI on GitHub-hosted runners and perform deployment manually from the local environment.

Any self-hosted runner used for deployment must be isolated, have limited permissions, and must not execute untrusted pull request code.

## 9. Conclusion

The Day 48 audit established a baseline for the current MiniShop CI/CD workflow and the local quality checks.

Several checks, including Git whitespace, Bash syntax, Terraform formatting, and Docker Compose configuration, completed successfully.

ShellCheck and actionlint still require verification.

The Backend test coverage also needs improvement, and deployment to the local server is currently limited by network connectivity from the GitHub Actions runner.

The next stage is to resolve these gaps and improve the reliability, security, and reproducibility of the MiniShop CI/CD pipeline.

