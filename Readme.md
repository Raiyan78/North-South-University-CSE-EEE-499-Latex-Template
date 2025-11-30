# Capstone LaTeX Class

This project contains a small LaTeX class (`capstone.cls`) that sets up the
front pages for our capstone report (CSE499/EEE499). It handles the cover, approval page,
declaration, acknowledgements, abstract, and the table of contents, so the
main document only needs to focus on the actual chapters.

## How to use

Put `capstone.cls`, `main.tex`, and your `logo.png` in the same folder.

In `main.tex`, you fill in the project info, supervisor, chair, abstract,
and group members, for example:

```latex
\renewcommand{\ProjectTitle}{My Project}
\renewcommand{\AdvisorName}{Dr.\ Someone}
\setabstract{A short summary goes here.}

\CapstoneStudent{Name One}{ID1}
\CapstoneStudent{Name Two}{ID2}
