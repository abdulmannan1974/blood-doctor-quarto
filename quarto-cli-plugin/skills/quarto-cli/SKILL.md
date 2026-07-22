---
name: quarto-cli
description: Complete Quarto CLI capability pack. Use for ANY Quarto task — rendering documents, building websites/books/manuscripts, reveal.js slides, executing Python/R/Julia/Observable code, cross-references, citations, callouts, diagrams, parameterised reports, caching/freeze, extensions/shortcodes/filters, brand theming, and publishing to GitHub Pages/Netlify/Quarto Pub/Posit Connect/Confluence/Hugging Face. Triggers on "quarto", ".qmd", "render to pdf/html/docx/revealjs", "quarto website/book/manuscript", "quarto publish", "executable document", "reproducible report".
---

# Quarto CLI — Master Skill

Quarto is an open-source scientific and technical publishing system built on Pandoc.
This skill covers **100%** of the CLI and its capabilities. Load the specific
reference for the task at hand — do not guess flag names, read them.

## Reference index — read the one you need

| When the task is about… | Read |
|---|---|
| Any CLI command / flag (render, preview, create, publish, convert, call…) | `references/01-commands.md` |
| Choosing/config an **output format** (html, pdf, docx, revealjs, typst, beamer, epub, gfm…) | `references/02-formats.md` |
| **Executing code** — Python, R, Julia, Observable; kernels, engine selection | `references/03-engines.md` |
| **Project types** — website, book, manuscript; `_quarto.yml` structure | `references/04-projects.md` |
| **Authoring** — cross-refs, citations, figures, tables, callouts, tabsets, divs, math, diagrams | `references/05-authoring.md` |
| **Publishing** — gh-pages, netlify, quarto-pub, connect, confluence, huggingface, CI/CD | `references/06-publishing.md` |
| **Extensions** — shortcodes, filters, custom formats, journals, revealjs plugins, brand, templates | `references/07-extensions.md` |
| **Interactivity** — Observable JS, Shiny, widgets, htmlwidgets/ipywidgets | `references/08-interactivity.md` |
| **Parameters, caching, freeze**, incremental render, daemon | `references/09-parameters-cache-freeze.md` |
| **Environment setup & errors** (this machine's engine paths, real fixes) | `references/10-troubleshooting.md` |

## Golden rules

1. **Read the CLI, don't guess.** `quarto <cmd> --help` is authoritative. `quarto check` verifies engines. `quarto capabilities` (via `quarto call`) lists what's available.
2. **HTML always works; PDF needs Typst (bundled) or LaTeX (TinyTeX).** Prefer `format: typst` for PDF when no LaTeX-specific template is needed.
3. **One source, many outputs.** A single `.qmd` renders to HTML + PDF + DOCX + revealjs by listing them under `format:`.
4. **Reproducibility:** use `freeze` for published sites, `cache` for slow chunks, and pin package environments outside any cloud-synced folder.
5. **Verify before claiming done:** render, check exit code, confirm the output file exists and contains expected elements.

## Engine setup on this machine (Drive-safe)

Packages live **outside** Google Drive; paths pinned in the project `_environment`:
`QUARTO_PYTHON=~/.venvs/quarto/bin/python` · `QUARTO_JULIA=~/.juliaup/bin/julia` ·
`JULIA_PROJECT=<project dir>` · R library `~/Library/R/arm64/4.5/library`.
See `references/10-troubleshooting.md`.
