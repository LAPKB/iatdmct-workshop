# Workshop guidance

This repository demonstrates AI-assisted pharmacokinetic analysis in Positron. The planned analysis uses `data/bimodal_ke.csv` and a one-compartment model. Perform only the analysis requested; do not start modeling before it is requested.

- Deliver analysis tasks as Quarto (`.qmd`) documents with executable code, concise explanations, and relevant tables or plots. Use HTML output by default.
- Keep documents self-contained and reproducible: use relative paths, declare package dependencies, and set a seed for stochastic steps. Render when possible and report any execution or rendering limitations.
- Preserve the original files in `data/`. Inspect the data before analysis; handle `.` as missing and verify column meanings, units, dosing events, and special dosing codes before interpreting them. Ask when essential information is missing.
- When modeling is requested, use a one-compartment model and state its assumptions, parameter definitions, units, dosing inputs, and error model. Include appropriate diagnostics and discuss limitations without overstating results.
- Keep code and prose simple and suitable for a live workshop. Never invent results or present unexecuted code as verified analysis.
- Do not modify the data, exclude subjects or perform any other modification while modeling.

## Pmetrics setup

Use the latest Pmetrics from [LAPKB's r-universe](https://lapkb.r-universe.dev/Pmetrics) (3.2.6 as checked on 2026-09-27). With R installed, run this in the Positron R console to install or update:

```r
install.packages("Pmetrics", repos = c(
  "https://lapkb.r-universe.dev",
  "https://cloud.r-project.org"
))
library(Pmetrics)
packageVersion("Pmetrics")
```

Prefer prebuilt binaries when available for the installed R version and platform. Rust is required only when building Pmetrics from source, not for running models with the prebuilt package. See the [official installation instructions](https://lapkb.github.io/Pmetrics/#installation).

Keep installation separate from document rendering; record the installed Pmetrics version and `sessionInfo()` in analysis documents.
