---
description: Convert between .qmd and .ipynb (and inspect project metadata).
argument-hint: "[path]"
---
Convert **$ARGUMENTS**. Load `references/01-commands.md`.
`quarto convert file.qmd` → `.ipynb`, or `quarto convert file.ipynb` → `.qmd` (`--with-ids` to keep cell ids, `-o` for output path).
For tooling/metadata use `quarto inspect <path>` (JSON). Confirm the converted file opens/renders.
