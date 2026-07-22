# Quarto — Execution Engines (100%)

Engine is auto-detected from code cells; override with `engine:` in YAML.

## The four engines
| Engine | Language(s) | Trigger | Backing |
|---|---|---|---|
| **knitr** | R (+ Python via reticulate) | ` ```{r} ` cells or `engine: knitr` | R `knitr`/`rmarkdown` |
| **jupyter** | Python, Julia, others | ` ```{python} ` / `.ipynb` | Jupyter kernels |
| **julia** | Julia | ` ```{julia} ` | `QuartoNotebookRunner` (IJulia kernel) |
| **markdown** | none (static) | no executable cells | — |
| **Observable JS** | client-side JS | ` ```{ojs} ` | Built in — no install, runs in browser |

## Cell options (prefix `#|`)
`label`, `fig-cap`, `tbl-cap`, `echo` (show code), `eval`, `output` (asis/false),
`warning`, `message`, `error`, `include`, `code-fold`, `code-summary`, `fig-width`,
`fig-height`, `column`, `layout-ncol`, `cache`, `freeze`.

## Selecting Python / kernel
Quarto uses `QUARTO_PYTHON` or the `python3` on PATH that has `jupyter`. List kernels:
`jupyter kernelspec list`. Pick a kernel per-doc: `jupyter: python3` (or `julia-1.12`).
Keep a kernel warm across a render: `--execute-daemon 300`.

## R (knitr)
Needs `knitr` + `rmarkdown` in an R library. `df-print`, `fig.retina`, chunk labels.
Reticulate lets a knitr doc also run `{python}` cells sharing one session.

## Julia
Uses a **project-local environment** — the runner does NOT fall back to the global
depot. Put needed packages in the project's `Project.toml` and set `JULIA_PROJECT`.
Headless plots: set `ENV["GKSwstype"]="100"` before `gr()` (GR backend). See
`10-troubleshooting.md`.

## Observable JS (OJS)
Reactive, client-side. `d3` and `@observablehq/plot` are built in. `viewof x =
Inputs.range(...)` makes interactive inputs; cells re-run automatically when inputs
change. Pull data with `FileAttachment("data.csv").csv()`. Bridge to R/Python via
`ojs_define()`.

## Freeze vs cache (see 09)
- `freeze: auto` — re-execute only when the source changes (great for CI: no kernels needed on the server).
- `cache: true` — per-chunk knitr/jupyter cache (skips unchanged expensive chunks locally).
