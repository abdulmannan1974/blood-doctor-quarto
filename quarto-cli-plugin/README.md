# Quarto CLI — Claude Code Plugin

A **100% coverage** capability pack for the [Quarto](https://quarto.org) CLI: every
command, output format, execution engine, project type, publishing provider,
extension mechanism, authoring feature and interactivity option — grounded in the
installed Quarto **1.9.x**.

## What's inside

| Component | Purpose |
|---|---|
| **Skill** `quarto-cli` | Master router. Auto-loads the right reference on demand. |
| **10 reference docs** | Commands · Formats · Engines · Projects · Authoring · Publishing · Extensions · Interactivity · Parameters/Cache/Freeze · Troubleshooting |
| **9 slash commands** | `/new` `/render` `/preview` `/publish` `/slides` `/manuscript` `/book` `/doctor` `/convert` |
| **Agent** `quarto-engineer` | End-to-end: scaffold → author → render → verify → publish |

## Install (local marketplace)

From an interactive Claude Code session, at the Quarto folder:

```
/plugin marketplace add "10_TOOLS_AND_APPLICATIONS/Quarto"
/plugin install quarto-cli@blood-doctor-quarto
```

Then the skill triggers automatically on Quarto tasks, and the slash commands appear
as `/quarto-cli:render`, `/quarto-cli:new`, etc.

## Engine paths on this machine

Pinned in the project `_environment` file (Drive-safe — packages live outside Drive):

- Python + Jupyter → `~/.venvs/quarto`
- Julia + Plots → `~/.juliaup` (`JULIA_PROJECT` set to the project)
- R + knitr → `~/Library/R/arm64/4.5/library`
- TinyTeX + Typst → LaTeX / Typst PDF
