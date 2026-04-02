# KSRX LaTeX Projects

Central repository for managing LaTeX paper projects. New projects can be scaffolded automatically by opening an issue.

## Creating a New Project

1. Navigate to **Issues** and select **New Issue**.
2. Choose the **New LaTeX Paper** template.
3. Fill in the required fields: repository name, paper title, authors, institution, and optional collaborators.
4. Submit the issue. A GitHub Action will:
   - Create a new **private** repository with the full LaTeX toolchain pre-configured.
   - Invite any listed collaborators with push access.
   - Post the clone URL as a comment on the issue and close it.

## Project Index

| Paper | Repository | Status |
|-------|-----------|--------|
| SELAR | [Kavirubc/SELAR](https://github.com/Kavirubc/SELAR) | Active |

Submodule pointers to each project are maintained in the `projects/` directory.

## What Each Scaffolded Repository Includes

| File | Purpose |
|------|---------|
| `.gitignore` | Comprehensive LaTeX build artifact exclusions |
| `.latexmkrc` | pdflatex + biber configuration with SyncTeX |
| `Makefile` | `make` / `make watch` / `make clean` / `make cleanall` |
| `.github/workflows/build.yml` | CI/CD: compile on push, upload artifact, release on tag |
| `.vscode/settings.json` | Auto-compile on save via LaTeX Workshop |
| `.vscode/extensions.json` | Recommends LaTeX Workshop to collaborators |
| `main.tex` | Title page and standard sections, pre-filled |
| `references.bib` | Ready for Zotero Better BibTeX auto-export |

## Initial Setup (Required Once)

The scaffolding workflow requires a GitHub Personal Access Token to create repositories on your behalf.

1. Go to [github.com/settings/tokens](https://github.com/settings/tokens).
2. Generate a **classic** token with `repo` and `workflow` scopes.
3. In this repository, navigate to **Settings > Secrets and variables > Actions**.
4. Add a new repository secret named `LATEX_PAT` with the token value.

## Local Development

Each scaffolded project supports the following commands:

```bash
make            # Build the PDF (pdflatex + biber via latexmk)
make watch      # Continuous recompilation on file changes
make clean      # Remove auxiliary files
make cleanall   # Remove all generated files including PDF
```

For VS Code users, install the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension. The included workspace settings enable automatic PDF compilation on every save.

## Zotero Integration

Each project is configured for [Better BibTeX](https://retorque.re/zotero-better-bibtex/):

1. Right-click the relevant Zotero collection and select **Export Collection**.
2. Choose **Better BibLaTeX** as the format.
3. Enable **Keep updated**.
4. Save the file as `references.bib` (or `sample.bib` for SELAR) in the project directory.

References will update automatically whenever the Zotero collection changes.
