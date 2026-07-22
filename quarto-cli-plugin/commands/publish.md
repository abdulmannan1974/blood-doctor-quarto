---
description: Publish a Quarto site/doc to a provider (Netlify, GitHub Pages, Quarto Pub…).
argument-hint: "[netlify|gh-pages|quarto-pub|connect|confluence|huggingface]"
---
Publish to provider **$1** (default: netlify → dr-abdul-mannan.netlify.app).
Load `references/06-publishing.md`.

- For **gh-pages**: first `unset GITHUB_TOKEN GH_TOKEN; gh auth status; gh auth setup-git` (account abdulmannan1974). Never use token overrides for local admin.
- Render first (unless already built — then `--no-render`), then `quarto publish $1 --no-prompt`.
- After publishing, `curl` the live URL until HTTP 200 and report it. Do the deploy + verification yourself.
