# Quarto CLI — Every Command (grounded in 1.9.x)

Global options on most commands: `--log <file>`, `--log-level <debug|info|warning|error|critical>`,
`--log-format <plain|json-stream>`, `--quiet`, `--profile <name>`.

## render — render files or projects
`quarto render [input] [args...]`

| Flag | Meaning |
|---|---|
| `-t, --to <fmt[,fmt]>` | Output format(s): `html`, `pdf`, `docx`, `revealjs`, `typst`, `beamer`, `epub`, `gfm`, `all`… |
| `-o, --output <file>` | Write to FILE (`--output -` = stdout) |
| `--output-dir <dir>` | Output directory (project-relative) |
| `-M, --metadata KEY:VALUE` | Override any metadata (`-M echo:false`) |
| `--site-url <url>` | Override site-url for website/book |
| `--execute` / `--no-execute` | Force / skip code execution |
| `-P, --execute-param KEY:VALUE` | Parameter for a parameterised report |
| `--execute-params <file.yml>` | Parameters from YAML |
| `--execute-dir <dir>` | Working dir for execution |
| `--execute-daemon <sec>` / `--execute-daemon-restart` | Persistent Jupyter kernel |
| `--execute-debug` | Debug output during execution |
| `--cache` / `--no-cache` / `--cache-refresh` | Execution cache control |
| `--use-freezer` | Use frozen results for incremental render |
| `--no-clean` | Do not wipe output-dir first |
| `--debug` | Keep intermediate files |
| `pandoc-args...` | Pass through to Pandoc (e.g. `--toc`, `--number-sections`) |

Examples: `quarto render doc.qmd --to pdf --toc` · `quarto render` (whole project) ·
`quarto render doc.qmd -M code-fold:true` · `quarto render doc.qmd --output -`.

## preview — live, auto-reloading preview
`quarto preview [file] [args...]` — serves and rebuilds on save. Accepts render args
(`--to`, `-M`, etc.), plus `--port`, `--host`, `--no-browser`, `--no-watch-inputs`,
`--render <fmt>` (which format to render on the fly).

## serve — run a Shiny interactive document
`quarto serve [input]` — for `server: shiny` documents. `--port`, `--host`, `--render`.

## create — scaffold a project or extension
`quarto create [type] [commands...]` — interactive. Types include **project**
(`default`, `website`, `book`, `manuscript`, `confluence`) and **extension**
(`shortcode`, `filter`, `format:html|pdf|docx|revealjs|typst`, `journal`,
`revealjs-plugin`, `metadata`, `project`). Flags: `--open [positron|vscode|rstudio]`,
`--no-open`, `--no-prompt`. Non-interactive: `quarto create project website mymsite`.

## use — automate setup
`quarto use <type> [target]` — `template <gh-repo>` (start from a template),
`binder` (add Binder config), `brand <target>` (apply a `_brand.yml`).

## add / update / remove — extensions & dependencies
`quarto add <extension>` (e.g. `quarto add quarto-ext/fontawesome`) ·
`quarto update [target...]` · `quarto remove [target...]`.

## install / uninstall / update / tools — global dependencies
Manage **TinyTeX**, **Chromium**, **Chrome Headless Shell**, **VeraPDF**:
`quarto install tinytex` · `quarto uninstall chromium` · `quarto update tinytex` ·
`quarto tools` (status). `quarto list <extensions|tools>`.

## convert — between .qmd and .ipynb
`quarto convert <input> [-o out]` — `.qmd ⇄ .ipynb`. `--with-ids` to keep cell ids.

## pandoc / typst / run — embedded tools
`quarto pandoc [args...]` (bundled Pandoc) · `quarto typst [compile|watch] file.typ` ·
`quarto run script.(ts|R|py|lua)`.

## publish — deploy to a provider
`quarto publish [provider] [path]` — providers: `quarto-pub`, `gh-pages`, `connect`,
`posit-connect-cloud`, `netlify`, `confluence`, `huggingface`. Flags: `--id`,
`--server`, `--token`, `--no-render`, `--no-prompt`, `--no-browser`. Accounts:
`quarto publish accounts`. See `06-publishing.md`.

## check / call / inspect — diagnostics & internals
`quarto check [target]` — verify install & engines (run first when anything is off).
`quarto call engine <name> [args]` — engine internals; `quarto call build-ts-extension`;
`quarto call typst-gather`. `quarto inspect [path]` — machine-readable project/doc
metadata (JSON) for tooling.
