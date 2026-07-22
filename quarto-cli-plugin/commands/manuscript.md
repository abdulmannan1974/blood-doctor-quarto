---
description: Build a journal-style manuscript (HTML + PDF + DOCX) with citations.
argument-hint: "[title]"
---
Create a scholarly manuscript **$ARGUMENTS**. Load `references/04-projects.md` (manuscript) + `05-authoring.md` + `06-publishing.md`.
Include: `format: { html, pdf, docx }`, abstract, sections, a labelled figure and table with cross-refs (`@fig-`, `@tbl-`), and citations from a `.bib` with `::: {#refs} :::`.
Respect citation integrity — flag that all references must be verified against primary sources before submission. Render all three formats and confirm each file is valid.
