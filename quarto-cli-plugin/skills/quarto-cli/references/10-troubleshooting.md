# Quarto — Environment & Troubleshooting (this machine + general)

Run `quarto check` FIRST whenever anything is off — it verifies Pandoc, Typst, Chrome,
LaTeX, and each engine (R/Python/Julia) with a live render.

## Engine setup on THIS machine (Drive-safe)
Packages live OUTSIDE Google Drive (Drive would sync thousands of files). Pinned in
the project `_environment` (auto-read by every `quarto` command):
```
QUARTO_PYTHON=~/.venvs/quarto/bin/python
QUARTO_JULIA=~/.juliaup/bin/julia
JULIA_PROJECT=<the project directory>
```
- **Python:** venv at `~/.venvs/quarto` (numpy/scipy/pandas/matplotlib/jupyter). Homebrew
  Python is PEP 668 "externally managed" — do NOT pip-install into it; use the venv.
- **R:** personal library `~/Library/R/arm64/4.5/library` (system lib is not writable —
  install there: `Rscript -e '.libPaths("~/Library/R/arm64/4.5/library"); install.packages("knitr", lib="~/Library/R/arm64/4.5/library")'`).
- **Julia:** juliaup at `~/.juliaup`; packages in the **project-local** `Project.toml`
  (`julia --project=. -e 'using Pkg; Pkg.add("Plots")'`).

## Common errors → fixes
| Symptom | Fix |
|---|---|
| Julia `Package X not found in current path` | Runner uses the project env, not the global depot. `julia --project=. -e 'using Pkg; Pkg.add("X")'` and set `JULIA_PROJECT`. |
| Julia GR plot error on headless render | `ENV["GKSwstype"]="100"` before `gr()`. |
| Julia `worker is busy` / stale state | `pkill -f quartonotebookrunner`, then re-render. |
| R `knitr not available` | Install into the personal library (see above), not system. |
| Python `externally-managed-environment` (PEP 668) | Use `~/.venvs/quarto`, not Homebrew Python. |
| PDF fails, `pdflatex not found` | `quarto install tinytex` — or switch `format: pdf` → `format: typst` (no LaTeX). |
| Mermaid comes out coloured/branded | Set `mermaid: theme: neutral` and `$primary` in the SCSS; per-node `style X fill:#…`. |
| Raw HTML block renders as escaped code | Wrap multi-line HTML in a ` ```{=html} ` block (indentation-safe). |
| Theme CSS variables not applying | Prefer Sass compile-time vars (`$ink`) over CSS custom properties in theme SCSS. |
| Scroll/JS animations invisible if JS off | Make content visible by default; animate as progressive enhancement; respect `prefers-reduced-motion`. |
| Fonts 404 during `--embed-resources` | Harmless (Quarto probes Google Fonts); output still created. Vendor fonts locally for guaranteed offline. |

## Diagnostics toolkit
`quarto check` · `quarto --version` · `jupyter kernelspec list` ·
`quarto inspect <path>` (JSON metadata) · `quarto render --to native` (see Pandoc AST) ·
`quarto render --debug` (keep intermediates) · `quarto tools` (dependency status).
