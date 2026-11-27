# LaTeX Template for Writing Project Report or Thesis
This repo contains a LaTeX template which is ready-to-use. For newbies, there are several links to online tutorials and some examples are also provided.

## Requirements
A full TeX distribution, e.g. [TeX Live](https://tug.org/texlive/) / [MacTeX](https://tug.org/mactex/) or [MiKTeX](https://miktex.org/). It must include `latexmk` and `biber` (used by `biblatex` for the bibliography).

## Build
The document is built with `pdflatex`, configured in `latexmkrc`. EPS figures (including the logos on the title page) are converted to PDF automatically. This needs the default *restricted* shell escape of TeX Live, MiKTeX and Overleaf; do not disable shell escape completely.

- **Command line:** run `latexmk` in the project folder. It runs `pdflatex` and `biber` as often as needed and writes `main.pdf`. Clean up with `latexmk -c`.
- **VS Code:** install the *LaTeX Workshop* extension and use its `latexmk` recipe.
- **Overleaf:** upload the project and keep the compiler on `pdfLaTeX` (Menu → Settings → Compiler).

### Labels in vector graphics (psfrag)
The tutorial shows how to replace text in EPS figures with `\psfrag`. psfrag only works with the LaTeX compiler (`latex` → `dvips` → `ps2pdf`), not with `pdflatex`. With the default build the figure shows its original labels.

To use psfrag, build with `latexmk -pdfps` (in Overleaf: compiler `LaTeX`). On this route **only EPS figures** can be included; PNG, JPG and PDF figures fail to build.

## Bibliography
References go into `library.bib` and are cited with `\cite{key}`.
