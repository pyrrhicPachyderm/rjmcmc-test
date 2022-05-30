SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
RM := rm -f

all: analysis.pdf
.PHONY: all

%-dedented.rnw: dedent-noweb %.rnw
	./$< <$(word 2,$^) >$@
%.tex: %-dedented.rnw
	R -e 'library(knitr);knit("$<","$@")'
%.pdf: %.tex $(supporting_tex_files)
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $@)" $<
