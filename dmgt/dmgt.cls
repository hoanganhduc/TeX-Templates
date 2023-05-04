\newcommand \journalacronym{dmgt}
\newcommand \JOURNALACRONYM{DMGT}
\newcommand \volumetitle{Graph Theory}
\newcommand \fullvolumetitle{Discussiones Mathematicae Graph Theory}
\newcommand \voldoinbr{dmgt}
\def\mscyear{2020}


%\def \fileversion{v 1.00}
%\def \filedate{2011/06/11}

%updated 2011-11-08
%\def \fileversion{v 1.01}
%\def \filedate{2011/11/08}

%updated 2011-12-28
%\def \fileversion{v 1.02}
%\def \filedate{2011/12/28}

%updated 2012-03-09
% doi & hyperlinks
%\def \fileversion{v 1.03}
%\def \filedate{2012/03/09}


%updated 2012-05-16
% doi & hyperlinks- simplified (no www version)
%\def \fileversion{v 1.04}
%\def \filedate{2012/05/16}


%updated 2012-12-13
% dedications
%\def \fileversion{v 1.05}
%\def \filedate{2012/12/13}

%updated 2013-02-26
% no emptypage
%\def \fileversion{v 1.06}
%\def \filedate{2013/02/26}


%updated 2013-10-30
% problem with dedications - solved
%\def \fileversion{v 1.07}
%\def \filedate{2013/10/30}

%updated 2013-11-07
% problem with graphicx package - page size - solved
%\def \fileversion{v 1.08}
%\def \filedate{2013/11/07}

%updated 2015-11-18
% added: option noauthorsand
%\def \fileversion{v 1.09}
%\def \filedate{2015/11/18}

%updated 2021-02-01
% doi display format changed
%\def \fileversion{v 1.10}
%\def \filedate{2021/02/01}

%updated 2021-05-11
%new kinds of bibitem*
%\def \fileversion{v 1.11}
%\def \filedate{2021/05/11}

%updated 2021-06-25
%problem with last page for short version -> solved
%possibility of change for MSC Year
%\def \fileversion{v 1.12}
%\def \filedate{2021/06/25}

%updated 2023-02-27
%watermarks for Withdrawn and Proof
%MSC: 2010 -> 2020 (for all editorial boards; except PS)
\def \fileversion{v 1.13}
\def \filedate{2023/02/27}


\def \docdate{\filedate}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\journalacronym}[\filedate \space \fileversion \space \JOURNALACRONYM Paper class]


\newif\if@thmsec
\@thmsecfalse
\newif\if@dntnbr
\@dntnbrfalse
\newif\if@note
\@notefalse
\newif\if@prblcol
\@prblcolfalse

\newif\if@nolinenbrs
\@nolinenbrsfalse

\newif\if@noauthorsand
\@noauthorsandfalse


\DeclareOption{thmsec}{\@thmsectrue}
\DeclareOption{dntnbr}{\@dntnbrtrue}
\DeclareOption{note}{\@notetrue}
\DeclareOption{prblcol}{\@prblcoltrue}
\DeclareOption{nolinenbrs}{\@nolinenbrstrue}
\DeclareOption{noauthorsand}{\@noauthorsandtrue}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\DeclareOption*{\ClassWarningNoLine{\journalacronym}{Unknown option `\CurrentOption'}}
\ProcessOptions

\LoadClass[leqno,twoside,11pt]{article}

\def\reusesizes{
\usepackage[a4paper]{geometry}
\setlength{\textheight}{19.8cm}
\setlength{\textwidth}{13.5cm}
\setlength{\oddsidemargin}{1.2cm}
\setlength{\evensidemargin}{1.2cm}
\setlength{\topmargin}{1.65cm} 
}

\reusesizes

\def\@shortversion{0}
\def\@pslinks{0}
\def\@startpage{1}
\def\@volnbr{xx}
\def\@volyear{xxxx}
\def\@mylastpage{1}
\def\@doidmprefix{10.7151/}
\def\@doiprefixurl{https://doi.org/}
\def\@artdoi{1xxx}
\def\@doiset{0}
\def\@thxset{0}


\usepackage{section}
\usepackage{amsthm}
\usepackage[overload]{textcase}
\usepackage{setspace}
\usepackage{amssymb}
\usepackage{lineno}
\usepackage{verbatim} 
\usepackage{xstring} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% komendy zwi¹zane z hyperlinkami
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\IfFileExists{pslinks.ind}{\def\@pslinks{1}}{\def\@pslinks{0}}

\newcommand\strRep[1]{\noexpandarg\StrSubstitute{#1}{_}{\_}}

\usepackage{ifpdf}

\newcount\@doiinternalnumber	\@doiinternalnumber=1
\newcount\@doiinternalcountdp \newcount\@doiinternalcountwd \newcount\@doiinternalcountht 
%
% for ordinary tex
%
\ifpdf
% LaTeX => PDF
\def\rgbo#1#2{\rgboo{#1}#2\rgboo{0 0 0}}
\def\rgboo#1{\pdfliteral{#1 rg #1 RG}}
%\def\rgb#1#2{\mark{#1}\rgbo{#1}{#2}\mark{0 0 0}}
\def\rgb#1#2{\rgbo{#1}{#2}}
\pdfcatalog{/PageMode /UseOutlines}		% bookmark window open
\def\pdfklink#1#2{%
	\noindent\pdfstartlink user
		{/Subtype /Link
		/Border [ 0 0 0 ]
		/A << /S /URI /URI (#2) >>}{\rgb{0 0 0}{#1}}%
	\pdfendlink}
\else		
% LaTeX => PS => PDF
\def\rgboo#1{\special{color rgb #1}}
\def\rgbo#1#2{\rgboo{#1}#2\rgboo{0 0 0}}
%\def\rgb#1#2{\mark{#1}\rgbo{#1}{#2}\mark{0 0 0}}
\def\rgb#1#2{\rgbo{#1}{#2}}
\def\postscript#1{\special{" #1}}		% for dvips
\def\pdfklink#1#2{%
	\hskip-.25em\setbox0=\hbox{#1}%
		\@doiinternalcountdp=\dp0 \@doiinternalcountwd=\wd0 \@doiinternalcountht=\ht0%
		\divide\@doiinternalcountdp by65536 \divide\@doiinternalcountwd by65536%
			\divide\@doiinternalcountht by65536%
		\advance\@doiinternalcountdp by1 \advance\@doiinternalcountwd by1%
			\advance\@doiinternalcountht by1%
		\def\linkdp{\the\@doiinternalcountdp} \def\linkwd{\the\@doiinternalcountwd}%
			\def\linkht{\the\@doiinternalcountht}%
	\postscript{
		[ /Rect [ -1.5 -\linkdp.0 0\linkwd.0 0\linkht.5 ] 
		/Border [ 0 0 0 ]
		/Action << /Subtype /URI /URI (#2) >>
		/Subtype /Link
		/ANN pdfmark}{\rgb{0 0 0}{#1}}}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% for backward compability
\def\setwwwversion#1{
\def\@dummyvalue{#1}
}



\ifodd\@pslinks%
\def\@internaldoi#1{\strRep{#1}}%
\else%
\def\@internaldoi#1{\pdfklink{\@doiprefixurl#1}{\@doiprefixurl#1}}%
\fi

\def\@dispartdoi{\@internaldoi{\@doidmprefix\voldoinbr.\@artdoi}}

\newwrite\lastpagefile

\IfFileExists{short.ind}{\def\@shortversion{1}}{\def\@shortversion{0}}
\IfFileExists{\jobname.lpg}{\input{\jobname.lpg}}{}


\def\thx#1{\def\@thxset{1}\def\@thanks{#1}}
\def\thx#1#2{\def\@thxset{1}\def\@thanks{\parbox{#1}{#2}}}

\secpreskp2.0\baselineskip plus .05\baselineskip minus.05\baselineskip
\secpreskp-\secpreskp
\subpreskp1.0\baselineskip plus .05\baselineskip minus.05\baselineskip

\def\section{\@startsection{section}{\@ne}{\secindent}{\secpreskp}{\secpstskp}{\sc\centering}}
\def\subsection{\@startsection{subsection}{\tw@}{\subindent}{\subpreskp}{\subpstskp}{\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\subindent}{\subpreskp}{\subpstskp}{\bf}}
%\def\paragraph{\@startsection{paragraph}{4}{\subindent}{\subpreskp}{\parpstskp}{\small\hdfnt}}
%\def\subparagraph{\@startsection{subparagraph}{5}{\parindent}{\subpreskp}{\parpstskp}{\smallsize}} 


\def\hddot{.} % after inline headings, theorems etc
\def\cpdot{.} % in figure/table captions - also apears in list of figures
\def\nmdot{.} % after section numbers etc

\def\fnum@figure{\small{\figurename~\thefigure\cpdot}}
\def\fnum@table{\small{\tablename~\thetable\cpdot}}


\let\startcomms=\comment
\let\endcomms=\endcomment

\newenvironment{artbody}{\ifodd\@shortversion\startcomms\else\fi}{%  
\ifodd\@shortversion\endcomms\else\fi}
%\newenvironment{mycomms}{}{}

% regular proof end
\def\proofendx{\hfill\rule{2mm}{2mm}}

% nested proof end
\def\proofendy{\whiteged}

%\newtheoremstyle{stylename}% name of the style to be used
%  {spaceabove}% measure of space to leave above the theorem. E.g.: 3pt
%  {spacebelow}% measure of space to leave below the theorem. E.g.: 3pt
%  {bodyfont}% name of font to use in the body of the theorem
%  {indent}% measure of space to indent
%  {headfont}% name of head font
%  {headpunctuation}% punctuation between head and body
%  {headspace}% space after theorem head; " " = normal interword space
%  {headspec}% Manually specify head


%% komendy z amsthm odpowiadaj¹ce za wygl¹d nag³ówka twierdzenia
\def\thmhead@plain#1#2#3{%
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
  \thmnote{ {\the\thm@notefont{#3}}}}
\let\thmhead\thmhead@plain
\def\swappedhead#1#2#3{%
  \thmnumber{#2}%
  \thmname{\@ifnotempty{#2}{~}#1}%
  \thmnote{ {\the\thm@notefont{#3}}}}
\let\swappedhead@plain=\swappedhead



%\newcommand{\whiteged}{\hfill$\square$}
\newcommand{\whiteged}{\hfill\framebox[2.1mm][2mm]{}}
%% komenda z amsthm odpowiadaj¹ca za œrodowisko proof
%% przedefiniowana tak, aby zawsze tekst by³ wyœwietlany
%% podgrubionym italikiem
\renewenvironment{proof}[1][\proofname]{\par
  \ifnum \theproofcount>0 \pushQED{\proofendy} \else \pushQED{\proofendx} \fi%
  \refstepcounter{proofcount}
  %
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    {\bf\em #1\@addpunct{.}}]\ignorespaces
}{%
  \addtocounter{proofcount}{-1}
  \popQED\endtrivlist\@endpefalse
}

\theoremstyle{plain}

\if@thmsec
  	\newtheorem{theorem}{Theorem}[section]
\else
   \newtheorem{theorem}{Theorem}
\fi


\newtheorem{claim}[theorem]{Claim}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{prop}[theorem]{Proposition}
\newtheorem{obs}[theorem]{Observation}
\newtheorem{cor}[theorem]{Corollary}
\newtheorem{con}[theorem]{Conjecture}


\theoremstyle{definition}

\if@dntnbr
  \newtheorem{dnt}[theorem]{Definition}
\else
  \newtheorem*{dnt}{Definition}
\fi


%\theoremstyle{remark}
\newtheorem{exm}[theorem]{Example}
\newtheorem{rem}[theorem]{Remark}
\newtheorem{note}[theorem]{Note}
\newtheorem{prb}[theorem]{Problem}

\def\title#1{%
  \def\@@papertitle{#1}
  \def\@papertitle{\uppercase{#1}}
  \@ifnextchar [{\@xtitle}{\@@xtitle}
}

\def\@xtitle[#1]{%
   \def\@sectitle{\sc #1}
}

\def\@@xtitle{%
   \def\@sectitle{\sc \@@papertitle}   
}

\def\keywords#1{\def\@keywords{#1}}
\def\classnbr#1{\def\@classnbr{#1}}


\def\@keywords{no keywords}
\def\@classnbr{no numbers}


\newcounter{author}  %%  tworzy licznik o nazwie 'theauthor'
\newcounter{inside}  %%  tworzy wewnetrzny licznik do innych wyliczen
\newcounter{proofcount} %% liczymy poziom zabg³êbieia dowodów

%% dodaje nowego autora definiujac:
%%    - authornameI
%%    - shortnameI
%%    - authorfromI
%% gdzie I jest kolejnym numerem

\def\newauthor#1#2#3{%
  \refstepcounter{author}
  \@namedef{authorname\theauthor}{#1}
  \@namedef{shortname\theauthor}{#2}
  \@namedef{authorfrom\theauthor}{#3}
  \@ifnextchar [{\@addemail}{\@@addemail}
}

\def\@addemail[#1]{%
  \@namedef{emailok\theauthor}{1}
  \@namedef{email\theauthor}{#1}
}

\def\@@addemail{%
  \@namedef{emailok\theauthor}{0}
  \@namedef{email\theauthor}{}
}

%% dodanie tuty³u pracy
\def\papertitle#1{%
  \def\@@papertitle{#1}
  \def\@papertitle{\uppercase{#1}}
  \@ifnextchar [{\@xtitle}{\@@xtitle}
}

\def\@xtitle[#1]{%
   \def\@sectitle{\sc #1}
}

\def\@@xtitle{%
   \def\@sectitle{\sc \@@papertitle}   
}

\@ifundefined{mscyear}{\def\mscyear{2010}{}}


\def\authors{%
 \ifnum \theauthor < 1
    \typeout{Authors undefined}
 \else
   \setcounter{inside}{1}
   \par
   \@whilenum \theinside < \theauthor \do{%
     \normalsize
     {\noindent\sc
       \begin{spacing}{1.7}
         \@nameuse{authorname\theinside}
       \end{spacing}
     }  
     \par
%     \smallskip        
     {\noindent \small\it \@nameuse{authorfrom\theinside}}\\
     \ifnum \@nameuse{emailok\theinside} > 0
        \smallskip
        \noindent 
        \small         
        {\bf e-mail:} \hspace{-3mm}
        {\rm
           \begin{tabular}[t]{l}
             \@nameuse{email\theinside}
           \end{tabular}   
        }  
     \fi
     \refstepcounter{inside}
   }
   \ifnum \theauthor>1     
     \noindent
     \bigskip
     \normalsize
     \par 
		  \if@noauthorsand \else {\sc and} \\ \fi
     \smallskip
   \else
     \bigskip
   \fi
   \normalsize
   {\noindent\sc
     \begin{spacing}{1.7}
       \@nameuse{authorname\theinside}
     \end{spacing}
   }
   \par
   \small
   {\noindent \small\it \@nameuse{authorfrom\theinside}}\\
   \par
   \ifnum \@nameuse{emailok\theinside} > 0
      \smallskip
      \noindent 
      \small 
      {\bf e-mail:} \hspace{-3mm}
      {\rm
         \begin{tabular}[t]{l}
           \@nameuse{email\theinside}
         \end{tabular}   
      }  
   \fi
 \fi
 \normalsize \rm
}


%% nazwiska umieszczane w naglowku strony
%% UWAGA: jest to komenda "krucha" i przy jej uzyciu zaleca sie
%% stosowanie komendy \protect, np. w komendzie \markboth
\def\authornames{%
 \ifnum \theauthor < 1
    \typeout{Authors undefined}
 \else
   \setcounter{inside}{1}
     \@whilenum \theinside < \theauthor \do{\@nameuse{shortname\theinside}\refstepcounter{inside}\ifnum\theinside<\theauthor{, }\fi}\ifnum \theauthor>1\if@noauthorsand{, }\else{ and }\fi\fi     \@nameuse{shortname\theinside}\fi
 \normalsize \rm
}


\def\endabstract{%
\par
\smallskip
\noindent
{\bf Keywords:\ }\@keywords. \
\par
\smallskip
\noindent
{\bf \mscyear{} Mathematics Subject Classification:\ }\@classnbr.
\if@twocolumn\else\endquotation\fi\medskip%
%\artbody
}

\AtBeginDocument{%
\if@nolinenbrs \else \linenumbers \fi
\thispagestyle{empty}
\ifodd\@shortversion
\pagestyle{empty}
\else
\pagestyle{myheadings}
\fi  
\setcounter{page}{\@startpage}
\vspace*{-1.8cm}
\if@prblcol
\begin{sc}
\noindent Problems Column
\end{sc}
\vspace*{0.8cm}
\par
\fi
\begin{sl}
\noindent Discussiones Mathematicae \\
\ifodd\@shortversion{
\ifdefined\@myextralastpage
\noindent \volumetitle{} \@volnbr{} {\rm (}\@volyear{}\/{\rm )} \thepage--\@myextralastpage\\
\else
\noindent \volumetitle{} \@volnbr{} {\rm (}\@volyear{}\/{\rm )} \thepage--\@mylastpage\\
\fi
}
\else
\noindent \volumetitle{} \@volnbr{} {\rm (}\@volyear{}\/{\rm )} \thepage--\pageref{@lastpage}\\
\fi
\ifodd\@doiset
\noindent\@dispartdoi
\else
\ 
\fi
\end{sl}
\ifodd\@thxset
\newline\newline\parbox{13cm}{\vspace{0.2cm}{\small \it \@thanks}}
\else
\fi
\begin{center}
\if@note{
\vspace*{0.2cm}
\begin{sc}
\noindent Note
\end{sc}
\vspace*{0.6cm}
\par
}
\else
\vspace*{1.25cm}
\fi
{\large\bf\@papertitle}
\medskip
\authors
\medskip
\end{center}
\markboth{\sc \protect\authornames}{\sc {\@sectitle}}
\setlength{\parindent}{20pt}
}

%\ifx#1\relax%
%\immediate\write\lastpagefile{\noexpand\def\noexpand\@myextralastpage{#1}}%
%\else%
%\immediate\write\lastpagefile{\noexpand\def\noexpand\@myextralastpage{??}}%
%\fi

\def\@savelastpage#1{
\immediate\openout\lastpagefile=\jobname.lpg
\immediate\write\lastpagefile{\noexpand\def\noexpand\@myextralastpage{#1}}%
\immediate\write\lastpagefile{\noexpand\endinput}
\immediate\closeout\lastpagefile
}


\AtEndDocument{%
\label{@lastpage}
\ifodd\@shortversion
\else%
\@savelastpage{\thepage}%
\fi  
}

\def\setshortversion#1{
\def\@shortversion{#1}
}



\def\@setlastpage[#1]{\def\@mylastpage{#1}}


\def\setarticle#1#2#3{%
\def\@startpage{#1}
\def\@volnbr{#2}
\def\@volyear{#3}
\@ifnextchar [{\@setlastpage}{}
}


\def\setdoi#1{
\def\@artdoi{#1}
\def\@doiset{1}
}

\usepackage{url}
\urlstyle{rm}

\ifodd\@pslinks%
\def\doi#1{\strRep{#1}}%
\else%
\def\doi#1{\pdfklink{\@doiprefixurl\strRep{#1}}{\@doiprefixurl\detokenize{#1}}}%
\fi

\def\@savedurl{\empty}

\def\xtrim#1{\ignorespaces#1\unskip} 
\newcommand{\tst}[1][]{\ifx&#1&{}\else{, \xtrim{#1}}\fi.}
\newcommand{\tsturl}[1][]{\ifx&#1&{}\else{, \xtrim{#1}}\fi.{\\}{\pdfklink{\strRep{\detokenize\expandafter{\@savedurl}}}{\detokenize\expandafter{\@savedurl}}}\def\@savedurl{\empty}}
\newcommand{\tstarxiv}[1][]{\ifx&#1&{}\else{, \xtrim{#1}}\fi.{\\}{\pdfklink{arXiv:\strRep{\@savedurl}}{https://arxiv.org/abs/\detokenize\expandafter{\@savedurl}}\def\@savedurl{\empty}}}

%\ifx&#1&{}\else{}


%\bibitemart{#1=name}{#2=authors}{#3=title}{#4=czasopismo}{#5=wolumen}{#6=rok}{#7=strony}
%%\ifx&#6&{}\else{(\xtrim{#6})} 
\newcommand{\bibitemart}[7]{\bibitem{#1} \xtrim{#2}, {\it \xtrim{#3}}\/, \xtrim{#4} {\bf \xtrim{#5}} \ifx&#6&{}\else{(\xtrim{#6}) }\fi \xtrim{#7}\tst}
%\bibiteminpress{#1=name}{#2=authors}{#3=title}{#4=czasopismo}{#5=rok}
\newcommand{\bibiteminpress}[5]{\bibitem{#1} \xtrim{#2}, {\it \xtrim{#3}}\/, \xtrim{#4}\ifx&#5&{}\else{ (\xtrim{#5})}\fi, in-press\tst}
%\bibitembook{#1=name}{#2=authors}{#3=title}{#4=publisher}{#5=year}
\newcommand{\bibitembook}[5]{\bibitem{#1} \xtrim{#2}, \xtrim{#3} (\xtrim{#4}, \xtrim{#5})\tst}
%\bibitemproc{#1=name}{#2=authors}{#3=title}{#4=procname}{#5=editors}{#6=publisher}{#7=rok}{#8=strony}
\newcommand{\bibitemproc}[8]{\bibitem{#1} \xtrim{#2}, {\it \xtrim{#3}}\/, in: \xtrim{#4}, %
%editors
\ifx&#5&{}\else{\xtrim{#5} (Ed(s)), }\fi %
(\xtrim{#6}%
%year
\ifx&#7&{}\else{, \xtrim{#7}}\fi)%
%pages
\ifx&#8&{}\else{ \xtrim{#8}}\fi%
\tst}

%\@bibitemrem{#1=name}{#2=authors}{#3=title}{#4=year}{#5=separator}{#6=remarks} <- komenda "wewnêtrzna"
\newcommand{\@bibitemrem}[6]{\bibitem{#1} \ifx&#2&{\it \xtrim{#3}}\else{#2\ifx&#3&{}\else{, \it \xtrim{#3}}\fi}\fi\ifx&#3&{}\else{\/}\fi \ifx&#4&{}\else{ (\xtrim{#4})}\fi{#5}\xtrim{#6}}
%\bibitemrem{#1=name}{#2=authors}{#3=title}{#4=year}{#5=remarks}
\newcommand{\bibitemrem}[5]{\@bibitemrem{#1}{#2}{#3}{#4}{, }{#5}\tst}
%\bibitemman{#1=name}{#2=authors}{#3=title}{#4=year}
\newcommand{\bibitemman}[4]{\@bibitemrem{#1}{#2}{#3}{#4}{, }{manuscript}\tst}
%\bibitemurl{#1=name}{#2=authors}{#3=title}{#4=year}{#5=url}
%\newcommand{\bibitemurl}[5]{\@bibitemrem{#1}{#2}{#3}{#4}{.\\}{\pdfklink{\strRep{#5}}{\detokenize{#5}}}}
%\newcommand{\bibitemurlp}[5]{#1 #2 #3 #4 \def\@savedurl{#5}\tstp}
\newcommand{\bibitemurl}[5]{\bibitem{#1} \ifx&#2&{\it \xtrim{#3}}\else{#2\ifx&#3&{}\else{, \it \xtrim{#3}}\fi}\fi\ifx&#3&{}\else{\/}\fi \ifx&#4&{}\else{ (\xtrim{#4})}\fi\def\@savedurl{#5}\tsturl}
\newcommand{\bibitemarxiv}[5]{\bibitem{#1} \ifx&#2&{\it \xtrim{#3}}\else{#2\ifx&#3&{}\else{, \it \xtrim{#3}}\fi}\fi\ifx&#3&{}\else{\/}\fi \ifx&#4&{}\else{ (\xtrim{#4})}\fi\def\@savedurl{#5}\tstarxiv}



%% przeniesione od pani Izy
\def\thebibliography#1{\begin{center}
%\endartbody
{{\sc References}\vspace{-.3em}\vspace{0pt}}
\end{center}
\list{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin
\labelwidth
\advance\leftmargin\labelsep
\usecounter{enumi}}
\def\newblock{\hskip .11em plus .33em minus .07em}
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax}

%%%%%%%%%%%%%%%%%%%%
%% todo ??????
%%%%%%%%%%%%%%%%%%%%


\footskip=30pt \vspace{5cm}
\renewcommand{\thefootnote}{\arabic{footnote}}

\newcommand{\setwithdrawn}{
\usepackage{xcolor}
\usepackage{draftwatermark}
\SetWatermarkText{\textbf{\textsc{Withdrawn}}} 
\SetWatermarkScale{5} 
\SetWatermarkColor{blue!30} 
\SetWatermarkAngle{65} 
}

\newcommand{\setproof}{
\usepackage{xcolor}
\usepackage{draftwatermark}
\SetWatermarkText{\textbf{\textsc{P\,r\,o\,o\,f}}} 
\SetWatermarkScale{6} 
\SetWatermarkColor{blue!20}
\SetWatermarkAngle{65} 
}