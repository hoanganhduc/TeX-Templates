%%
%% This is file `beatcs.cls' version 1.0
%%
%% DON'T PANIC: IT IS ESSENTIALLY article.cls
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{beatcs}
              [2003/09/21 v0.9alpha
 Bulletin EATCS document class]
\if@compatibility
 \errmessage{LaTeX 2.09 `documentstyle' not supported}
 \let\vs@trick\stop
\else
 \let\vs@trick\relax
\fi
\vs@trick
%
\newif\if@beatcs@final
\@beatcs@finalfalse
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{article}%
%                      \PassOptionsToClass{pdftex}{graphicx}%
                      \@beatcs@finaltrue}
\DeclareOption{leqno}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{fleqn}{\PassOptionsToClass{\CurrentOption}{article}}
%\DeclareOption{openbib}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{screen}{\PassOptionsToPackage{colorlinks}{hyperref}}
%\DeclareOption{pdftex}{\PassOptionsToPackage{pdftex}{hyperref}%
%                       \PassOptionsToPackage{pdftex}{graphicx}}
%
\ProcessOptions\relax
%
\LoadClass[a4paper,12pt,oneside,onecolumn]{article}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
%\RequirePackage{url}
\RequirePackage{graphicx}
\RequirePackage{txfonts}
\RequirePackage[T1]{fontenc}
\RequirePackage[a4paper]{hyperref}
%
\flushbottom
%
%
\long\def\beatcsColumn#1#2{%
 \def\col@title{\csname col@#1@title\endcsname}%
 \def\col@editor{\csname col@#1@editor\endcsname}%
 \def\col@address{\csname col@#1@address\endcsname}%
 \def\col@url{\csname col@#1@url\endcsname}%
  \null
  \vskip 2em%
  \begin{center}%
    {\sffamily\bfseries\scshape
     {\LARGE\col@title\par}%
    \vskip 0.8em%
     {\large by \par}%
    \vskip 0.8em%
     {\Large\col@editor\par}%
    }
    \vskip 1em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \col@address\\
        \col@url
      \end{tabular}}%
  \end{center}%
  \vskip 1em%
 {\sffamily#2}\par\noindent\ignorespaces
}
%
\def\col@specification@title{The Formal Specification Column}
\def\col@specification@editor{Hartmut Ehrig}
\def\col@specification@address{%
 \href{http://www.cs.tu-berlin.de}{Technical University of Berlin,
   Department of Computer Science}\\  
  Franklinstra\ss e 28/29, D-10587 Berlin, Germany}
\def\col@specification@url{\url{ehrig@cs.tu-berlin.de}}
%
\def\col@complexity@title{The Computational Complexity Column}
\def\col@complexity@editor{Vikraman Arvind}
\def\col@complexity@address{%
 \href{http://www.imsc.res.in}{Institute of Mathematical Sciences},	
 \href{http://www.imsc.res.in}{CIT Campus, Taramani}\\	
 Chennai 600113, India}
\def\col@complexity@url{\url{arvind@imsc.res.in}\\	
	\url{http://www.imsc.res.in/~arvind}}
%
\def\col@concurrency@title{The Concurrency Column}
\def\col@concurrency@editor{Nobuko Yoshida}
\def\col@concurrency@address{%	
	\href{http://www.doc.ic.ac.uk/}{Department of Computing}\\	
	\href{http://www.doc.ic.ac.uk/}{Imperial College London}\\ 180 Queen's Gate, London, SW7 2AZ	
}	
\def\col@concurrency@url{\normalsize\url{ n.yoshida@imperial.ac.uk},\quad	
	\url{http://mrg.doc.ic.ac.uk/}}
%
\def\col@security@title{The Security Column}
\def\col@security@editor{Joshua D. Guttman}
\def\col@security@address{%
 \href{http://www.mitre.org}{MITRE}, Mail Stop S119\\ 
  202 Burlington Rd, Bedford, MA 01730-1420 USA}
\def\col@security@url{\url{guttman@mitre.org}}
%
\def\col@proglangIan@title{The Programming Languages Column}
\def\col@proglangIan@editor{Ian Mackie}
\def\col@proglangIan@address{%
 \href{http://www.dcs.kcl.ac.uk}{Department of Computer Science}\\ 
 \href{http://www.kcl.ac.uk}{King's College London}, 
  Strand, London, WC2R 2LS, UK}
\def\col@proglangIan@url{\normalsize\url{Ian.Mackie@kcl.ac.uk},\quad
  \url{http://www.dcs.kcl.ac.uk/staff/ian}}
%
\def\col@proglangDave@title{The Programming Languages Column}
\def\col@proglangDave@editor{David Sands}
\def\col@proglangDave@address{%
 \href{http://www.cs.chalmers.se/Cs/}{Department of Computing Science}\\ 
 Chalmers University of Technology and University of G\"otenborg\\ 
  S-412 96 G\"otenborg, Sweden}
\def\col@proglangDave@url{\normalsize\url{dave@se.chalmers.se},\quad
  \url{http://www.cs.chalmers.se/~dave}}
%
\def\col@naturalcomputing@title{The Natural Computing Column}
\def\col@naturalcomputing@editor{Grzegorz Rozenberg}
\def\col@naturalcomputing@address{%
 \href{http://www.liacs.nl/}{Leiden University},
 \href{http://www.lcnc.nl/}{Leiden Center for Natural Computing}\\
 Niels Bohrweig 1, 2333 CA Leiden, The Netherlands}
\def\col@naturalcomputing@url{\url{rozenber@liacs.nl}}
%
\def\col@formallanguages@title{The Formal Language Theory Column}
\def\col@formallanguages@editor{Giovanni Pighizzini}
\def\col@formallanguages@address{%	
	\href{http://www.tucs.nl/}{Dipartimento di Informatica}\\	
	\href{http:/www.utu.fi}{Universit\`a degli Studi di Milano}\\	
	20135 Milano, Italy}	
\def\col@formallanguages@url{\url{pighizzini@di.unimi.it}}
%
\def\col@logic@title{The Logic in Computer Science Column}
\def\col@logic@editor{Yuri Gurevich}
\def\col@logic@address{%	
	\href{https://cse.umich.edu/}{Computer Science and Engineering}\\	
	\href{http://web.umich.edu/}{University of Michigan, Ann Arbor, MI  48109, USA}	
}	
\def\col@logic@url{\url{gurevich@umich.edu}}
%
\def\col@distributedcomputing@title{The Distributed Computing Column}
\def\col@distributedcomputing@editor{Stefan Schmid}	
\def\col@distributedcomputing@address{%	
	%\href{http://research.microsoft.com/foundations/}{Foundations of Software Engineering},	
	\href{http://www.univie.ac.at/en/}{University of Vienna}\\	
	W\"ahringer Strasse 29, AT - 1090 Vienna, Austria}	
\def\col@distributedcomputing@url{\url{schmiste@gmail.com}}
%%
\def\col@AlgorithmicGameTheory@title{The Algorithmic Game Theory Column}
\def\col@AlgorithmicGameTheory@editor{Marios Mavronicolas}
\def\col@AlgorithmicGameTheory@address{%
 \href{http://www.cs.ucy.ac.cy}{Department of Computer Science},
 \href{http://www.ucy.ac.cy}{University of Cyprus}\\
 75 Kallipoleos St., CY-1678 Nicosia, Cyprus }
\def\col@AlgorithmicGameTheory@url{\url{mavronic@cs.ucy.ac.cy}}
%
\def\col@algorithmics@title{The Algorithmics Column}
%\def\col@algorithmics@editor{Josep D\'\i{}az}
%\def\col@algorithmics@address{%
% \href{http://www.lsi.upc.es/}{Department of Languages and Computer Systems}\\
% \href{http://www.upc.es}{Polytechnical University of Catalunya}\\
% c/ Jodi Girona 1-3, 080304 Barcelona, Spain}
%\def\col@algorithmics@editor{Gerhard J Woeginger}
%\def\col@algorithmics@address{%
%\href{http://www.win.tue.nl}{Department of Mathematics and Computer Science}\\
%\href{http://w3.tue.nl/en/}{Eindhoven University of Technology}\\
%P.O.~Box 513, 5600 MB Eindhoven, The Netherlands}
\def\col@algorithmics@editor{Thomas Erlebach}
\def\col@algorithmics@address{%
	\href{https://www.cs.le.ac.uk/people/te17/}{Department of Informatics}\\
	University of Leicester\\
	University Road,
	Leicester,
	LE1 7RH.}
%\def\col@algorithmics@url{\url{ diaz@lsi.upc.es}}
%\def\col@algorithmics@url{\url{ gwoegi@win.tue.nl}}
\def\col@algorithmics@url{\url{ t.erlebach@leicester.ac.uk}}
%
\def\col@puzzle@title{The Puzzle Corner}
\def\col@puzzle@editor{Laurent Rosaz}
\def\col@puzzle@address{%
	\href{http://www.lri.fr/}{LRI},  Orsay
	\href{http:/www.cnrs.fr}{CNRS}-\href{http://www.u-psud.fr}{Université de Paris Sud}\\
	Bât 490, 91405 Orsay France}
\def\col@puzzle@url{\url{Laurent.Rosaz@lri.fr}}
%
\newdimen\beatcs@dim
%
\long\def\beatcsNews#1{%
 \def\news@title{\csname news@#1@title\endcsname}%
 \def\news@editor{\csname news@#1@editor\endcsname}%
 \def\news@address{\csname news@#1@address\endcsname}%
 \def\news@url{\csname news@#1@url\endcsname}%
 \def\news@pic{beatcs\csname news@#1@pic\endcsname}%
 \def\news@adj{\csname news@#1@adj\endcsname}%
 \def\news@scale{\csname news@#1@scale\endcsname}%
  \null
%  \vskip 2em%
  \begin{center}%
    {\ttfamily\bfseries\scshape
     \setbox\@tempboxa\hbox{\LARGE\news@title}
     \beatcs@dim 0.5\wd\@tempboxa
     \beatcsRULEto{\beatcs@dim}\unskip\smallskip%
     {\LARGE\usebox\@tempboxa\par}\unskip\smallskip%
    \beatcsRULEto{\beatcs@dim}%
    \vskip 0.8em%
    \begin{tabular}[b]{c}
      \large by\\[1em]
      \Large\news@editor\\[\news@adj]\null
     \end{tabular}%
     \rlap{\qquad\includegraphics[scale=\news@scale]{\news@pic}}}
    \vskip0em%
    {\ttfamily%\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \news@address\\
        \news@url
      \end{tabular}}%
  \end{center}%
\vskip1em\noindent\ignorespaces
}
%
\def\news@au@title{News from Australia}
\def\news@au@editor{C.J.~Fidge}
\def\news@au@address{%
 \href{http://www.itee.uq.edu.au/}{School of Engineering and 
   Data Communications}\\ 
 \href{http://www.qut.edu.au}{Queensland University of Technology},
  Brisbane, Australia}
\def\news@au@url{\url{http://www.fit.qut.edu.au/~fidgec}}
\def\news@au@pic{AU}\def\news@au@adj{3pc}\def\news@au@scale{1}
%
\def\news@in@title{News from India}
\def\news@in@editor{Madhavan Mukund}
\def\news@in@address{%
 \href{http://www.cmi.ac.in}{Chennai Mathematical Institute}\\ 
     Chennai, India}
\def\news@in@url{\url{madhavan@cmi.ac.in}}
\def\news@in@pic{NULL}\def\news@in@adj{-0.8pc}\def\news@in@scale{1}
%
\def\news@irl@title{News from Ireland}
\def\news@irl@editor{Anthony K.~Seda}
\def\news@irl@address{%
  Department of Mathematics,
 \href{http://www.ucc.ie}{National University of Ireland}\\ 
    Cork, Ireland}
\def\news@irl@url{\url{a.seda@ucc.ie}}
\def\news@irl@pic{IRL}\def\news@irl@adj{3pc}\def\news@irl@scale{.45}
%
\def\news@nz@title{News from New Zealand}
\def\news@nz@editor{Cristian S.~Calude}
\def\news@nz@address{%
  \href{http://www.cs.auckland.ac.uk}{Department of Computer Science},
 \href{http://www.cs.auckland.ac.uk}{University of Auckland}\\ 
    Auckland, New Zealand}
\def\news@nz@url{\url{cristian@cs.auckland.ac.nz}}
\def\news@nz@pic{NZ}\def\news@nz@adj{3pc}\def\news@nz@scale{1}
%
\def\news@aml@title{News from Latin America}
\def\news@aml@editor{Alfredo Viola}
\def\news@aml@address{%
	\href{http://www.fing.edu.uy}{Instituto de Computación,
		Facultad de Ingenierìa}\\
	\href{http://www.edu.uy}{Universidad de la República}\\
	Casilla de Correo 16120, Distrito 6,
	Montevideo, Uruguay}
\def\news@aml@url{\url{viola@fing.edu.uy}}
\def\news@aml@pic{AML}\def\news@aml@adj{3pc}\def\news@aml@scale{.85}
%
\newcommand\beatcsEdMat[1]{%
\par\noindent
\parbox[b]{63mm}{\sffamily\bfseries%
% \hspace*{-9pt}
 \fontsize{80}{80}\selectfont E%
 \hspace{-2pt}\fontsize{20}{20}\selectfont d%
 \hspace{-4pt}\fontsize{80}{80}\selectfont M%
 \hspace{-3pt}\fontsize{20}{20}\selectfont at
\vskip1pc
\flushright\Large\sffamily\bfseries 
 Education Matters
}\hfill
\parbox[b]{45mm}{\flushright\large\bfseries
 Hans-Jörg Kreowski\\[1mm]#1}\vspace{6pc}\noindent\ignorespaces}
%
\newcommand\beatcsJpChapStart{%
\noindent\hfil
{\Large\bfseries\scshape
 Report from the Japanese Chapter}
\hfil\vskip1em\noindent\hfill
{{\em K.\ Makino} (Tokyo Univ.)}
\par\vskip1.5em\noindent\ignorespaces}
%
\newcommand\beatcsJpChapClose{%
\par\vskip2em%
\vbox to0pt{\hbox to\linewidth{\hfil\includegraphics[scale=0.6]%
{beatcsJPfl}}\vss}%
\beatcsRule\par
\begin{center}\ttfamily\scshape{\large\bfseries The Japanese Chapter}
\vskip1em\small
\begin{tabular}{ll}
 Chair:&    Kazuo Iwama\\
 V.Chair:&  Osamu Watanabe\\
 Secretary:& Kazuhisa Makino\\
 email:& \url{eatcs-jp@is.titech.ac.jp}\\
 URL:& \url{http://www.misojiro.t.u-tokyo.ac.jp/eatcs-j/}
\end{tabular}
\end{center}
\par\beatcsRule
%\vbox to0pt{\vss\hbox to\linewidth{\hfil\includegraphics[scale=0.6]
%{beatcsJPfl}}\rule[10pt]{0pt}{0pt}}
}
%
\newcommand\beatcsFrChapStart{%
\noindent\hfil
{\Large\bfseries\scshape
 Report from the French Chapter}
\hfil\vskip1em\noindent\hfill
{{\em C.\ Choppy} (CNRS, LIPN Paris 13)}
\par\vskip1.5em\noindent\ignorespaces}
%
\newcommand\beatcsFrChapClose{%
\par\vskip2em%
\vbox to0pt{\rule{0pt}{40pt}\\
\hbox to\linewidth{\hfil\includegraphics[scale=0.6]%
{beatcsFR}}\vss}%
\beatcsRule\par
\begin{center}\ttfamily\scshape{\large\bfseries The French Chapter}
\vskip1em\small
\begin{tabular}{ll}
 Chair:&    Jean-Pierre Jouannaud\\
 V.Chair:&  Denis Lugiez\\
 Secretary:& Giuseppe Castagna\\
 email:& \url{secretary@eatcs-fr.eu.org}\\ 
 URL:& \url{http://www.eatcs-fr.eu.org}
\end{tabular}
\end{center}
\par\beatcsRule
}
%
\newcommand\beatcsItChapStart{%
\noindent\hfil
{\Large\bfseries\scshape
 Report from the Italian Chapter}
\hfil\vskip1em\noindent\hfill
{{\em R.\ De Nicola} (Università di Firenze)}
\par\vskip1.5em\noindent\ignorespaces}
%
\newcommand\beatcsItChapClose{%
\par\vskip2em%
\vbox to0pt{\rule{0pt}{40pt}\\
\hbox to\linewidth{\hfil\includegraphics[scale=0.7]%
{beatcsIT}}\vss}%
\beatcsRule\par
\begin{center}\ttfamily\scshape{\large\bfseries The Italian Chapter}
\vskip1em\small
\begin{tabular}{ll}
 Chair:&    Eugenio Moggi\\
 V.Chair:&  Clelia De Felice\\
 Secretary:& Rocco De Nicola\\
 email:& \url{denicola@dsi.unifi.it}\\
 URL:& \url{http://www.unifi.it/eatcs}
\end{tabular}
\end{center}
\par\beatcsRule
}
%
\newenvironment{beatcsItChap}{\begingroup\beatcsItChapStart}%
{\beatcsItChapClose\endgroup}
\newenvironment{beatcsFrChap}{\begingroup\beatcsFrChapStart}%
{\beatcsFrChapClose\endgroup}
\newenvironment{beatcsJpChap}{\begingroup\beatcsJpChapStart}%
{\beatcsJpChapClose\endgroup}
%
\newcommand\beatcsReport[3]{%
\begin{center}{\bfseries
  {\large\scshape Report on #1}\\[1em]
  \begin{tabular}{c}
    #2
  \end{tabular}}\\[1em]
  \begin{tabular}{c}
    #3
  \end{tabular}
\end{center}\bigskip\noindent\ignorespaces}
%
\newcommand{\beatcsPhD}[6]{
%\null\vskip2em
\begin{center}
\beatcsRULEto{12pc}\vskip.6em
 {\ttfamily\bfseries\Large Abstract of PhD Thesis}\vskip.8em
\begin{tabular}{rl}
  \texttt{Author:} & #1\\[1pt]
  \texttt{Title:} &\begin{tabular}[t]{@{}l@{}}
                      #2
                    \end{tabular}\\[1pt]
  \texttt{Language:} & #3\\[1pt]
  \texttt{Supervisor:} &\begin{tabular}[t]{@{}l@{}}
                           #4
                         \end{tabular}\\[1pt]
  \texttt{Institute:} & \begin{tabular}[t]{@{}l@{}}
                           #5
                        \end{tabular}\\[1pt]
  \texttt{Date:} & #6
\end{tabular}\vskip.4em
\beatcsRULEto{12pc}
\end{center}\subsection*{Abstract}}
%
\newcommand\beatcsRULEto[1]{%
\centerline{\rule{#1}{2pt}\quad\rule[-2pt]{6pt}{6pt}\quad\rule{#1}{2pt}}}
\newcommand\beatcsRuleto[1]{%
\centerline{\rule{#1}{.8pt}\;\;\rule[-1.1pt]{3pt}{3pt}\;\;\rule{#1}{.8pt}}}
\newcommand\beatcsRULE{\beatcsRULEto{6pc}}
\newcommand\beatcsRule{\beatcsRuleto{6pc}}
%
\if@beatcs@final
 \pagestyle{empty}
 \let\ps@headings\ps@empty
 \let\ps@myheadings\ps@empty
 \let\ps@plain\ps@empty
 \def\thepage{}
\fi
%
\renewcommand\maketitle{
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\bfseries\scshape\@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}%
  \par
%  \vskip 1.5em
}
%
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \small%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
%            \setlength{\itemsep}{4.5pt plus 2pt minus 1pt}
            \setlength{\itemsep}{0pt plus 2pt minus 1pt}}%
      \sloppy\clubpenalty4000\@clubpenalty\clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\def\@lbibitem[#1]#2{\@bibitem{#2}}
%
%
%
%\newcommand\tableofcontents{%
%    \section*{\contentsname
%        \@mkboth{%
%           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
%    \@starttoc{toc}%
%    }
%\renewcommand*\l@part[2]{%
%  \ifnum \c@tocdepth >-2\relax
%    \addpenalty\@secpenalty
%    \addvspace{2.25em \@plus\p@}%
%    \setlength\@tempdima{3em}%
%    \begingroup
%      \parindent \z@ \rightskip \@pnumwidth
%      \parfillskip -\@pnumwidth
%      {\leavevmode
%       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
%       \nobreak
%       \if@compatibility
%         \global\@nobreaktrue
%         \everypar{\global\@nobreakfalse\everypar{}}%
%      \fi
%    \endgroup
%  \fi}
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries\scshape
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%\newcommand\vs@three@four[4]{\@dottedtocline{#1}{#2}{#3}{\scshape#4}}
%\renewcommand*\l@subsection{\vs@three@four{2}{1.5em}{2.3em}}
%\renewcommand*\l@subsubsection{\vs@three@four@dottedtocline{3}{3.8em}{3.2em}}
%\renewcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
%\renewcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
%

\newbox\beatcs@pencil
\newcommand\beatcs@Letter[1]{%
\global\savebox\beatcs@pencil{\includegraphics[height=\textheight]{#1}}
\global\def\@oddhead{\vbox to0pt{\vskip\headsep\usebox\beatcs@pencil\vss}}
}
%
\newenvironment{beatcsLetterP}[1]{%
\begingroup
\beatcs@Letter{beatcsPencilBig}
{\hfill\hwlarge#1}\bigskip\par
\advance\linewidth-40mm\advance\@totalleftmargin40mm
\everypar={\parshape\@ne\@totalleftmargin\linewidth\ignorespaces}
\ttfamily\slshape\raggedright\par\ignorespaces}
{\newpage\everypar={}\relax\endgroup}
%
\newenvironment{beatcsLetterE}[1]{%
\begingroup
\beatcs@Letter{beatcsPencil}
{\hfill\hwlarge#1}\bigskip\par
\advance\linewidth-22mm\advance\@totalleftmargin22mm
\everypar={\parshape\@ne\@totalleftmargin\linewidth\ignorespaces}
\ttfamily\slshape\raggedright\par\ignorespaces}
{%\newpage
\everypar={}\relax\endgroup}
%
\newcommand\beatcsLetterSign[1]{\hwlarge\flushright#1\par\bigskip}
%
%\DeclareFontFamily{T1}{hw}{}
%\DeclareFontShape{T1}{hw}{m}{n}{<->lbh}{}
%\def\hwlarge{\usefont{T1}{hw}{m}{n}\fontsize{14pt}{14pt}\selectfont}
%
%
\DeclareFontFamily{T1}{hw}{}
\DeclareFontShape{T1}{hw}{m}{n}{<->hlcriw8r}{}
\def\hwlarge{\usefont{T1}{hw}{m}{n}\fontsize{14pt}{14pt}\selectfont}
%
\endinput

\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure

%\newcommand\section{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\Large\bfseries}}
%\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex}%
%                                     {\normalfont\large\bfseries}}
%\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex}%
%                                     {\normalfont\normalsize\bfseries}}
%\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
%\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {-1em}%
%                                      {\normalfont\normalsize\bfseries}}
%%
%% End of file `beatcs.cls'.
