%% epsilon.cls - Version 1.0
%% based on standard LaTeX article class
%%
%%
%% History:
%% - Updated on 13 July 2016, added custom abstract
%% - Created on 1 July 2016 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epsilon}[2016/07/01  v1.0 Epsilon Magazine class]

\LoadClassWithOptions{article}  % build on standard article class
\RequirePackage[svgnames]{xcolor}	% For color names
%\RequirePackage[vietnam]{babel}
\RequirePackage{vntex}
\RequirePackage{times} 
\RequirePackage{titlesec}
\RequirePackage[unicode]{hyperref}
\RequirePackage[width=16cm, height=24cm, top=3cm]{geometry}

\hypersetup{colorlinks, linkcolor = Black, urlcolor = DarkRed, linktoc = all}

\titleformat{\section}
  {\epsilonSectionColor\usefont{T5}{cmss}{bx}{n}\Large}
  {\thesection.}{0.5em}{}
\titleformat{\subsection}
  {\epsilonSectionColor\usefont{T5}{cmss}{bx}{n}\large}
  {\thesubsection.}{0.5em}{}
\titleformat{\subsubsection}
  {\epsilonSectionColor\usefont{T5}{cmss}{bx}{n}\large}
  {\thesubsubsection.}{0.5em}{}

%\headheight 0in \headsep 0in      % avoid extra space for header
\pagestyle{empty}                 % no page numbers is default
\setlength{\parskip}{2ex plus 1ex minus 0.3ex} % spacing between paragraphs
\date{}                           % avoid date

%% Color definitions
\newcommand\epsilonTitleColor{\color{red!100!blue!50!black!75!}}
\newcommand\epsilonSectionColor{\color{red!80!yellow!70!}}
\newcommand\epsilonAuthorColor{\color{black!80!}}
\newcommand\epsilonHighlightColor{\color{red!80!}}
\newcommand\epsilonAbstractColor{\color{brown!100!black!120!}}

\newcommand{\epsilonHighlightFont}{\usefont{T5}{iwona}{l}{n}}
\newcommand{\epsilonTermFont}{\usefont{T5}{cmss}{sl}{n}}


\def\maketitle{\clearpage\@maketitle\thispagestyle{empty}}
\def\title#1{\gdef\@title{\epsilonTitleColor\scshape #1}} 
\def\author#1{\gdef\@author{\epsilonAuthorColor\ #1}} 
\def\abstract{	
	\centering
	\hspace{0.075\textwidth}
	\begin{minipage}{0.85\textwidth}
		\begin{center}
			\epsilonAbstractColor \large \scshape Tóm tắt
			%\ifthenelse{\equal{#1}{}}{Giới thiệu}{#1}
		\end{center}
		\setlength{\parskip}{1ex plus 1ex minus 0.3ex} 
		\small
}

\def\newAbstract#1{	
	\centering
	\hspace{0.075\textwidth}
	\begin{minipage}{0.85\textwidth}
		\begin{center}
			\epsilonAbstractColor \large \scshape  
			\ifthenelse{\equal{#1}{}}{Giới thiệu}{#1}
		\end{center}
		\setlength{\parskip}{1ex plus 1ex minus 0.3ex} 
		\small
}

\def\endabstract{
	\end{minipage}
}

\def\endnewAbstract{
	\end{minipage}
}

\parindent = 0pt