# 📚 LaTeX Projects Hub

Central hub for managing all LaTeX paper repositories.

## 🚀 Create a New Paper

1. Go to **Issues** → **New Issue** → select **📄 New LaTeX Paper**
2. Fill in: repo name, paper title, authors, institution, collaborators
3. Submit — a GitHub Action will automatically:
   - Create a **private** repo with the full LaTeX toolchain pre-configured
   - Invite any collaborators you listed
   - Comment the clone URL on the issue and close it

## 📋 Project Index

| Paper | Repository | Status |
|-------|-----------|--------|
| SELAR | [Kavirubc/SELAR](https://github.com/Kavirubc/SELAR) | 🟢 Active |

> This table is updated manually. Add new rows as projects are created.

## ⚙️ What Each Scaffolded Repo Includes

- **`.gitignore`** — comprehensive LaTeX ignore rules
- **`.latexmkrc`** — pdflatex + biber configuration
- **`Makefile`** — `make` / `make watch` / `make clean`
- **`.github/workflows/build.yml`** — CI/CD (compile on push, release on tag)
- **`.vscode/`** — auto-compile on save with LaTeX Workshop
- **`main.tex`** — pre-filled title page + standard sections
- **`references.bib`** — ready for Zotero Better BibTeX auto-export

## 🔑 Setup (one-time)

To enable the auto-scaffold workflow, you need a **Personal Access Token** with `repo` scope:

1. Go to [github.com/settings/tokens](https://github.com/settings/tokens)
2. Generate a **classic** token with `repo` and `workflow` scopes
3. In this repo: **Settings → Secrets → Actions** → add secret `LATEX_PAT` with the token
