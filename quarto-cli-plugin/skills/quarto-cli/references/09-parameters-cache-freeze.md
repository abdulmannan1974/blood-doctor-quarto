# Quarto — Parameters, Cache, Freeze, Incremental Render

## Parameterised reports
Define defaults, then override at render.
```yaml
params:
  region: "North"
  year: 2026
```
Use in code: `{python} params["region"]` / `{r} params$region`.
Render variants:
```bash
quarto render report.qmd -P region:South -P year:2025
quarto render report.qmd --execute-params params.yml
```
Loop over params in a shell/script to batch-generate many reports from one source.

## Freeze — skip re-execution unless source changes
```yaml
execute:
  freeze: auto      # re-run only when THIS file changes; else use _freeze/
  # freeze: true    # never re-run (use committed results)
```
`_freeze/` holds results; **commit it** so CI/servers render without kernels.
Force use in incremental render: `--use-freezer`.

## Cache — per-chunk memoisation (knitr/jupyter)
```yaml
execute: { cache: true }         # whole doc
```
Per-cell: `#| cache: true`. Refresh: `quarto render --cache-refresh`. Cache keys on
chunk content + params. Cache = speed up local iteration; Freeze = reproducible
publishing. They are independent.

## Execution control
- `--no-execute` — render prose only (fast; use last results).
- `--execute` — force run even if `enabled: false`.
- `--execute-daemon 300` / `--execute-daemon-restart` — keep a Jupyter kernel warm
  across renders (big speed-up for iterative work).
- `--execute-debug` — verbose kernel output.
- `execute: { echo, eval, output, warning, error, include }` — global defaults,
  overridable per cell with `#|`.

## Incremental project render
`quarto render` re-renders only changed inputs when `freeze` is on. `--no-clean`
preserves untouched outputs. `quarto render <singlefile>` renders just that file into
the project.
