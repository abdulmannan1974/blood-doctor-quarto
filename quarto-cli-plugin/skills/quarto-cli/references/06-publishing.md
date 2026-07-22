# Quarto — Publishing (all 7 providers + CI/CD)

`quarto publish [provider] [path]`. Accounts configured interactively and stored;
manage via `quarto publish accounts`. Add `--no-render` to publish an already-rendered
`_site`/`_book`, `--no-prompt` for automation, `--no-browser` to skip opening.

## Providers
| Provider | Command | Notes |
|---|---|---|
| **GitHub Pages** | `quarto publish gh-pages` | Pushes rendered output to `gh-pages` branch; adds `.nojekyll`. Use `gh` keyring auth; do NOT set `GITHUB_TOKEN`/`GH_TOKEN` overrides. |
| **Netlify** | `quarto publish netlify` | Needs Netlify token (interactive first time). Primary target here → `dr-abdul-mannan.netlify.app`. |
| **Quarto Pub** | `quarto publish quarto-pub` | Free hosting at quartopub.com; quick sharing. |
| **Posit Connect** | `quarto publish connect` | Enterprise; `--server`, `--token`. |
| **Posit Connect Cloud** | `quarto publish posit-connect-cloud` | Hosted Connect. |
| **Confluence** | `quarto publish confluence` | Atlassian; project `type: confluence`. |
| **Hugging Face Spaces** | `quarto publish huggingface` | Static Spaces. |

## GitHub Pages recipe (this machine's rule)
```bash
unset GITHUB_TOKEN GH_TOKEN
gh auth status            # expect account abdulmannan1974
gh auth setup-git
quarto publish gh-pages   # or: Pages from a clean gh-pages branch with .nojekyll
```
If Pages 404s from `main /`, publish a clean `gh-pages` branch with `.nojekyll`, set
Pages source to `gh-pages /root`, then `curl` the URL until HTTP 200.

## CI/CD (render on push)
Two patterns:
1. **Freeze + publish output** — commit `_freeze/` (from `freeze: auto`), the CI job
   runs `quarto render` without kernels, then `quarto publish gh-pages --no-prompt`.
2. **Full execute in CI** — set up Python/R/Julia in the workflow, then render.
Official action: `quarto-dev/quarto-actions/setup` + `/publish` (GitHub Actions).
`publish.yml` uses `GITHUB_TOKEN` provided by Actions (that's fine in CI; the
no-override rule is for LOCAL admin tasks on this machine).

## Self-contained alternative
For a single portable file (email/USB/offline), skip hosting: render with
`--embed-resources` and share the `.html`.
