# Quarto — Projects & `_quarto.yml` (100%)

A project = a dir with `_quarto.yml`. Nested dirs with their own `_quarto.yml` are
separate projects (parent render skips them). Scaffold: `quarto create project <type>`.

## Project types
| Type | Purpose | Output |
|---|---|---|
| `default` | Group of related docs, shared config | per-doc |
| `website` | Multi-page site: navbar, sidebar, search, listings, blog | `_site/` |
| `book` | Chapters, parts, cross-chapter refs, single-PDF | `_book/` |
| `manuscript` | Scholarly article + notebooks (MECA), journal-agnostic | `_manuscript/` |
| `confluence` | Publish a tree to Atlassian Confluence | — |

## `_quarto.yml` skeleton
```yaml
project:
  type: website          # or book / manuscript / default
  output-dir: _site
  render:                # control what renders (globs, ! to exclude)
    - "*.qmd"
    - "!drafts/"
  preview: { port: 4321, browser: false }
  resources: [ "assets/**" ]   # copy extra files to output

website:                 # or book:
  title: "Site"
  navbar: { left: [ {text: Home, href: index.qmd} ], right: [ {icon: github, href: ...} ] }
  sidebar: { style: docked, contents: auto }
  search: { location: navbar, type: overlay }
  page-footer: "© 2026"

format:                  # applies to all docs; override per-doc
  html: { theme: [cosmo, styles.scss], toc: true }

bibliography: references.bib
execute: { freeze: auto, warning: false }
```

## Website features
- **Navbar / sidebar** (`contents: auto` builds from files; or explicit tree).
- **Listings** (`listing:` on a page) — auto blog/portfolio index from a folder, with
  fields, sorting, categories, feeds (`feed: true` → RSS).
- **Search** (built-in, `type: overlay|textbox`).
- **Page navigation**, **reader-mode**, **back-to-top**, **code-copy**.
- **Freeze** so CI needn't run kernels.

## Book features
`book:` `chapters:` (files, with `part:` groupings), `appendices:`, `references.qmd`
(`::: {#refs} :::`), `downloads: [pdf, epub]`, `sharing`, `repo-url`+`repo-actions`.
Cross-chapter refs work across files (`@sec-...`, `@fig-...`).

## Manuscript features
`manuscript:` `article: index.qmd`, `notebooks: [...]`. Produces an article plus
linked, executable notebooks; supports **MECA** bundle for journal submission and
**JATS**.

## Profiles & metadata files
- **Profiles:** `_quarto-<profile>.yml` activated with `--profile <name>` or
  `QUARTO_PROFILE` — e.g. a `draft` vs `production` config.
- **`_metadata.yml`** in a subdir applies shared options to all docs there.
- **`_environment`** at project root sets env vars for every `quarto` command
  (used here to pin `QUARTO_PYTHON`, `QUARTO_JULIA`, `JULIA_PROJECT`).
- **`_brand.yml`** — unified brand (logo, colours, fonts, typography) applied across
  formats; `quarto use brand <target>`.
