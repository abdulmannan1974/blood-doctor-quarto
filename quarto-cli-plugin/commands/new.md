---
description: Scaffold a Quarto project, document, or extension.
argument-hint: "[document|website|book|manuscript|slides|extension] [name]"
---
Scaffold a new Quarto artifact of type: **$1** named **$2** (ask if missing).
Load `skills/quarto-cli/references/04-projects.md` (and `02-formats.md` for a single doc).

- document → a `.qmd` with sensible YAML for the requested format(s).
- website/book/manuscript → `quarto create project <type> <name> --no-open --no-prompt`, then tailor `_quarto.yml`.
- slides → a `revealjs` `.qmd` (see `/quarto-cli:slides`).
- extension → `quarto create extension <kind>` (shortcode/filter/format/journal/revealjs-plugin).

Ensure engine env is respected (project `_environment`). Render once to verify it builds, then report the paths.
