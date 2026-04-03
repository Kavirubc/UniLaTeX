# UniLaTeX

An automated LaTeX project management system built on GitHub Actions. Create new paper repositories from a standard template by opening an issue — no manual setup required.

## Features

- **Issue-driven scaffolding.** Open an issue with paper metadata; a GitHub Action creates a private repository with the full toolchain pre-configured.
- **CI/CD pipeline.** Every push compiles the document and uploads the PDF as a build artifact. Tagged commits produce GitHub Releases with downloadable PDFs.
- **Local auto-compilation.** Compile on save via VS Code [1] or continuous watch mode via terminal.
- **Reference management.** Pre-configured for Zotero [2] with Better BibTeX [3] auto-export.
- **Submodule index.** Each scaffolded project is automatically registered as a submodule in `projects/`, providing a navigable index of all papers.
- **Collaboration.** Real-time co-editing via VS Code Live Share [4], asynchronous review via pull requests, and inline comments via `todonotes`.

## Fork and Use

**Step 1.** Fork this repository.

**Step 2.** Create a GitHub Personal Access Token (classic) with `repo` and `workflow` scopes [5]. Add it as a repository secret named `LATEX_PAT` in your fork under **Settings > Secrets and variables > Actions**.

**Step 3.** Navigate to **Issues > New Issue > New LaTeX Paper**, fill in the form, and submit. The scaffold workflow will create a private repository under your account, copy all template files, inject your paper metadata, invite collaborators, and register the project as a submodule. A comment with clone instructions will be posted on the issue before it closes automatically.

You can then clone the new repository and begin writing immediately:

```bash
git clone https://github.com/<your-username>/<repo-name>
cd <repo-name>
make
```

## Prerequisites

| Tool | Purpose |
|------|---------|
| MacTeX / TeX Live [6] | LaTeX distribution (`pdflatex`, `latexmk`, `biber`) |
| Zotero [2] + Better BibTeX [3] | Reference management with auto-export |
| VS Code [1] + LaTeX Workshop [7] | Editor with auto-compile on save (optional) |

Install on macOS:

```bash
brew install --cask mactex
```

## Local Development

Each scaffolded project supports the following build commands:

```bash
make            # Build the PDF (pdflatex + biber via latexmk)
make watch      # Continuous recompilation on file changes
make clean      # Remove auxiliary files
make cleanall   # Remove all generated files including PDF
```

### Auto-Compile on Save

Install LaTeX Workshop [7] in VS Code. The scaffolded `.vscode/settings.json` configures automatic PDF recompilation on every save. SyncTeX is enabled for bidirectional navigation between source and PDF.

## Collaboration

### Real-Time Co-Editing

Install VS Code Live Share [4]:

```bash
code --install-extension MS-vsliveshare.vsliveshare
```

Start a session from the command palette (`Cmd+Shift+P` > "Live Share: Start Session") and share the link with collaborators. Combined with `make watch` or LaTeX Workshop auto-compile, all participants see the PDF update in real time.

### Asynchronous Review

The CI pipeline compiles the document on every pull request. Collaborators can:

1. Work on feature branches (`feature/add-methodology`, `kaviru/rewrite-intro`).
2. Open a pull request — the compiled PDF is available as a build artifact.
3. Review changes in the diff, download the PDF, and merge when ready.

### Inline Comments

Add the `todonotes` package to your preamble for margin and inline annotations:

```latex
\usepackage{todonotes}

\todo{Needs a citation here}
\todo[inline]{Rewrite this paragraph}
\missingfigure{System architecture diagram}
\listoftodos   % generates a summary of all annotations
```

## Reference Management

This system is configured for Zotero [2] with Better BibTeX [3]:

1. Install Better BibTeX in Zotero.
2. Right-click a collection and select **Export Collection**.
3. Choose **Better BibLaTeX** as the format.
4. Enable **Keep updated**.
5. Save the file as `references.bib` in the project directory.

References update automatically whenever the Zotero collection changes. Cite in LaTeX with `\parencite{key}` or `\textcite{key}`.

## Scaffolded Repository Contents

Each generated repository includes:

| File | Purpose |
|------|---------| 
| `.gitignore` | LaTeX build artifact exclusions |
| `.latexmkrc` | `pdflatex` + `biber` configuration with SyncTeX |
| `Makefile` | Build shortcuts (`make`, `make watch`, `make clean`) |
| `.github/workflows/build.yml` | CI/CD: compile on push, release on tag |
| `.vscode/settings.json` | Auto-compile on save via LaTeX Workshop |
| `.vscode/extensions.json` | Recommends LaTeX Workshop to collaborators |
| `main.tex` | Title page and standard sections, pre-filled with metadata |
| `references.bib` | Starter bibliography file |
| `Diagrams/` | Directory for TikZ diagram sources |
| `Tables/` | Directory for table sources |

## Workflows

This repository ships with three GitHub Actions workflows:

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `new-project.yml` | Issue labeled `new-project` | Scaffolds a new repository from the template |
| `update-submodules.yml` | Scheduled (5x daily) + manual dispatch | Syncs submodule pointers to latest commits |
| `build.yml` (per project) | Push to `main`, pull requests | Compiles LaTeX and uploads PDF artifact |

## Releasing a Paper

To create a versioned release with the compiled PDF:

```bash
git tag v1.0
git push origin v1.0
```

The CI pipeline will compile the document and attach the PDF to a GitHub Release.

## Customization

- **Template files** are in `template/`. Modify `main.tex`, `.latexmkrc`, or `build.yml` to change defaults for new projects.
- **Submodule sync schedule** is defined in `update-submodules.yml`. Adjust the cron expressions to match your timezone and working hours.
- **Issue form fields** are defined in `.github/ISSUE_TEMPLATE/new_paper.yml`. Add or remove fields as needed.

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

---

## References

[1] Visual Studio Code. https://code.visualstudio.com  
[2] Zotero. https://www.zotero.org  
[3] Better BibTeX for Zotero. https://retorque.re/zotero-better-bibtex  
[4] VS Code Live Share. https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare  
[5] GitHub Personal Access Tokens. https://github.com/settings/tokens  
[6] MacTeX / TeX Live. https://www.tug.org/mactex  
[7] LaTeX Workshop. https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop  
