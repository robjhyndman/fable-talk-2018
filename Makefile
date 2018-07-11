PDFS:=$(patsubst %.Rmd,%.pdf,$(wildcard *.Rmd))
TEXS:=$(patsubst %.Rmd,%.tex,$(wildcard *.Rmd))
TEXFILES:=$(wildcard *.tex) $(wildcard *.sty) $(wildcard *.cls)

all: $(PDFS)

%.pdf: %.Rmd $(TEXFILES)
	Rscript -e "rmarkdown::render('$*.Rmd')"

clean:
	latexmk -c
	rm -fv *.pdf
	rm -rf *_cache
	rm -rf *_files
