---
description: Diagnose the Quarto environment — versions, engines, and fixes.
---
Run a full Quarto environment diagnosis. Load `skills/quarto-cli/references/10-troubleshooting.md`.

1. Run `quarto check` and report Pandoc/Typst/Chrome/LaTeX + each engine (R/Python/Julia) status.
2. Run `quarto --version` and `jupyter kernelspec list`.
3. For any failure, map it to the fix table in the troubleshooting reference and apply the fix (install into the correct library/venv/project env), then re-run `quarto check` to confirm green.
4. Summarise what works and what you fixed.
