NAME=main

all: $(NAME).pdf

%.pdf: %.tex custom-defs.tex refs.bib
	@latexmk -pdf $<

clean:
	@latexmk -c
	@rm -rf *.bbl *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.eps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~ *.aux *.blg *.fdb_latexmk *.fls *.log

