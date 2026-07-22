---
description: Render a Quarto document/project to one or more formats and verify.
argument-hint: "[path] [--to html,pdf,docx,revealjs,typst]"
---
Render **$ARGUMENTS** (default: current project). Load `references/01-commands.md` + `02-formats.md`.

1. Confirm the target format(s) are configured; add them to YAML `format:` if needed.
2. Run `quarto render $ARGUMENTS` (export `QUARTO_PYTHON`/`QUARTO_JULIA`/`JULIA_PROJECT` if not already via `_environment`).
3. Check exit code = 0; confirm each output file exists and contains expected elements (figures, tables, refs).
4. If PDF fails on LaTeX, offer `format: typst`. Report output paths and any warnings.
