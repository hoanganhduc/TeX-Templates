all: main
	
main: en_tokusui-1.pdf

%.pdf: %.tex
	@latexmk $<
	
clean:
	@latexmk -c
	@rm -rf *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.eps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~
