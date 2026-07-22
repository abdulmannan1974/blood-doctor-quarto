# Quarto — Authoring (Markdown superset, 100% of the common surface)

Pandoc Markdown + Quarto extensions. Works across HTML/PDF/DOCX/revealjs.

## Cross-references (`@` to reference, prefix decides type)
Label a target with `#| label: fig-x` / `#| label: tbl-x`, `{#sec-x}` on headings,
`{#eq-x}` on display math. Reference with `@fig-x`, `@tbl-x`, `@sec-x`, `@eq-x`,
`@lst-x` (listings), `@thm-x` (theorems). Custom cross-ref types via
`crossref:` config. `-@fig-x` suppresses the prefix.

## Citations
`bibliography: refs.bib` (also `.json`/`.yaml`). Cite: `[@key]`, `[@a; @b]`,
`[see @key, p. 3]`, `@key` (in-text), `[-@key]` (year only). Styles via `csl:`.
Reflist placeholder: `::: {#refs} :::`. `nocite: |` to force-include.

## Figures
```markdown
![Caption](img.png){#fig-x width=70% fig-align="center"}
```
Subfigures via a `::: {#fig-panel layout-ncol=2}` div containing several images each
with their own `{#fig-a}` caption. Computational figures: `#| label: fig-x` +
`#| fig-cap:` on the code cell. `fig-alt:` for accessibility.

## Tables
Pipe tables, grid tables; caption `: My table {#tbl-x}`. From code: `#| label: tbl-x`
+ `#| tbl-cap:`. `df-print: kable|paged`. Column spanning via grid tables.

## Callouts (5 types)
```markdown
::: {.callout-note}
Content
:::
```
Types: `note`, `tip`, `important`, `caution`, `warning`. Options: `## Title`,
`collapse="true"`, `appearance="default|simple|minimal"`, `icon=false`.

## Tabsets, columns, panels
`::: {.panel-tabset}` with `### Tab` headings. Multi-column: `::: {.columns}` +
`::: {.column width="50%"}`. Margin content: `::: {.column-margin}`; body-outset,
page/screen-inset widths via `column:` cell option.

## Fenced divs & spans
`::: {.class #id key="val"}` block; `[text]{.class}` inline. Attributes flow to HTML
classes / LaTeX environments. Great for custom styled components (see the Anthropic
review's quote cards).

## Math
Inline `$...$`, display `$$...$$` (label `{#eq-x}`). LaTeX macros in
`include-in-header`. MathJax (HTML) / native (PDF/Typst).

## Diagrams (text → rendered)
- **Mermaid:** ` ```{mermaid} ` flowcharts/sequence/gantt/class/state/ER/mindmap.
  Theme via `mermaid: theme: neutral|default|dark|forest` or `%%{init}%%`.
- **Graphviz:** ` ```{dot} ` DOT graphs.
Both render to SVG at build — diff-friendly, no image files to maintain.

## Other
Footnotes `^[inline]` / `[^ref]`. Definition lists. Task lists. `{{< include _part.qmd >}}`
to compose files. Conditional content: `.content-visible when-format="html"` /
`.content-hidden`. Keyboard: `{{< kbd Ctrl-S >}}`. Emoji shortcodes; but prefer
icon extensions (fontawesome/iconify) or a JS icon lib for structural icons.
