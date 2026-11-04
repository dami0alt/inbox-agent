# inbox-agent

A personal email triage agent, built as a learning project.

- **Now:** a daily job that reads a mailbox over IMAP, classifies the
  messages and sends a morning report (email and/or Slack).
- **Later:** an MCP server over the same mail code, to chat with an agent
  about the inbox and eventually let it act (in tiers, with human
  confirmation for anything irreversible).

Status: early development. See the
[milestones](https://github.com/dami0alt/inbox-agent/milestones) for the plan.

## Requirements

- Python 3.12
- [uv](https://docs.astral.sh/uv/) for dependencies and virtual environments
- [just](https://just.systems/) as the task runner

## Setup

```bash
git clone https://github.com/dami0alt/inbox-agent.git
cd inbox-agent
uv sync
```

`uv sync` creates `.venv/` and installs the exact versions from `uv.lock`,
including the dev tools.

## Common tasks

| Command          | What it does                                  |
| ---------------- | --------------------------------------------- |
| `just`           | List all recipes                              |
| `just lint`      | Lint with ruff                                |
| `just fmt`       | Format the code with ruff                     |
| `just fmt-check` | Check formatting without changing files       |
| `just typecheck` | Static type check with mypy                   |
| `just test`      | Run the tests with pytest                     |
| `just check`     | Everything above, as CI runs it               |
| `just run`       | Run the entry point                           |

## Project layout

```
src/inbox_agent/
  core/        mail access and models (no Claude, no MCP)
  agent/       triage logic and daily report
  mcp_server/  MCP tools over core
  jobs/        entry points (e.g. the scheduled daily job)
tests/         unit tests, with fake emails in tests/fixtures/
```

Dependencies point inwards: everything may depend on `core`, `core`
depends on nothing else in the project.

## Configuration

Settings come from environment variables. For local development copy
`.env.example` to `.env` and fill it in; `.env` is git-ignored.

## Safety

Emails are untrusted input and a prompt-injection risk, so the agent starts
read-only and tests only use invented emails. Never commit secrets or real
emails: this repository is public.
