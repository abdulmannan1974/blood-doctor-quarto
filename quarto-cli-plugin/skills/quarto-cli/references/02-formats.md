# Quarto — Output Formats (100%)

Set under `format:` in YAML; render with `--to <name>`. One doc can list many.

## Documents
| Name | Output | Notes |
|---|---|---|
| `html` | Web page | Default; TOC, code-fold/tools, theming, self-contained via `embed-resources: true` |
| `pdf` | LaTeX PDF | Needs TinyTeX/LaTeX; `documentclass`, `geometry`, `include-in-header` |
| `typst` | PDF via Typst | **No LaTeX needed** (bundled); fast; modern `brand`/template support |
| `docx` | Word | `reference-doc:` for corporate styles |
| `odt` `rtf` | OpenOffice / RTF | |
| `epub` | E-book | `epub-cover-image`, chapters from `#` headings |
| `gfm` `commonmark` `markdown` `hugo-md` | Markdown flavours | For static-site pipelines |
| `docusaurus-md` `markua` | Docs platforms | |
| `jats` | JATS XML | Journal archival |
| `ipynb` | Jupyter notebook | Round-trip |
| `mediawiki` `dokuwiki` `zimwiki` `jira` `xwiki` | Wiki markups | |
| `asciidoc` `asciidoctor` | AsciiDoc | |
| `texttile` `org` `muse` `rst` `opml` `texinfo` `man` | Other markups | |

## Presentations
| Name | Output |
|---|---|
| `revealjs` | HTML slides — incremental, speaker notes (`S`), `chalkboard`, `multiplex`, fragments, columns, themes; export PDF with `?print-pdf` |
| `beamer` | LaTeX/PDF slides |
| `pptx` | PowerPoint |

## Books & sites
`format:` inside a **project** (`type: website`/`book`) — see `04-projects.md`.
Books support **html + pdf + epub** simultaneously.

## Key cross-format options
`toc: true` · `toc-depth` · `number-sections: true` · `fig-width/height` · `fig-format`
(retina/png/svg/pdf) · `df-print: kable|paged|tibble` · `code-fold: show|true` ·
`code-tools: true` · `code-line-numbers` · `highlight-style` · `theme:` (html: bootswatch
or `.scss`) · `include-in-header/-before-body/-after-body` · `filters:` · `shortcodes:`.

## HTML self-contained
`embed-resources: true` inlines all CSS/JS/images into one portable `.html`
(the deliverable pattern for offline sharing). CDN scripts are NOT inlined —
vendor them locally if offline use matters.

## PDF: Typst vs LaTeX — decision
- **Typst** (`format: typst`): fast, no install (bundled), great default typography,
  `brand` support. Use unless a specific LaTeX journal template/package is required.
- **LaTeX** (`format: pdf`): mature journal templates, full LaTeX ecosystem; needs
  `quarto install tinytex` (or a system TeX).
