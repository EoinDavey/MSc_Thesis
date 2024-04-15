.PHONY: default clean

CHAPTERS := $(wildcard chapters/*.tex)
ASSETS := $(wildcard asssets/*)

default: build/thesis.pdf

clean:
	rm -rf build/

build/thesis.pdf: thesis.tex uvamath.cls macros.sty zotero.bib ${ASSETS} ${CHAPTERS}
	docker run --rm \
		-v "${CURDIR}:/workdir" \
		-e TEX_UID=$$(id -u) \
		thesis-tex \
		latexmk -output-directory=build -xelatex thesis.tex
