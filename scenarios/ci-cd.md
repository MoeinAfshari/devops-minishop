## Scenarios

### Production Scenario 1 - Local checks pass, CI fails

Issue Type: Troubleshooting

#### Context

A change has been made to MiniShop and verified on a local Ubuntu machine; all tests passed.

However, the same commit fails in the CI environment.

The logs indicate that a command exited with a non-zero exit code.

#### Task

Develop a troubleshooting plan that covers the following steps:

1. Identify the specific step that failed.
2. Examine the command that was executed.
3. Compare tool versions between the local environment and the CI runner.
4. Verify environment variables and required files.
5. Check for discrepancies in the working directory.
6. Reproduce the error locally.
7. Document the root cause and verify the fix.

#### Constraints

- Do not output actual secrets in the logs.
- Do not simply remove a check just to make the pipeline pass.
- Do not attribute the issue to the CI environment without first investigating potential environmental differences.

#### Answer

First, I inspect the failed workflow run and identify the exact job and step that failed. I read the logs and find the first meaningful error message instead of focusing only on the final exit code.

Then, I identify the commit SHA, runner image, Node.js version, npm version, working directory, and required environment variables.

I create a separate Git worktree using the same commit and run the exact commands from the failed job locally. For example, I run npm ci, npm test, and npm run lint from the same working directory and with the same Node.js version used in GitHub Actions.

If the error cannot be reproduced locally, I investigate environmental differences such as file permissions, environment variables, network access, and runner configuration. I can also use act to simulate GitHub Actions jobs locally, while remembering that its environment is not identical to a GitHub-hosted runner.

After identifying and fixing the root cause, I run the checks again locally and verify the result in GitHub Actions.

```Bash
git fetch origin
git worktree add --detach ../minishop-ci-debug COMMIT_SHA
cd ../minishop-ci-debug
git status
git rev-parse HEAD
cd backend
node --version
npm --version
npm ci
npm test
npm run lint

docker info
act -l -W .github/workflows/ci.yml
act pull_request \
  -W .github/workflows/ci.yml \
  -j backend-test
act pull_request \
  -W .github/workflows/ci.yml \
  -j backend-docker-build
```
COMMIT_SHA is failed commit.

For more details in the GitHub Actions, create a repository variable or secret as:
```
ACTIONS_STEP_DEBUG=true
```
Or:
```
ACTIONS_RUNNER_DEBUG=true
```
```
GitHub Logs → Same Commit → Same Commands → Local Reproduction → Root Cause → Fix → GitHub Verification.
```

### Production Scenario 2 - Deployment triggered too early

Topic: CI/CD Safety

#### Scenario

In a hypothetical workflow, the deployment stage is executed following a push to a branch. A change has been reviewed and implemented.
Do not perform an actual deployment.

#### Task

Develop a review checklist that determines:

- What are the workflow triggers?
- Is a branch filter specified?
- Does the deployment job depend on the success of the CI jobs?
- Are the permissions excessive (i.e., broader than necessary)?
- Are secrets used only in the jobs that require them?
- What changes are needed to decouple CI from deployment?

#### Constraints

- For testing purposes, modify a real secret or credential.
- Do not execute an actual deployment.
- Modify the trigger by intentionally removing parts of the workflow.

#### Answer

I do not need to create a separate script for this investigation. I inspect the existing `.github/workflows/ci.yml` file.

I review the workflow triggers, job-level conditions, needs dependencies, permissions, environments, and secret references.

I verify that the deployment job depends on the successful completion of the required test, build, and publishing jobs. I also check that deployment runs only for the intended push event on the main branch.

Finally, I verify that the workflow does not bypass failed checks through inappropriate conditions such as `always()` or unnecessary `continue-on-error` settings.

