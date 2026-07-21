ROOT := $(CURDIR)
MAIN := main

# Section subfiles + shared sources that main.pdf depends on.
SECTIONS := $(wildcard sections/*.tex)
TEX_SOURCES := $(shell find . -name '*.tex' -not -path '*/build/*')

# `make watch` defaults to the whole paper; override for a single section:
#   make watch FILE=sections/introduction.tex
FILE ?= $(MAIN).tex

.PHONY: all watch clean distclean install-hooks

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex preamble.sty references.bib $(SECTIONS)
	latexmk $(MAIN).tex

watch:
	latexmk -pvc $(FILE)

clean:
	@for tex in $(TEX_SOURCES); do latexmk -c $$tex; done
	@find . -type d -name build -empty -delete 2>/dev/null || true

distclean:
	@for tex in $(TEX_SOURCES); do latexmk -C $$tex; done
	@find . -type d -name build -exec rm -rf {} + 2>/dev/null || true

install-hooks:
	git config core.hooksPath .githooks
	@echo "Git hooks installed (core.hooksPath = .githooks)"
