# iatdmct-workshop

Materials for the IATDMCT Congress workshop *Introduction to Markdown, Quarto and equations*.

**Workshop site:** <https://lapkb.github.io/iatdmct-workshop/>

The site is static HTML served from the repository root by GitHub Pages: `index.html` is the
landing page and `.nojekyll` tells Pages to publish the files as they are, so every link on it
points straight at a file in this repository.

| Material | File |
|---|---|
| Hands-on exercise — Quarto in Positron | `Exercises/R_code_Exercise.html` |
| Reproduce-a-document exercise | `markdown/exercises/task.pdf` |
| Target document (the specification) | `markdown/exercises/reproduce-target.pdf` |
| Solution (all code shown) | `markdown/exercises/reproduce-solution.pdf` |
| Cheat sheet | `markdown/cheatsheet.pdf` |
| Exercise data | `markdown/exercises/data/patient-concentrations.csv` |

## Building the PDFs

Everything under `markdown/` is written in Quarto and renders to PDF:

```bash
cd markdown
quarto render
```

Rendering needs a LaTeX toolchain (`quarto install tinytex` once) and, for
`exercises/reproduce-target.qmd` and `exercises/reproduce-solution.qmd`, R with knitr.
