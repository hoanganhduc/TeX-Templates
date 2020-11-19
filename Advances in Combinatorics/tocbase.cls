%% tocbase.cls version 4.44   2016-05-23  ToC base style file

% Filename: tocbase.cls
%
% This documentclass is a base class inherited by classes toc and toclibrary that are
% intended for typesetting articles for the
%
%                        Theory of Computing.
%
% See http://theoryofcomputing.org for further details.
%
% Search for ``%%% PART'' to find the main parts of this class file.

%% Version 4.0: New tocdetail for lastpage; this is only to be used
%% in cases where the article has already been published and we wish
%% to hardcode the lastpage number for the purposes of forcibly
%% producing the bibliographic information in the header despite
%% typesetting changes (the principal example is when we release
%% articles to the arXiv).
%%
%% Finally, NOTEs and COMMENTs styles are now set using the
%% \tocdetails command. E.g., "..., note, ..." or "..., comment,
%% ..." For consistency, you may use "..., article, ..." as well.
%%
%% Version 4.01 Adds support for \begin{question}..\end{question}.
%%
%% Version 4.02 Adds documentation to classification layout.
%%
%% Version 4.03 Fixes a bug where classifications would be floated on
%% the second page for long abstract.
%%
%% Version 4.1 Changes abstract (and dedication) layout to use
%% \quotation rather than \leftskip & \rightskip; this appears to give
%% more robust changes to margins so that enumerate
%% environments are layed out correctly. This version also slightly condenses
%% the material on the front page by removing some \largeskips.
%%
%% Version 4.11 Conditional layout for classification data.
%%
%% Version 4.12: - Migrated from color to xcolor.
%%               - Migrated to T1 fontencoding to have better support
%%               for breaking through words with accents.
%%               - Added the textcomp package, so that copyright
%%               symbols are a single glyph.
%%               - modified \expref to omit hyperrefs when in a pdf
%%               string.
%%
%% Version 4.2:  Removes definition of the algorithm theorem type to
%% avoid clashes with, e.g., the algorithmicx class which invokes the
%% float class with a float called algorithm. 
%%
%% Version 4.2 compatibility warning: may not be backward compatible.
%%
%% Version 4.3: Introduces usage of the ccicons package to typeset the
%% Creative Commons icons. Additionally, uses the ccicons package to
%% redefine the \textcopyright to mimic the layout of the
%% ccicons. (Thus the .pdf files for the copyright icon and the ccicon
%% are no longer necessary.) Slight change to cc attribution
%% text. Implements \exprefsilent{}{}, analogous to the \expref
%% command, but which does not produce a text reference to the object,
%% just the hyperlinked reference.
%%
%% Version 4.31 Changed placement of (CC-BY) text in CC license statement.
%%
%% Version 4.32 Removed period after title page dates.
%%
%% Version 4.33 Removed colons before title page dates, replaced them with \,
%%       (small space), capitalized Rev/Pub   (LB/JW)
%%
%% Version 4.34 Fixed versioning information only.
%%
%% Version 4.35 Adds support for footnotes in the title with no
%% footnote marker (via \titlefootnote). Adds support for \cclass,
%% \eee, and \expeqref.
%%
%% Version 4.36 Fixes \cclass so that it will always be upright. Adds
%% \cproblem command for (complexity) problems.
%%
%% Version 4.4 Adds several more keys to the tocdetails command,
%% including an author and title key which can be used to
%% simultaneously set several other keys (running*, pdftitle,
%% copyrightauthor).  Also adds \etoolbox. Adds an option tocmacros
%% which declares predefined theoremlike declarations, predefined math
%% objects, and predefined abbreviations.
%%
%% Version 4.41 Changed date layout so that it is smarter, checking
%% each field for existence before typesetting.
%%
%% Version 4.42 Transitioned names of keyval keys from pdfauthor and
%% pdftitle to plaintextauthor and plaintexttitle.
%%
%% Version 4.43 Added warning if no received date declared (if
%% published date is declared). Added "(Editor)" to warnings specific
%% to journal editor.
%%
%% Version 4.44 Added some overloading of tocdetails commands
%% (plaintextauthors = authorlist), and added a tocdetails command for
%% footnote on the titlepage (titlefootnote), which has the very same
%% effect as adding a footnote to the title itself using the
%% \titlefootnote command. Updated some internal names.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Declare class and load external packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Need this version of LaTeX at least (for ClassWarning commands)
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{tocbase}[2018/05/23 v4.44 Theory of Computing Base]

% Do not pass the following options down to the article class
\def\toc@dontpassoptions{10pt,11pt,12pt,oneside,twoside}
\@for\toc@tmpe:=\toc@dontpassoptions\do{%
   \DeclareOption{\toc@tmpe}{}
}

% ...but do pass along the titlepage option.
\DeclareOption{titlepage}{\PassOptionsToClass{titlepage}{article}}

\DeclareOption{tocmacros}{\AtEndOfClass{\toc@setup@predefines}}

\ProcessOptions\relax

% Now load article class and handle options.
\LoadClass[11pt,twoside,letterpaper]{article}

\RequirePackage{ifpdf}
\RequirePackage{etoolbox}

%% Check that we are running pdfLaTeX; otherwise complain.
\ifpdf{}\else%
{\ClassError{tocbase}{pdfLaTeX not detected. Theory of
    Computing classes require pdfLaTeX.}{Insure that you are compiling
    with pdflatex.}}\fi

% Insure that we use postscript type 1 times, with T1 encoding. Load
% textcomp, so that copyright symbols are single gylphs.
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}

% Load amsmath and amsthm packages
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}

% Load xcolor, eucal.
\RequirePackage{xcolor}
\RequirePackage{eucal}

% Load microtype.
\RequirePackage{microtype}

% We'll require the page number of the last page in the title and
% running footers.
\RequirePackage{refcount}
\RequirePackage{lastpage}

% Load in keyval package. Used for handling parsing of \tocdetails
% This does not provide an overhead as hyperref loads keyval anyway.
% and keyval is just 15 lines of code!
\RequirePackage{keyval}

%% We now require graphicx for icon layout.
\RequirePackage{graphicx}

% Load the eXtensible Metadata Platform package, so that we can include licensing information in our .pdf files.
\RequirePackage{hyperxmp}

% Load the hyperref package. As loaded, it uses the default hpdftex
% driver code; this appears to be fine.  The colors selected are
% chosen so that internal document links (the citations, section
% headings, ...) are orange and external document links (e.g.,
% files and distant urls) are blue.
\RequirePackage[%
  pagebackref,
  hyperfootnotes=false,
  colorlinks=true,
  urlcolor=externallinkcolor,
  linkcolor=internallinkcolor,
  filecolor=externallinkcolor,
  citecolor=internallinkcolor,
  breaklinks=true,
  pdfstartview=FitH,
  pdfpagelayout=OneColumn]{hyperref}

% Load the ccicons package (N.b., This must occur after loading
% hyperref in order for the \textcopyright symbol to be set correctly.)
\RequirePackage[copyright]{ccicons}[2012/05/22]

% If we are ever in a situation where ccicons is not available, we may
% need to back out to textcomp to get a good copyright sign/
% \RequirePackage{textcomp}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% IF macro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rather than load the whole ifthen package, we'll use the following macro.
%
% Check if the two arguments expand to the same thing
% MAGIC happens in the \edef which expands #1 and #2 completely first
% Mainly used to check equality of strings
\newcommand{\ifex}[2]{%
   \edef\toc@tmpa{#1}%
   \edef\toc@tmpb{#2}%
   \ifx\toc@tmpa\toc@tmpb
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Define the layout of the page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Our current strategy is maximize text layout area, subject to a
% one-inch lower bound on all margins. A4 pages are 210mmx297mm =
% 597.5ptx845pt; letter pages are 8.5inx11in = 614.3ptx795pt.
% Accounting for 2in=144.5pt total left and right margins leaves 
% us with min(597.5pt,614.3pt)-144.5pt = 453pt of total textwidth. 
% Similarly, we can afford min(845pt,795pt)-144.5pt = 650.5pt of 
% total text height, into which we must pack headers, text, and 
% footers.
\setlength{\voffset}{0pt}
\setlength{\hoffset}{0pt}
\setlength{\textwidth}{453pt}
\setlength{\headheight}{24pt}
\setlength{\headsep}{18pt}
\setlength{\footskip}{30pt}
\setlength{\textheight}{578.5pt}
\setlength{\marginparwidth}{62.27pt}

% Compute side margins to center text horizontally in page.
\newlength{\toc@hpadding}
\setlength{\toc@hpadding}{\paperwidth}
\addtolength{\toc@hpadding}{-2in}
\addtolength{\toc@hpadding}{-\textwidth}
\setlength{\evensidemargin}{.5\toc@hpadding}
\setlength{\oddsidemargin}{.5\toc@hpadding}

% Compute top margin to center virtual header/footer textbox.
\newlength{\toc@documentheight}
\newlength{\toc@vpadding}
\setlength{\toc@documentheight}{\textheight}
\addtolength{\toc@documentheight}{\footskip}
\addtolength{\toc@documentheight}{\headsep}
\addtolength{\toc@documentheight}{\headheight}
\setlength{\toc@vpadding}{\paperheight}
\addtolength{\toc@vpadding}{-\toc@documentheight}
\addtolength{\toc@vpadding}{-2in}
\setlength{\topmargin}{.5\toc@vpadding}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Values of parameters related to the journal, section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\toc@doiderefaddress{http://dx.doi.org/}
\newcommand\toc@journalname{Theory of Computing}
\newcommand\toc@journaldoiaddress{\toc@doiderefaddress\toc@journaldoi}
\newcommand\toc@journaladdress{www.theoryofcomputing.org}
\newcommand\toc@journaldoi{10.4086/toc}

% License addresses:
\newcommand{\toc@cclicenseurl}{http://creativecommons.org/licenses/by/3.0/}
\newcommand{\toc@licenseurl}{http://theoryofcomputing.org/copyright2009.html}

% Data for tocadjust's bibliography hyperref:
%\newcommand\toc@homepage{http://theoryofcomputing.org}
%\newcommand\toc@sectionname{main}

% Initialize properties to default value
\newcommand{\toc@year}{\@empty}
\newcommand{\toc@volume}{\@empty}
\newcommand{\toc@number}{\@empty}
\newcommand{\toc@received}{\@empty}
\newcommand{\toc@published}{\@empty}
\newcommand{\toc@revised}{\@empty}
\newcommand{\toc@declaredfirstpage}{\@empty}
\newcommand{\toc@declaredlastpage}{\@empty}
\newcommand{\toc@doi}{\@empty}
\newcommand{\toc@url}{\@empty}
\newcommand{\toc@copyrightauthor}{by the author(s)}
\newcommand{\toc@runningauthor}{}
\newcommand{\toc@runningtitle}{}
\newcommand{\toc@firstpage}{\getpagerefnumber{FirstPage}}
\newcommand{\toc@lastpage}{\getpagerefnumber{LastPage}}
\newcommand{\toc@title}{\@empty}
\newcommand{\toc@pdftitle}{PDF Title}
\newcommand{\toc@pdfauthor}{PDF Author}
\newcommand{\toc@acmclassification}{ADD ACM CLASSIFICATIONS}
\newcommand{\toc@amsclassification}{ADD AMS CLASSIFICATIONS}
\newcommand{\toc@keywords}{ADD KEYWORDS}
\newcommand{\toc@titlefootnotetext}{\@empty}

%% Booleans to remember if such variables as copyrightauthor, runningauthor, pdftitle, runningtitle have been individually set; if so, we do not touch them with the authors/title command.
\newbool{toc@set@copyrightauthor}
\newbool{toc@set@runningauthor}
\newbool{toc@set@pdftitle}
\newbool{toc@set@runningtitle}
\newbool{toc@set@titlefootnote}

%%% The rest of this part establishes the hooks for the \pubdet "Publication details" command.
\define@key{pubdet}{year}{\renewcommand{\toc@year}{#1}}
\define@key{pubdet}{volume}{\renewcommand{\toc@volume}{#1}}
\define@key{pubdet}{number}{\renewcommand{\toc@number}{#1}}
\define@key{pubdet}{received}{\renewcommand{\toc@received}{#1}}
\define@key{pubdet}{published}{\renewcommand{\toc@published}{#1}}
\define@key{pubdet}{revised}{\renewcommand{\toc@revised}{#1}}
\define@key{pubdet}{firstpage}{\renewcommand{\toc@declaredfirstpage}{#1}}
\define@key{pubdet}{lastpage}{\renewcommand{\toc@declaredlastpage}{#1}}
\define@key{pubdet}{doi}{\renewcommand{\toc@doi}{#1}}
\define@key{pubdet}{url}{\renewcommand{\toc@url}{#1}}
\define@key{pubdet}{author}{%
  \notbool{toc@set@copyrightauthor}{\renewcommand{\toc@copyrightauthor}{#1}}{}%
  \notbool{toc@set@runningauthor}{\renewcommand{\toc@runningauthor}{#1}}{}}
\define@key{pubdet}{plaintextauthor}{\renewcommand{\toc@pdfauthor}{#1}}
\define@key{pubdet}{authorlist}{\renewcommand{\toc@pdfauthor}{#1}}
\define@key{pubdet}{copyrightauthor}{\copyrightauthor{#1}}
\define@key{pubdet}{runningauthor}{\runningauthor{#1}}
\define@key{pubdet}{title}{%
  \renewcommand{\toc@title}{#1}%
  \notbool{toc@set@pdftitle}{\renewcommand{\toc@pdftitle}{#1}}{}%
  \notbool{toc@set@runningtitle}{\renewcommand{\toc@runningtitle}{#1}}{}}
\define@key{pubdet}{plaintexttitle}{\tocpdftitle{#1}}
\define@key{pubdet}{runningtitle}{\runningtitle{#1}}
\define@key{pubdet}{acmclassification}{\renewcommand{\toc@acmclassification}{#1}}
\define@key{pubdet}{amsclassification}{\renewcommand{\toc@amsclassification}{#1}}
\define@key{pubdet}{keywords}{\renewcommand{\toc@keywords}{#1}}
\define@key{pubdet}{titlefootnote}{\titlefootnote{#1}}

% argument is a comma seperated list of the type "volume=6,year=8,..."
% If we have details of section we are interested in, process it
\newcommand{\tocdetails}[1]{\setkeys{pubdet}{#1}}

\newcommand\toc@authors\@empty

% New Boxes
\newbox\toc@abstract % To store the abstract
\newbox\toc@dedication % To store the abstract

% Authors counter
\newcounter{toc@numauthors}
\setcounter{toc@numauthors}{0}

% Define parameter passing functions for author metadata.
\newcommand*{\copyrightauthor}[1]{%
  \booltrue{toc@set@copyrightauthor}%
  \renewcommand\toc@copyrightauthor{#1}}
\newcommand*{\runningauthor}[1]{%
  \booltrue{toc@set@runningauthor}%
  \renewcommand\toc@runningauthor{#1}}
\newcommand*{\runningtitle}[1]{%
  \booltrue{toc@set@runningtitle}%
  \renewcommand\toc@runningtitle{#1}}
\newcommand{\tocpdftitle}[1]{%
  \booltrue{toc@set@pdftitle}%
  \renewcommand{\toc@pdftitle}{#1}}
\newcommand{\tocpdfauthor}[1]{\renewcommand{\toc@pdfauthor}{#1}}

% Embed license data in the xmp block.
\hypersetup{%
 pdfcopyright={This document is licensed under a Creative Commons Attribution 3.0 license},%
 pdflicenseurl={\toc@cclicenseurl}}

% Embed remaining data after user has set it in preamble.
\AtBeginDocument{%
  \hypersetup{%
    pdfauthor=\toc@pdfauthor,%
    pdftitle=\toc@pdftitle,%
    pdfsubject=\toc@journalname}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Copyright box
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define copyright text.
%% Determine exterior and interion widths for the copyright box.
\newlength\toc@crboxheight
\setlength\toc@crboxheight{3.5ex}

\newcommand{\toc@crlayout}[1]{\fontsize{8}{9}\usefont{OT1}{ptm}{m}{n}\selectfont{#1}}

%% If there is no year, layout copyright line apropriately.
\newcommand{\toc@conditionalyearlayout}{\ifex{\toc@year}{\@empty}{}\else{\toc@crlayout{\toc@year~}}\fi}

\newcommand{\toc@jlicensestatement}{\href{\toc@cclicenseurl}{\ccby~\toc@crlayout{Licensed
under a Creative Commons Attribution License (CC-BY)}}}
\newcommand{\toc@acopyrightstatement}{\toc@crlayout{\href{\toc@licenseurl}{\textcopyright~\toc@conditionalyearlayout\toc@copyrightauthor}}}
\newcommand{\toc@doitext}{\ifex{\toc@doi}{\@empty}{}\else{\toc@crlayout{\href{\toc@doiderefaddress\toc@doi}{DOI:~\toc@doi}}}\fi}

\newcommand{\toc@copyrightbox}
{\parbox[b][\toc@crboxheight]{\textwidth}{%
\hrule \vfill
\toc@acopyrightstatement \hfill \par
\toc@jlicensestatement \hfill \toc@doitext}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Hyperlinking setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set up hyperlink colors.
\definecolor{weborange}{rgb}{.8,.3,.3}
\definecolor{webblue}{rgb}{0,0,.8}
\definecolor{internallinkcolor}{rgb}{0,.5,0}
\definecolor{externallinkcolor}{rgb}{0,0,.5}
\definecolor{red}{rgb}{1,0,0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Title page components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% If the toccomment class is loaded, it will reset this command to show the comment (sub-)banner:
\newcommand{\toc@bannerjournalname}%
          {\fontsize{11}{13}\usefont{OT1}{ptm}{m}{sc}{\href{\toc@journaldoiaddress}{\toc@journalname}}}

\newcommand\toc@bannertexta%
{\href{\toc@journaldoiaddress}{\toc@bannerjournalname}}
 
\newcommand\toc@bannertextb%
           {\fontsize{11}{13}\usefont{OT1}{ptm}{m}{it}
            \selectfont{\toc@journaladdress}}

\newlength{\toc@bannerwidth}
\setlength{\toc@bannerwidth}{\textwidth}
\addtolength{\toc@bannerwidth}{-2cm}
\newcommand{\toc@banner}{\toc@bannerhook%
  \begin{minipage}{\toc@bannerwidth}%
    \centering \toc@bannertexta\\ \toc@bannertextb\\
   \vspace{2mm} \hrule\vspace{1pt}\hrule%
 \end{minipage}}
  
% Define the date box. If \toc@received is
% undefined, this will simply print
% the current date, as does the article class.
\newcommand\toc@reviseddatelayout{\ifex\toc@revised\@empty{}\else{Revised\, \toc@revised; }\fi}
\newcommand\toc@receiveddatelayout{\ifex\toc@received\@empty{\ClassWarningNoLine{tocbase}{(Editor) No Received Date}}%
  \else{Received\, \toc@received; }\fi}
\newcommand\toc@datelayout%
{\fontsize{10}{12}\usefont{OT1}{ptm}{m}{sl}\selectfont%
  \ifex{\toc@published}{\@empty}{\@date}%
  \else%
  {{\toc@receiveddatelayout%
      \toc@reviseddatelayout%
      Published\, \toc@published}}
  \fi}

%% Setup classification box.
\newcommand{\toc@classificationbox}{%
 \parbox[t]{\textwidth}{%
 \ifex{\toc@acmclassification}{\@empty}{}
 \else{\noindent \textbf{ACM Classification: }\toc@acmclassification% 
       \par \medskip}
 \fi
%
 \ifex{\toc@amsclassification}{\@empty}{}
 \else{\noindent \textbf{AMS Classification: }\toc@amsclassification%
       \par \medskip}
 \fi
%
 \ifex{\toc@keywords}{\@empty}{}
 \else{\noindent \textbf{Key words and phrases: }\toc@keywords \par}
 \fi
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% This defines the footer running citation. We must produce two versions of it, the one without links is used
%% to determines spacing; the other is actually used for layout.

\newcommand\toc@runningcitation%
{\href{\toc@journaldoiaddress}{\textsc{\toc@journalname}}}

\newcommand\toc@runningcitation@nolink{\textsc{\toc@journalname}}

% Header layout wrapper.
\newcommand\toc@headerlayout[1]
   {\fontsize{10}{12}\usefont{OT1}{ptm}{m}{sc}\selectfont{#1}}
\newcommand\toc@footerlayout[1]
   {\fontsize{10}{12}\usefont{OT1}{ptm}{m}{n}\selectfont{#1}}

% Set up title page style.
\newcommand{\ps@titlepage}{%
  \renewcommand{\@oddhead}{\@empty}%
  \renewcommand{\@evenhead}{\@empty}%
  \renewcommand{\@oddfoot}{\toc@copyrightbox\hfil}%
  \renewcommand{\@evenfoot}{\toc@copyrightbox\hfil}%
}

% Set up the 2ff. page style.
\renewcommand{\ps@headings}{%
\renewcommand{\@oddhead}
             {\hfil\toc@headerlayout{\toc@runningtitle}\hfil}%    
\renewcommand{\@evenhead}
             {\hfil\toc@headerlayout{\toc@runningauthor}\hfil}%
\renewcommand{\@oddfoot}
             {\hfil\toc@footerlayout{\toc@runningcitation}\hfil
\normalfont\thepage}%
\renewcommand{\@evenfoot}
             {\hfil\toc@footerlayout{\toc@runningcitation}\hfil
\normalfont\thepage}%
}

%% Determine actual footer height.
\newlength\toc@footerheight
\settoheight\toc@footerheight{\toc@footerlayout{\toc@runningcitation@nolink}}

%% Determine titlepage text area.
\newlength\toc@titlepagecorrection
\setlength\toc@titlepagecorrection\toc@crboxheight
\addtolength\toc@titlepagecorrection{-\toc@footerheight}

%% Adjust the textheight of first page to allow for the large footer
%% that we will place.
\newcommand{\toc@bannerhook}{\label{FirstPage}%
  \enlargethispage{-\toc@titlepagecorrection}}
\newcommand{\toc@titlehook}{%
  \ifbool{toc@set@titlefootnote}{\toc@titlefootnote@display{\toc@titlefootnotetext}}{}}

%% For the sake of backwards compatibility, we also support this older hook.
\newcommand{\toc@titlepagehook}{\toc@bannerhook}

% Define the default page style to be headings.
\pagestyle{headings}
\pagenumbering{arabic}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% New Maketitle macro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (Re)define maketitle for ToC. These are lifted
% directly from article.cls.
\if@titlepage
\newcommand\toc@maketitle{\begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \begin{center}%
      \toc@banner%
    \end{center}%
    \null\vfil
    \vskip 40\p@
    \begin{center}%
      {\Huge \@title\toc@titlehook \par}%
      \vskip 3em%
      {\Large
        \lineskip .75em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
      \vskip 1.5em%
      {\toc@datelayout \par}%
    \end{center}\par
    \@thanks
    \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\toc@maketitle{\par
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \if@twocolumn
  \ifnum \col@number=\@ne
  \@maketitle
  \else
  \twocolumn[\@maketitle]%
  \fi
  \else
  \newpage
  \global\@topnum\z@   % Prevents figures from going at top of page.
  \@maketitle
  \fi
  \thispagestyle{titlepage}\@thanks
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
  \newpage
  \begin{center}%
    \toc@banner%
  \end{center}%
  \null
  \vskip 2em%
  \begin{center}%
    \let \footnote \thanks
    {\Huge \@title\toc@titlehook \par}%
    \vskip 1.5em%
    {\Large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
       \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\toc@datelayout}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Frontmatter and related macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{frontmatter}[1][]{
  \title{\toc@title}
  
 % Default position is to float
 \newcommand{\toc@floatclass}{float}
 \define@key{frontmatter}{classification}{\renewcommand{\toc@floatclass}{##1}}
 \setkeys{frontmatter}{#1}

 %Define dedication environment
 \newenvironment{dedication}{%
  \global\setbox\toc@dedication=\vbox\bgroup%
  \quotation
  \noindent \itshape \hfill% Dedication is set in italics.
}{\endquotation\par\egroup} % End of definition of dedication

 %Define abstract environment
 \renewenvironment{abstract}{%
  \global\setbox\toc@abstract=\vbox\bgroup%
  \quotation\noindent {\bfseries Abstract:}  % caption `Abstract' (bold)
 }{\endquotation\par\egroup} % End of definition of abstract

 %(Re)Define Author environment
 \let\orig@author\author % Store original \author commannd
 \renewcommand{\author}[2][\@empty]{% Optional Nick name
   \addtocounter{toc@numauthors}{1} % Increment number of authors
   \ifnum 1=\value{toc@numauthors} % This is the first author
     \ifx##1\@empty
       \gdef\toc@authors{##2}
     \else
       \gdef\toc@authors{\hyperlink{author.info.##1}{##2}}
     \fi
   \else
     \ifx##1\@empty
       \g@addto@macro\toc@authors{\and ##2}
     \else
       \g@addto@macro\toc@authors{%
         \and \hyperlink{author.info.##1}{##2}}
     \fi
   \fi
 }

 % Define tocacm, tocams, tockeywords commands
 \newcommand{\tocams}[1]{\renewcommand{\toc@amsclassification}{##1}}
 \newcommand{\tocacm}[1]{\renewcommand{\toc@acmclassification}{##1}}
 \newcommand{\tockeywords}[1]{\renewcommand{\toc@keywords}{##1}}
}{%
\ifnum \value{toc@numauthors}=0
    \renewcommand{\toc@authors}{{\color{red} No Authors Defined}}
\fi

\hypersetup{pdfkeywords={\toc@keywords}}

\orig@author{\toc@authors}
\toc@maketitle
\bigskip
%
\unvbox\toc@dedication
%
% If we are floating the classification data, we need to declare the
% float above the abstract in case it is long. This typeset the
% classification as float, amid the abstract in the case when it flows
% onto the second page.
\ifex\toc@floatclass{float}{\begin{figure}[!b]\toc@classificationbox\end{figure}}\fi
%
\unvbox\toc@abstract
%
\ifex{\toc@floatclass}{text}{\noindent\toc@classificationbox}\fi
% Typeset as text, following the
% abstract; this is fine unless the
% abstract is very long.

% Undefine keywords, abstract
\let\author\relax
\let\abstract\relax
\let\dedication\relax
\let\tocacm\relax
\let\tocams\relax
\let\tockeywords\relax
} % End of Frontmatter

% Special footnote construct for title footnotes that does not produce a footnote mark.

\newcommand{\titlefootnote}[1]{\booltrue{toc@set@titlefootnote}\renewcommand{\toc@titlefootnotetext}{#1}}
\def\toc@titlefootnote@display{\xdef\@thefnmark{}\@footnotetext}

% Generic hyperref construct
\newcommand{\expref}[2]{\texorpdfstring{\hyperref[#2]{#1~\ref{#2}}}{#1~\ref{#2}}} 
\newcommand{\expeqref}[2]{\texorpdfstring{\hyperref[#2]{#1~\eqref{#2}}}{#1~\eqref{#2}}} 
\newcommand{\exprefsilent}[2]{\texorpdfstring{\hyperref[#2]{#1}}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% \tocauthor and \tocaboutauthor environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Predefined e-mail punctuation.
\IfFileExists{tocat.png}{%
  \newcommand{\tocat}{\includegraphics[scale=0.0234]{tocat}}}{%
  \newcommand{\tocat}{~[at]~}}
\IfFileExists{tocdot.png}{%
  \newcommand{\tocdot}{\includegraphics[scale=0.0234]{tocdot}}}{%
  \newcommand{\tocdot}{~[dot]~}}

% Only have the plural version. Singular version will be an
% alternate name for the plural version. Environment will know
% whether to use plural or not based on the number of authors
% given

\newenvironment{tocauthors}{ % Beginning of environment

                     % Initialise an empty tocabout command
\newcommand{\tocabout}{\@empty}  

% Define tocinfo environment
 \newenvironment{tocinfo}[1][\@empty]{%
  \begin{verse}
  % Redefine \tocabout command for the author if nickname given
  \ifx##1\@empty
     \renewcommand{\tocabout}{\@empty}
  \else
     \renewcommand{\tocabout}%
                  {\hyperlink{author.about.##1}%
                  {\small [About the author]}}
  \fi
  \ifx##1\@empty\relax\else\hypertarget{author.info.##1}{}\fi
 }{% End of environment
\end{verse} \filbreak
} % End of tocinfo

\filbreak % Prefer a page break here rather than later
\bigskip\noindent
\ifnum \value{toc@numauthors}>1
   \textsf{AUTHORS}
\else
   \textsf{AUTHOR}
\fi
}{%
\let\tocinfo\relax % Undefine tocinfo
\let\tocabout\relax
}
%  end tocauthors environment

% singular is another name for plural
\newenvironment{tocauthor}{\begin{tocauthors}}{\end{tocauthors}}

\newenvironment{internal@tocaboutauthors}{ % Beginning of environment
 \newenvironment{tocabout}[1][\@empty]{%
  \begin{verse}
  \if##1\@empty\relax\else\hypertarget{author.about.##1}{}\fi
 }{%
\end{verse}\filbreak
}

\filbreak % Prefer a page break here rather than later
\bigskip\noindent
\ifnum \value{toc@numauthors}>1
  \textsf{ABOUT THE AUTHORS}
\else
  \textsf{ABOUT THE AUTHOR}
\fi
}{% end tocaboutauthors environment
\let\tocabout\relax
}
%  end tocaboutauthors environment

\newenvironment{tocaboutauthor}
               {\begin{tocaboutauthors}}{\end{tocaboutauthors}}
\newenvironment{tocaboutauthors}
               {\begin{internal@tocaboutauthors}}{\end{internal@tocaboutauthors}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Predefined macros for consistency in toc-publications.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\toc@setup@predefines}{%
% Theorems, lemmata, corollaries, etc. are interleaved 
% and numbered by section.
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{conjecture}[theorem]{Conjecture}
%
% Definition style theorem like environments
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{acknowledgement}[theorem]{Acknowledgement}
\newtheorem{axiom}[theorem]{Axiom}
\newtheorem{case}[theorem]{Case}
\newtheorem{conclusion}[theorem]{Conclusion}
\newtheorem{condition}[theorem]{Condition}
\newtheorem{criterion}[theorem]{Criterion}
\newtheorem{exercise}[theorem]{Exercise}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{problem}[theorem]{Problem}
\newtheorem{question}[theorem]{Question}
\newtheorem{solution}[theorem]{Solution}
\newtheorem{summary}[theorem]{Summary}
%
%%% Predefined Math Symbols
\newcommand{\C}{{\mathbb C}}
\newcommand{\R}{{\mathbb R}}
\newcommand{\Q}{{\mathbb Q}}
\newcommand{\Z}{{\mathbb Z}}
\newcommand{\N}{{\mathbb N}}
%
\newcommand{\eee}{\mathrm e}
\newcommand{\cclass}[1]{{\normalfont\textsf{##1}}}
\newcommand{\cproblem}[1]{{\normalfont\textsc{##1}}}
%
%%% Predefined Abbreviations
\newcommand{\ie}{i.\,e.} 
\newcommand{\Ie}{I.\,e.} 
\newcommand{\eg}{e.\,g.}
\newcommand{\Eg}{E.\,g.}
\newcommand{\phd}{Ph.\,D.}
\newcommand{\msc}{M.\,S.}
\newcommand{\bsc}{B.\,S.}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Things to do at the start and end of document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndOfClass{% Include eprint support, check for existence of custom icons.
\IfFileExists{eprint.sty}{\RequirePackage{eprint}}{%
\ClassWarningNoLine{tocbase}{No eprint support detected}}
\IfFileExists{tocat.png}{}{\ClassWarningNoLine{tocbase}{No graphic '@' symbol (tocat.png) found}}
\IfFileExists{tocdot.png}{}{\ClassWarningNoLine{tocbase}{No graphic '.' symbol (tocdot.png) found}}
}

\AtBeginDocument{%
  %% Set up page numbers according to tocdetails calls.
  %% First the first page:
  \ifex\toc@declaredfirstpage\@empty{%
    \ClassWarningNoLine{tocbase}{(Editor) Use the firstpage command to
      insure that page numbers match journal}}%
  \else{%
    \setcounter{page}{\toc@declaredfirstpage}%
    {\ifodd\toc@declaredfirstpage\else%
      \ClassWarningNoLine{tocbase}{(Editor) Starting page number (\toc@declaredfirstpage) is not odd}%
      \fi}}%
  \fi%
  %% Then the last page:
  %% Use the lastpage number determined by the lastpage package unless
  %% the lastpage has been hardcoded in the tocdetails command.
  \ifex\toc@declaredlastpage\@empty{}\else%
  \renewcommand{\toc@lastpage}{\toc@declaredlastpage}%
  \fi}

\AtEndDocument{%
  %% Produce a warning if the hardcoded lastpage disagrees with the
  %% compiled lastpage.
  \newcommand\toc@checklastpage{%
    \ifex\toc@declaredlastpage{\getpagerefnumber{LastPage}}{}\else%
    \ClassWarningNoLine{tocbase}{Declared last page
      (\toc@declaredlastpage) not equal to compiled last page (\getpagerefnumber{LastPage})}%
    \fi}
  \ifex\toc@declaredlastpage\@empty{}\else\toc@checklastpage\fi
}
