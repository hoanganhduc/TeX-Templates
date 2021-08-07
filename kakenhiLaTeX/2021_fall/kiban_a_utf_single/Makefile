all: main

headers:
	cd subject_headers && for i in 1 2 3 4; do pdflatex "kiban_a_header_0$$i" ; rm -rf *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.eps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~ ; done && cd ..
	
main: kiban_a.pdf

%.pdf: %.tex
	@latexmk $<
	
clean:
	@latexmk -c
	@rm -rf *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.eps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~
