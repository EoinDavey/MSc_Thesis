.PHONY: default clean full

CHAPTERS := $(wildcard chapters/*.tex)
ASSETS := $(shell find assets/)

THESIS_DEPS := thesis.tex uvamath.cls macros.sty zotero.bib manual.bib ${CHAPTERS} ${ASSETS}

DOCKER_RUN = docker run \
			 --rm \
			 -v "${CURDIR}:/workdir" \
			-e TEX_UID=$$(id -u) \
			thesis-tex

default: build/thesis.pdf

clean:
	rm -rf build/

build/thesis.pdf: ${THESIS_DEPS}
	@${DOCKER_RUN} xelatex -output-directory=build thesis.tex

full: ${THESIS_DEPS}
	@${DOCKER_RUN} latexmk -output-directory=build -xelatex thesis.tex
