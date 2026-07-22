# Quarto — Interactivity (100%)

Three tiers: **client-side (no server)**, **server-backed (Shiny)**, and **embedded
widgets**.

## Observable JS — client-side, no server (preferred for teaching)
` ```{ojs} ` cells run in the reader's browser and are **reactive** (re-run when
inputs change). Built-in: `d3`, `@observablehq/plot`, `Inputs`, `FileAttachment`.
```js
viewof n = Inputs.range([0, 100], {value: 50, label: "n"})
Plot.plot({ marks: [Plot.lineY(d3.range(n), Math.sin)] })
```
Bridge data from R/Python into OJS: call `ojs_define(mydata = df)` in a `{r}`/`{python}`
cell, then use `mydata` in `{ojs}`. Ideal for single-file, hostable, offline demos.

## Shiny — server-backed reactivity
`server: shiny` in YAML; author `{r}`/`{python}` reactive cells (`input$x`,
`render*`). Run locally: `quarto serve doc.qmd`. Deploy to shinyapps.io / Posit
Connect / Hugging Face. Needs a running server (not a static file).

## Dashboards
`format: dashboard` — rows/columns/`.card`/`.tabset`, value boxes, sidebars; combine
static, OJS, or Shiny content. Great for KPI/clinical dashboards.

## Embedded widgets
- **htmlwidgets (R):** leaflet, plotly, DT, dygraphs — just print them in `{r}` cells.
- **ipywidgets / plotly / bokeh / altair (Python):** interactive outputs embed in HTML.
- **Jupyter widgets** require `format: html` (self-contained still works for most).

## Interactivity + PDF
Interactive content is HTML-only. For PDF/print, provide a static fallback with
`.content-visible when-format="html"` / `.content-visible when-format="pdf"`.
