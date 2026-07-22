# Blood🩸Doctor · Quarto Publishing Framework

A verified home base for scientific publishing with [Quarto](https://quarto.org).
All four engines and every major output type are installed, wired up and tested.

## Verified on this machine (2026-07-22)

| Component | Version | Location (outside Drive) |
|---|---|---|
| Quarto | 1.9.38 | `/Applications/quarto` |
| Python + Jupyter | 3.14.3 · numpy/scipy/pandas/matplotlib | `~/.venvs/quarto` |
| R + knitr | 4.5.2 · knitr/rmarkdown/ggplot2 | `~/Library/R/arm64/4.5/library` |
| Julia + Plots | 1.12.6 · Plots/DataFrames | `~/.juliaup`; project env = `Project.toml` here |
| TinyTeX | (LaTeX PDF) | `~/Library/TinyTeX` |
| Typst | 0.14.2 (bundled) | ships with Quarto |

Packages live **outside** this Google Drive folder to avoid sync storms. The pins
are in **`_environment`** (read automatically by every `quarto` command):

```
QUARTO_PYTHON=~/.venvs/quarto/bin/python
QUARTO_JULIA=~/.juliaup/bin/julia
JULIA_PROJECT=<this folder>   # so the Julia runner finds Plots
```

## Project layout

```
_quarto.yml            website project config
_environment           engine paths (auto-loaded)
styles.scss            Blood Doctor theme
references.bib         shared bibliography (⚠ re-verify before publishing)
index.qmd              framework home page
engines/               python.qmd · r.qmd · julia.qmd · observable.qmd
diagrams/algorithms.qmd  Mermaid + Graphviz
outputs/               manuscript.qmd (HTML/PDF/DOCX) · slides.qmd · interactive.qmd
book/                  nested Quarto book (own _quarto.yml)
Project.toml/Manifest  Julia project env (references ~/.julia packages)
```

## Commands

```bash
quarto preview                                  # live site, auto-reload
quarto render                                   # whole website → _site/
quarto render outputs/manuscript.qmd            # → HTML + PDF + DOCX
quarto render outputs/slides.qmd --to revealjs  # slide deck
quarto render book                              # book → book/_book/ (HTML)
quarto render book --to pdf                      # book → typeset PDF
```

For a new paper, copy `templates/manuscript-starter.qmd` into `outputs/` before
editing; its shared bibliography path is designed for that location.

## Publishing

```bash
quarto publish netlify     # primary → dr-abdul-mannan.netlify.app
quarto publish gh-pages    # GitHub Pages (use gh keyring auth; no token overrides)
quarto publish quarto-pub  # quick public sharing
```

## Adding content

1. Create a `.qmd` anywhere (e.g. `topics/aiha.qmd`).
2. Add code cells with ` ```{python} `, ` ```{r} `, ` ```{julia} ` or ` ```{ojs} `.
3. Add it to `_quarto.yml` (`render:` list and/or navbar) and `quarto render`.

## Troubleshooting (issues hit during setup)

- **Julia "Package X not found"** → the runner uses a project-local env. Add the
  package with `julia --project=. -e 'using Pkg; Pkg.add("X")'`.
- **Julia GR plot error on headless render** → set `ENV["GKSwstype"]="100"` before
  `gr()` (already done in `engines/julia.qmd`).
- **Julia "worker is busy" / stale state** → `pkill -f quartonotebookrunner` then re-render.
- **R "knitr not available"** → install into the personal library, not the system one:
  `Rscript -e '.libPaths("~/Library/R/arm64/4.5/library"); install.packages("knitr", lib="~/Library/R/arm64/4.5/library")'`
- **Python PEP 668 "externally managed"** → use the `~/.venvs/quarto` venv, not Homebrew Python.

## ⚠ Citation integrity

`references.bib` demonstrates the `@cite` mechanism only. Before any real
publication, re-verify every citation live (PubMed / Crossref) per the Blood
Doctor Citation Integrity Protocol.
