# Quarto — Extensions & Customisation (100%)

Extensions live in `_extensions/`. Install: `quarto add <gh-owner/repo>`;
list/update/remove: `quarto list extensions` / `quarto update` / `quarto remove`.
Scaffold your own: `quarto create extension <kind>`.

## Extension kinds
| Kind | Does | Create |
|---|---|---|
| **Shortcode** | `{{< name args >}}` → generated content | `quarto create extension shortcode` |
| **Filter** | Lua Pandoc AST transform (`filters:` in YAML) | `quarto create extension filter` |
| **Format** | Custom output format (`format: owner-name-html`) | `quarto create extension format:html` (or pdf/docx/revealjs/typst) |
| **Journal** | Journal article template (LaTeX/Typst) | `quarto create extension journal` |
| **Revealjs plugin** | Slide behaviour/plugin | `quarto create extension revealjs-plugin` |
| **Metadata** | Reusable metadata bundle | `quarto create extension metadata` |
| **Project** | Custom project type/starter | `quarto create extension project` |

## Popular extensions (install via `quarto add`)
- `quarto-ext/fontawesome`, `mcanouil/quarto-iconify` — icons: `{{< fa heart >}}`, `{{< iconify … >}}`
- `quarto-ext/lightbox` — image lightbox
- `quarto-journals/*` — journal templates (elsevier, plos, acm, jss…)
- `quarto-ext/include-code-files`, `shafayetShafee/*` — code utilities
- Diagram/embed helpers, downloadthis, etc.

## Theming (HTML)
`theme:` accepts a Bootswatch name (`cosmo`, `flatly`, `darkly`…) and/or a `.scss`
file. SCSS layers: `/*-- scss:defaults --*/` (Bootstrap/Sass vars — reliable, compile-time),
`/*-- scss:rules --*/`, `/*-- scss:functions/mixins --*/`. **Prefer Sass variables over
CSS custom properties** in theme files (custom props can fail to emit). Light/dark:
`theme: { light: a.scss, dark: b.scss }`.

## Brand (`_brand.yml`)
Unified cross-format brand: `color:` (palette + semantic), `typography:`
(fonts/headings/base/monospace), `logo:`. Apply: `quarto use brand <target>`. Works
for html/pdf/typst/revealjs/dashboards.

## Templates & starters
`quarto use template <gh-repo>` to start a project from a template.
`--to <format>` custom templates via `template:` / `template-partials:` (Pandoc
templates) for full control of the output skeleton.

## Lua filter essentials
A filter is Lua returning element handlers (`Str`, `Para`, `Div`, `CodeBlock`,
`Header`, `Pandoc`…). Add with `filters: [my.lua]`. Use for shortcodes' logic,
custom divs → format-specific output, injecting content. Debug with
`quarto render --to native` to see the AST.
