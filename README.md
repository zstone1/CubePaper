# CubePaper

The math paper accompanying the [`../Cubical`](../Cubical) Lean formalization:
the cube-chain category `Ch(K)` of a precubical set, its executions, and the
concurrency braid groupoid.

## Layout

| Path | What |
|---|---|
| `main.tex` | Paper root. Sets title/abstract, pulls in each section, prints the bibliography. |
| `preamble.sty` | Shared styling and notation (loaded by every section). |
| `sections/` | One `.tex` per section, each a `subfiles` document that also compiles on its own. |
| `references.bib` | Bibliography (biblatex + biber). |
| `.githooks/pre-commit` | Rebuilds `main.pdf` from sources on commit. |

## Building

```sh
make                 # build main.pdf
make watch           # live-rebuild the whole paper on save
make watch FILE=sections/introduction.tex   # live-rebuild one section standalone
make clean           # remove aux files
make distclean       # remove aux files and PDFs
make install-hooks   # enable the PDF-rebuild pre-commit hook
```

Each file in `sections/` starts with `\documentclass[../main.tex]{subfiles}`,
so you can compile a single section in isolation while writing it and still get
the full paper's preamble and numbering.

Auxiliary files land in `build/`; only `main.pdf` is committed.
