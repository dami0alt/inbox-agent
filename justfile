# List available recipes when running plain `just`
default:
    @just --list

# Lint the code (ruff)
lint:
    uv run ruff check .

# Auto-format the code (ruff)
fmt:
    uv run ruff format .

# Check formatting without changing files (used by CI)
fmt-check:
    uv run ruff format --check .

# Static type check (mypy)
typecheck:
    uv run mypy src

# Run the test suite (pytest)
test:
    uv run pytest

# Run the agent entry point
run:
    uv run inbox-agent

# Everything CI should check, in one command
check: lint fmt-check typecheck test
