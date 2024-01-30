.PHONY: default clean

ASSETS := uvalogo.pdf UvaLogoTekst.pdf uvamath.cls

default: build/thesis.pdf

clean:
	rm -rf build/

build/thesis.pdf: thesis.tex ${ASSETS}
	docker run --rm \
		-v "${CURDIR}:/workdir" \
		-e TEX_UID=$$(id -u) \
		--entrypoint=/workdir/Docker/entrypoint.sh \
		texlive/texlive latexmk -output-directory=build -xelatex thesis.tex
