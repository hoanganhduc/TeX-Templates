all: main

headers:
	cd subject_headers && for i in 1 2 3; do pdflatex "tokusui-3_header_0$$i" ; rm -rf *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.eps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~ ; done && cd ..
	
main: en_tokusui-3.pdf

en_%.pdf: en_%.tex %_*.tex
	@latexmk $<
	
clean:
	@latexmk -c
	@rm -rf *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.eps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~
