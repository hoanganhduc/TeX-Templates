BASE=paper

all:
	platex $(BASE).tex
#	bibtex $(BASE).aux
#	platex $(BASE).tex
	dvipdfmx $(BASE).dvi
	
clean:
	rm -rf *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.toc *.out *.snm *.nav *.xml *.bcf *~
