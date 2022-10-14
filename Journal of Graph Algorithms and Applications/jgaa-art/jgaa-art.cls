% jgaa-art.cls version 5, 01/2021
%
% LaTeX class for articles published in the Journal of Graph
% Algorithms and Applications, http://jgaa.info
%
% Based on previous package jga-article.sty file


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jgaa-art}[2021/01/07 v5.0 LaTeX class for the Journal of Graph Algorithms and Applications]

\LoadClass[twoside]{article}



%%%%%%%%%%%%%%%%%%%%%
%                   %
% Required packages %
%                   %  
%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{xcolor}

%%%%%%%%%%%%%%%%%%%%%
%                   %
%    Page layout    %
%                   %  
%%%%%%%%%%%%%%%%%%%%%
\geometry{text={15cm,20cm},centering}


%%%%%%%%%%%%%%%%%%%%%
%                   %
%     Link setup    %
%                   %  
%%%%%%%%%%%%%%%%%%%%%
\definecolor{lipicsblue}{rgb}{0.08235294118,0.3098039216,0.537254902}
\hypersetup{colorlinks,
	breaklinks,
	colorlinks=true,
	urlcolor=lipicsblue,
	citecolor=lipicsblue,
	linkcolor=lipicsblue
}


%%%%%%%%%%%%%%%%%%%%%
%                   %
% First page header %
%                   %  
%%%%%%%%%%%%%%%%%%%%%
\newcommand{\ShortIssueNo}{vol.\ 0, no.\ 0, 0000}
\newcommand{\IssueNo}{vol.\ 0, no.\ 0, 0000}
\newcommand{\Issue}[5]{%
  \renewcommand{\ShortIssueNo}{#1(#2) #3--#4 (#5)}
  \renewcommand{\IssueNo}{vol.\ #1, no.\ #2, pp.\ #3--#4 (#5)}
  ~\vspace{-0.5in}
  \hrule
  \begin{center}
    \parbox{1.4in}{ \includegraphics[scale=0.2]{cube-spread} }
    \parbox{3.25in}{%
      {\large\sf Journal of Graph Algorithms and Applications} \\
      {\normalsize\sf http://jgaa.info/} {\normalsize\IssueNo} \\
      {\footnotesize \sf \href{http://dx.doi.org/\DOIInfo}{DOI: \DOIInfo}} 
    }
  \end{center}
  \hrule
  \vspace{6pt}
  \setcounter{page}{#3}
  }
  
\newcommand{\DOIInfo}{}
\newcommand{\doi}[1]{\renewcommand{\DOIInfo}{#1}}  
  
  
%%%%%%%%%%%%%%%%%%%%%%%
%                     %
% Headers and Footers %
%                     %  
%%%%%%%%%%%%%%%%%%%%%%%
  
\newcommand{\HeadingAuthorInfo}{}
\newcommand{\HeadingAuthor}[1]{\renewcommand{\HeadingAuthorInfo}{#1}}
\newcommand{\HeadingTitleInfo}{}
\newcommand{\HeadingTitle}[1]{\renewcommand{\HeadingTitleInfo}{#1}}


\fancyhead{} % clear all fields
\fancyhead[LE]{\thepage~~~~\textrm{\HeadingAuthorInfo}~~\textit{\HeadingTitleInfo\/}}
\fancyhead[RO]{ {\sf JGAA}, \ShortIssueNo~~~~\thepage}
\fancyfoot[C]{}
\renewcommand{\headrulewidth}{0.0pt}
\renewcommand{\footrulewidth}{0.0pt}





%%%%%%%%%%%%%%%%%%%%%
%                   %
%   Frontmatter     %
%                   %  
%%%%%%%%%%%%%%%%%%%%%


% Tokens
\newtoks\auth@toks
\newtoks\authpdf@toks
\newtoks\mail@toks
\newtoks\affil@toks
\newtoks\title@toks
\newtoks\titlepdf@toks
\newtoks\history@toks
\newtoks\editor@toks
\newtoks\ack@toks
\newtoks\issue@toks

% counters
\newcounter{affil@count}
\renewcommand{\theaffil@count}{\textsuperscript{\arabic{affil@count}}}

\newcounter{author@count}
\setcounter{author@count}{0}

\newcounter{issue@count}
\setcounter{issue@count}{0}

\newcounter{ack@count}
\setcounter{ack@count}{0}

% commands for authors

% authors expansion
\newcommand{\expauthor}[5][]{
  \if!#1!%
    \auth@toks=\expandafter{\the\auth@toks\@author{#4}}%
    \mail@toks=\expandafter{\the\mail@toks\@email{#2}{#3}}%
  \else%
    \auth@toks=\expandafter{\the\auth@toks\@authoraff{#1}{#4}}%
    \mail@toks=\expandafter{\the\mail@toks\@email{#2}{#3}}%
  \fi%
  \if!#5!
  	{}
  \else
  	\auth@toks=\expandafter{\the\auth@toks\orcid{#5}}%
  \fi
  \ifnum \value{author@count} > 0%
        \authpdf@toks=\expandafter{\the\authpdf@toks{, #2}}%
    \else%
        \authpdf@toks=\expandafter{\the\authpdf@toks{#2}}%
    \fi%
    \stepcounter{author@count}%
}


% Basic author command; params: affiliation (ref), name, email
\renewcommand{\author}[3][]{%
	\expauthor[#1]{#2}{#3}{#2}{}%
}

% Basic author command; params: affiliation (ref), name, email, orcid
\newcommand{\authorOrcid}[4][]{%
	\expauthor[#1]{#2}{#3}{#2}{#4}%
}

% Basic author command; params: affiliation (ref), name, email (forces name to be on a new line)
\newcommand{\authorB}[3][]{%
	\expauthor[#1]{#2}{#3}{\\#2}{}%
}

% Basic author command; params: affiliation (ref), name, email, orcid (forces name to be on a new line)
\newcommand{\authorBOrcid}[4][]{%
	\expauthor[#1]{#2}{#3}{\\#2}{#4}%
}

% affiliation
\newcommand{\affiliation}[2][]{%
  \ifnum\c@affil@count<0
    \ClassError{jgaa-article}{Two affiliations given without optional argument}{}%
  \else
    \if!#1!%
      \affil@toks={\@oneaffil{#2}}%
      \c@affil@count=-1
    \else
      \affil@toks=\expandafter{\the\affil@toks\@affil{#1}{#2}}%
      \refstepcounter{affil@count}\label{#1}%
    \fi
  \fi
}

% orcid command. Small icon close to the name
\newcommand{\orcid}[1]{\href{https://orcid.org/#1}{\protect\includegraphics[scale=0.45]{orcid}}{}}


% title, author and affiliation formatting commands
\renewcommand{\title}[1]{
  \title@toks=\expandafter{\the\title@toks\@title{#1}}
  \titlepdf@toks={#1}
  }

\renewcommand{\@title}[1]{
    \begin{center}
        \Large\bf #1
    \end{center}
    }    

\renewcommand{\@author}[1]{
    {{\large \emph{#1}}}
}
  
\newcommand{\@authoraff}[2]{
    {{\large \emph{#2$\,$}}\formataffilmark{#1}}
}

\newcommand\@marksep{,}
\newcommand\displaysep{$^,$}
\newcommand\refentry[1]{\ref{#1}}


\newcommand\formataffilmark[1]{%
  \let\@marksep\@refsepinit
  \@for\@ii:=#1\do{%
    \@marksep
    \refentry{\@ii}%
  }%
}
\def\@refsepinit{\let\@marksep\displaysep}

\newcommand{\@email}[2]{
	\if!#2!%
		{}
	\else%
    	\footnotesize{\href{mailto:#2}{\textsf{#2}} (#1)}%
    \fi
}

\newcommand{\@oneaffil}[1]{
\centering%
  {\par#1}%
}%

\newcommand{\@affil}[2]{%
\centering%
  {\par\ref{#1}#2}%
}%


% counter for history
\newcounter{history@count}
\setcounter{history@count}{0}

% history commands
\newcommand{\submitted}[1]{
        \stepcounter{history@count}%
        \history@toks=\expandafter{\the\history@toks\@history{Submitted}{#1}}%
}

\newcommand{\reviewed}[1]{
        \stepcounter{history@count}%
        \history@toks=\expandafter{\the\history@toks\@history{Reviewed}{#1}}%
}

\newcommand{\revised}[1]{
        \stepcounter{history@count}%
        \history@toks=\expandafter{\the\history@toks\@history{Revised}{#1}}%
}

\newcommand{\accepted}[1]{
        \stepcounter{history@count}%
        \history@toks=\expandafter{\the\history@toks\@history{Accepted}{#1}}%
}

\newcommand{\final}[1]{
        \stepcounter{history@count}%
        \history@toks=\expandafter{\the\history@toks\@history{Final}{#1}}%
}

\newcommand{\published}[1]{
        \stepcounter{history@count}%
        \history@toks=\expandafter{\the\history@toks\@history{Published}{#1}}%
}

\newcommand{\type}[1]{
        \stepcounter{history@count}%
        \editor@toks=\expandafter{\the\editor@toks\@editor{Article type}{#1}}%
}

\newcommand{\editor}[1]{
        \stepcounter{history@count}%
        \editor@toks=\expandafter{\the\editor@toks\@editor{Communicated by}{#1}}%
}

\newcommand{\@history}[2]{
\parbox[c][0.7cm]{3.5cm}{\begin{center}\footnotesize{\textsf{#1: } #2}\end{center}}
}

\newcommand{\@editor}[2]{
\parbox[c][0.7cm]{5.5cm}{\begin{center}\footnotesize{\textsf{#1: } #2}\end{center}}
}


% commands for Ack
\newcommand{\Ack}[1]{%
	\stepcounter{ack@count}
    \ack@toks=\expandafter{\the\ack@toks\@ack{#1}}%
}%

\newcommand{\@ack}[1]{%
    {\footnotesize{#1}}%
}%

% commands for special issue
\newcommand{\issue}[1]{%
	\stepcounter{issue@count}
	\issue@toks=\expandafter{\the\issue@toks\@issue{#1}}%
}%

\newcommand{\@issue}[1]{%
	{\footnotesize{#1}}%
}%


% frontmatter formatting commands
\def\printauthors{\the\auth@toks}
\def\printaffiliations{\the\affil@toks}
\def\printtitle{\the\title@toks}
\def\printhistory{\the\history@toks}
\def\printeditor{\the\editor@toks}
\def\printack{\the\ack@toks}
\def\printmail{%
    \ifnum \value{author@count} > 1%
        {\footnotesize{\emph{E-mail addresses:}}\the\mail@toks}%
    \else%
        {\footnotesize{\emph{E-mail address:}}\the\mail@toks}%
    \fi%
}%
\def\printissue{%
	\footnotesize{\it \the\issue@toks}
}%
\def\printlicense{\footnotesize{\raisebox{-.25\height}{\includegraphics[height=15pt]{by}} This work is licensed under the terms of the \href{https://creativecommons.org/licenses/by/4.0/}{CC-BY} license.} 
}

\newcommand{\history}{
	\ifnum \value{history@count} > 0%
	\begin{center}%
		\fbox{\parbox{0.8\textwidth}{
				\centering
				\printhistory\\%
				\printeditor
			    }}%
	\end{center}%
	\fi%
}%

% maketitle
\renewcommand{\maketitle}{%
\hypersetup{pdftitle=\the\titlepdf@toks,pdfauthor=\the\authpdf@toks}
\thispagestyle{empty} %
\pagestyle{fancy}%
\printtitle%
\begin{center}%
\begin{spacing}{1.1}
\printauthors%
\end{spacing}
\vspace{2mm}%
\printaffiliations%
%\vspace{5mm}%
\end{center}%
\history%
\makeatletter{\renewcommand*{\@makefnmark}{}
	\footnotetext{
		\ifnum \value{issue@count} > 0%
			\printissue\par
			\smallskip
			\hrule
		\fi
		\ifnum \value{ack@count} > 0%
			\smallskip
			\printack\par
			\smallskip
		\hrule
		\fi
		\smallskip
		\printmail\par
		\smallskip
		\hrule
		\smallskip
		\printlicense
	}
\makeatother}
}%

\renewenvironment{abstract}{\begin{quotation}\textbf{Abstract.}}{\end{quotation}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                        %
%   Theorems and proofs environments     %
%                                        %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
\newtheorem{lemma}{Lemma}
\newtheorem{theorem}{Theorem}
\newenvironment{proof}{\par\addvspace\topsep\noindent
{\bf Proof:} \ignorespaces }{\qed}
\newcommand{\qed}{\hspace*{\fill}$\Box$\ifmmode\else\par\addvspace\topsep\fi}
