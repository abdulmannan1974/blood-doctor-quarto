---
description: Build a multi-chapter Quarto book (HTML + PDF).
argument-hint: "[title]"
---
Create a Quarto **book** titled **$ARGUMENTS**. Load `references/04-projects.md` (book).
`quarto create project book <dir>`; add chapters with cross-chapter refs, a shared `.bib`, `downloads: [pdf, epub]`.
Render to HTML (`quarto render <dir>`) and PDF (`--to pdf`); confirm `_book/` outputs exist and cross-references resolve.
