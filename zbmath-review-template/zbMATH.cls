% Copyright 2021 by FIZ-Karlsruhe
%
% This file is part of the ctan package zbmath-review-template
% and may be distributed and/or modified under the
% conditions of the GNU General Public License, version 3:
%
% https://www.gnu.org/licenses/gpl-3.0.en.html
%
% It defines the class zbMATH.
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zbMATH}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scartcl}}
\ProcessOptions\relax

\LoadClass[a4paper,10pt,leqno]{scrartcl}

\RequirePackage[margin=2.5cm,tmargin=2cm,bmargin=3cm]{geometry}

\RequirePackage{xcolor}

\RequirePackage[UKenglish]{babel}

\RequirePackage{scrlayer-scrpage}

\RequirePackage{graphicx}
\RequirePackage{enumitem}

\RequirePackage{xparse}
\RequirePackage{etoolbox}

\RequirePackage[hyphens]{url}

% Font selection 
\RequirePackage[no-math]{fontspec}
\setmainfont{cmun}[
  Extension      = .otf,
  UprightFont    = *rm,
  BoldFont       = *bx,
  ItalicFont     = *ti,
  BoldItalicFont = *ti,
  SlantedFont    = *sl,
  SmallCapsFont  = *rm,
  SmallCapsFeatures = {Letters=SmallCaps},
]

\RequirePackage{zb-basics}

% make footer
\newcommand{\makefooter}{
    \pagestyle{scrheadings}
\setkomafont{pageheadfoot}{
  \rmfamily
  \footnotesize
  \color[rgb]{.5,.5,.5}
}
\lofoot{%
  \makebox[\linewidth][s]{Edited by FIZ Karlsruhe, the European Mathematical Society and the Heidelberg Academy of Sciences and Humanities}\\
  \copyright{} \the\year{} FIZ Karlsruhe GmbH
}
\cofoot{}
\rofoot{\\Page \thepage}

\setlength{\parindent}{0cm}
\setlength{\parskip}{1ex}
\setlength{\parfillskip}{0pt plus 1fill}
\setlength{\footheight}{19pt}
}

% write text in zbMath Blue
\definecolor{zbMATHBlue}{rgb}{0, 0.289, 0.6}
\newcommand{\blue}[1]{\textcolor{zbMATHBlue}{#1}}

% make title
\renewcommand{\maketitle}{
    \vspace{7ex}
    \noindent {\bfseries \blue{\@author}}\\
    \textbf{\@title.}\\
    \vspace{2ex}
}

% Helper macros
\providetoggle{first}
\toggletrue{first}
\newcommand{\helper}[1]{%
    \iftoggle{first}{\blue{#1}\togglefalse{first}}{; \blue{#1}}%
}
\NewDocumentCommand{\kwx}{>{\SplitList{;}}m}{
    \ProcessList{#1}{\helper}
}

% Keywords
\newcommand{\keywords}[1]{
    \vspace{2ex}
    \textbf{Keywords:}\par\nopagebreak
    \kwx{#1}
}

% MSC
\newsavebox{\citationbox}
\newdimen{\msclen}
\NewDocumentCommand{\msc}{>{\SplitList{ }}m}{
\vspace{2ex}
\msclen=\textwidth
\advance\msclen by -\wd\citationbox
\advance\msclen by -5em
\textbf{MSC:}\par\nopagebreak
\begin{tabular}[t]{@{}lp{\msclen}}
    \ProcessList{#1}{\blueitem}
\end{tabular}
}
\newcommand\blueitem[1]{\textcolor{zbMATHBlue}{#1}\\}

% Reviewer
\newcommand{\reviewer}[1]{
    \par\nopagebreak\hspace*{0pt plus 1filll} Reviewer: \blue{#1}
}

\frenchspacing
