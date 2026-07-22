#!/usr/bin/env bash
#
# clone-observable-mirror.sh
#
# Maintains a curated, shallow local mirror of the Observable-native repos
# from https://github.com/observablehq — the pieces that are actually useful
# for strengthening a Quarto scientific-publishing workflow.
#
# Deliberately excludes the org's ~50 forks of unrelated giants
# (TypeScript, next.js, airbyte, prettier, xlsx, tfjs-*, CodeMirror, marked,
# esm, reach-ui, …) and archived/demo/infra repos. Cloning everything would be
# ~5.5 GB and ~90% irrelevant; this curated set is a few hundred MB.
#
# The mirror lives OUTSIDE Google Drive and outside the Quarto git repo, so it
# never causes sync churn or accidental commits. Re-running updates each clone.
#
# Usage:  ./scripts/clone-observable-mirror.sh [target-dir]
#         (default target: ~/observablehq-mirror)

set -euo pipefail

MIRROR_DIR="${1:-$HOME/observablehq-mirror}"
ORG="https://github.com/observablehq"

# Curated Observable-native repos, grouped by role.
REPOS=(
  # Core libraries (what Quarto's OJS engine is built on)
  plot inputs stdlib runtime inspector htl
  # Tooling / reference implementations
  framework notebook-kit create
  # Patterns & examples to harvest into .qmd pages
  examples data-loader-examples
  # Convenience wrappers
  graphviz vega katex parser array
  # Gold assets: ready-made cheatsheet PDFs + sample data
  plot-cheatsheets datasets sample-datasets
)

mkdir -p "$MIRROR_DIR"
cd "$MIRROR_DIR"

echo "==> Observable mirror: $MIRROR_DIR"
echo "==> ${#REPOS[@]} curated repos"
echo ""

for repo in "${REPOS[@]}"; do
  if [ -d "$repo/.git" ]; then
    echo "--> Updating $repo"
    git -C "$repo" pull --ff-only --depth 1 --quiet 2>/dev/null \
      || echo "    (skip: could not fast-forward $repo)"
  else
    echo "--> Cloning $repo"
    git clone --depth 1 --quiet "$ORG/$repo.git" "$repo" \
      || echo "    (skip: could not clone $repo)"
  fi
done

echo ""
echo "==> Done. Size:"
du -sh "$MIRROR_DIR"
