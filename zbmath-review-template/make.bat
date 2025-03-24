@echo off

call :all
goto :eof

:all
call :make_pdf zb-example.tex
call :make_pdf zb-template.tex
call :make_pdf zb-manual.tex
call :clean
goto :eof

:make_pdf
echo Building %~n1.pdf...
latexmk -xelatex %1
goto :eof

:clean
echo Cleaning up junk files...
latexmk -c
del /q *.bbl *.dvi *.log *.bak *.aux *.blg *.idx *.ps *.toc *.out *.snm *.nav *.xml *.bcf *.spl *.synctex.gz *~ *.aux *.blg *.fdb_latexmk *.fls *.log*.synctex* *-blx.bib *.xdv *SAVE-ERROR 2>nul
echo Junk files removed
goto :eof