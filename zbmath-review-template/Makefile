all: zb-example.pdf zb-template.pdf zb-manual.pdf
	$(MAKE) clean

%.pdf: %.tex
	@latexmk -xelatex $<

clean:
	@latexmk -c
	@rm -rf *.bbl *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~ *.aux *.blg *.fdb_latexmk *.fls *.log*.synctex* *-blx.bib *.xdv *SAVE-ERROR >/dev/null
	@echo "Junk files removed"