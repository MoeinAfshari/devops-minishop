#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    printf 'ERROR: run this script inside a Git repository.\n' >&2
    exit 2
}

cd "$ROOT_DIR" || exit

passed=0
failed=0
skipped=0

run_check() {
    local name="$1"
    shift

    local rc=0

    printf '\n==> %s\n' "$name"

    "$@" || rc=$?

    case "$rc" in
        0)
            printf 'PASS: %s\n' "$name"
            passed=$((passed + 1))
            ;;
        2)
            printf 'SKIP: %s\n' "$name"
            skipped=$((skipped + 1))
            ;;
        *)
            printf 'FAIL: %s (exit code: %s)\n' "$name" "$rc" >&2
            failed=$((failed + 1))
            ;;
    esac
}

check_git_diff() {
    git diff --check || return 1
    git diff --cached --check || return 1
}

check_bash_syntax() {
    local -a files=()
    local file

    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(
        find . -type f -name '*.sh' \
            -not -path './.git/*' \
            -not -path '*/.terraform/*' \
            -not -path '*/node_modules/*' \
            -not -path '*/vendor/*' \
            -print0
    )

    if (( ${#files[@]} == 0 )); then
        printf 'No Bash scripts found.\n'
        return 2
    fi

    for file in "${files[@]}"; do
        printf 'Checking Bash syntax: %s\n' "$file"
        bash -n "$file" || return 1
    done
}

check_shellcheck() {
    local -a files=()
    local file

    if ! command -v shellcheck >/dev/null 2>&1; then
        printf 'ShellCheck is not installed.\n'
        return 2
    fi

    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(
        find . -type f -name '*.sh' \
            -not -path './.git/*' \
            -not -path '*/.terraform/*' \
            -not -path '*/node_modules/*' \
            -not -path '*/vendor/*' \
            -print0
    )

    if (( ${#files[@]} == 0 )); then
        printf 'No Bash scripts found.\n'
        return 2
    fi

    shellcheck "${files[@]}"
}

check_terraform_format() {
    if ! find . -type f -name '*.tf' \
        -not -path './.git/*' \
        -not -path '*/.terraform/*' \
        -print -quit | grep -q .; then
        printf 'No Terraform files found.\n'
        return 2
    fi

    if ! command -v terraform >/dev/null 2>&1; then
        printf 'Terraform files exist, but Terraform is unavailable.\n'
        return 1
    fi

    terraform fmt -check -recursive
}

check_compose_config() {
    local -a files=()
    local file
    local compose_dir
    local compose_name

    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(
        find . -type f \
            \( -name 'compose.yaml' \
            -o -name 'compose.yml' \
            -o -name 'docker-compose.yaml' \
            -o -name 'docker-compose.yml' \) \
            -not -path './.git/*' \
            -not -path '*/node_modules/*' \
            -not -path '*/vendor/*' \
            -print0
    )

    if (( ${#files[@]} == 0 )); then
        printf 'No Docker Compose files found.\n'
        return 2
    fi

    if (( ${#files[@]} > 1 )); then
        printf 'Multiple Compose files found.\n'
        printf 'Validate the intended Compose file combination manually.\n'
        return 2
    fi

    if ! command -v docker >/dev/null 2>&1; then
        printf 'Docker is unavailable.\n'
        return 1
    fi

    docker compose version >/dev/null 2>&1 || {
        printf 'Docker Compose is unavailable.\n'
        return 1
    }

    compose_dir="$(dirname "${files[0]}")"
    compose_name="$(basename "${files[0]}")"

    (
        cd "$compose_dir" &&
        docker compose -f "$compose_name" config --quiet
    )
}

check_actionlint() {
    local -a files=()
    local file

    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(
        find .github/workflows -maxdepth 1 -type f \
            \( -name '*.yml' -o -name '*.yaml' \) \
            -print0 2>/dev/null
    )

    if (( ${#files[@]} == 0 )); then
        printf 'No GitHub Actions workflow files found.\n'
        return 2
    fi

    if ! command -v actionlint >/dev/null 2>&1; then
        printf 'actionlint is not installed.\n'
        return 2
    fi

    actionlint "${files[@]}"
}

run_check "Git whitespace checks" check_git_diff
run_check "Bash syntax" check_bash_syntax
run_check "ShellCheck" check_shellcheck
run_check "Terraform formatting" check_terraform_format
run_check "Docker Compose configuration" check_compose_config
run_check "GitHub Actions workflow lint" check_actionlint

printf '\n====================================\n'
printf 'Local CI Quality Gate Summary\n'
printf 'PASS: %s\n' "$passed"
printf 'FAIL: %s\n' "$failed"
printf 'SKIP: %s\n' "$skipped"
printf '====================================\n'

printf 'Note: SKIP does not mean PASS.\n'
printf 'Run the documented application tests separately.\n'

if (( failed > 0 )); then
    exit 1
fi

exit 0
