# zbmath-review-template

This package contains the class zbMATH, which is used for reviews on [zbMATH Open](https://zbmath.org/). It has to be compiled using XeLaTeX.

## Instruction

Load the class zbMATH via

    \documentclass{zbMATH}

Use the commands
    
    \title{<title of the reviewed article>}
    \author{<authors of the reviewed article>}

to set the title and author information of the article under review. 
The title and footer of your review are generated via

    \maketitle
    \makefooter
 
Afterwards, add the text of your review. 
At the end of your review you can add your name using the macro

    \reviewer{<Your Name>}

Optionally, you can add MSC Classes and keywords using 

    \msc{<MSC Classes>}
    \keywords{<keywords>}

where MSC classes are separated by space and keywords are separated by a semicolon ';'.

Finally, compile your .tex file with XeLaTeX.

### Files

The package contains the following files:

* README.md
* zb-basics.sty
* zbMATH.cls
* zb-example.pdf (a sample review document)
* zb-example.tex (tex source of zb-example.tex)
* zb-manual.pdf (a short documentation)
* zb-manual.tex (tex source of zb-manual.pdf)
* figures/screenshot.png (picture used in zb-manual.tex)

### Packages

The following packages are used:

* amsmath, amsfonts, amssymb
* babel
* enumitem
* etoolbox
* fontspec
* gensymb
* geometry
* graphicx
* mathrsfs
* mathtools
* scrartcl
* scrlayer-scrpage
* stmaryrd
* tikz-cd
* textcomp
* xcolor
* xparse

### License

[GNU General Public License, Version 3](https://www.gnu.org/licenses/gpl-3.0.en.html), except of zb-example.tex and zb-example.pdf, which are distributed under [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

### Version History

24 June 2021: Version 2.1


### Contact

Isabel Beckenbach

E-Mail: isabel.beckenbach at fiz-karlsruhe.de