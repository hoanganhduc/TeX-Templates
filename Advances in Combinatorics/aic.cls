%% Advances in Combinatorics class file
%%
%% aic.cls 1.0   2018-05-23    AiC style file
%------------------------------------------------------------------
% Filename: aic.cls
%
% This documentclass is intended for typesetting articles for the
% journal
%
%        Advances in Combinatorics
%
%% version 1.0 initial version.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Declare class and load external packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Need this version of LaTeX atleast (for ClassWarning commands)
\NeedsTeXFormat{LaTeX2e}[1994/06/01] 
\ProvidesClass{aic}[2018/05/23 v1.0 Advances in Combinatorics style]

% Pass all options along to tocbase:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tocbase}}

\newcommand{\toc@shortformarticle}{\@empty}

\ProcessOptions\relax
% Now load article class and handle options.
\LoadClass{tocbase}

\newcommand{\toc@commentsetup}{%
  \renewcommand{\toc@shortformarticle}{comment}
  \renewcommand\toc@bannermodifier{%
    \vspace{1em}{\toc@shortformbannerlayout{COMMENT}}%
    \par \vspace{1em} \hrule \vspace{1pt} \hrule}%
  \renewenvironment{tocaboutauthors}{%
    \ClassWarning{toc}{Use of ABOUT THE AUTHORS discouraged in Comments}\begin{internal@tocaboutauthors}}%
    {\end{internal@tocaboutauthors}}%
}

\newcommand{\toc@notesetup}{%
  \renewcommand{\toc@shortformarticle}{note}
  \renewcommand\toc@bannermodifier{%
    \vspace{1em}{\toc@shortformbannerlayout{NOTE}}%
    \par \vspace{1em} \hrule \vspace{1pt} \hrule}%
}

% Set up \imageat and \imagedot
\newcommand{\imageat}{\tocat}
\newcommand{\imagedot}{\tocdot}


% Setup tocdetails defaults
\newcommand{\toc@specialissue}{\@empty}

% Reset journal data
\renewcommand\toc@doiderefaddress{http://dx.doi.org/}
\renewcommand\toc@journalname{Advances in Combinatorics}
\renewcommand\toc@journaldoiaddress{\toc@doiderefaddress\toc@journaldoi}
\renewcommand\toc@journaladdress{www.advancesincombinatorics.com}
\renewcommand\toc@journaldoi{10.19086/aic}

% License addresses:
\renewcommand{\toc@cclicenseurl}{http://creativecommons.org/licenses/by/3.0/}
\renewcommand{\toc@licenseurl}{}

% DA articles start on page 1 unless otherwise specified.
\renewcommand{\toc@declaredfirstpage}{1}

% DA article do not use keywords or classification by default.
\renewcommand{\toc@acmclassification}{\@empty}
\renewcommand{\toc@amsclassification}{\@empty}
\renewcommand{\toc@keywords}{\@empty}

%% aicdetails hooks:
\define@key{pubdet}{article}[true]{}
\define@key{pubdet}{note}[true]{\toc@notesetup}
\define@key{pubdet}{comment}[true]{\toc@commentsetup}

% argument is a comma seperated list of the type "volume=6,year=8,..."
% If we have details of section we are interested in, process it
\newcommand{\aicdetails}[1]{\setkeys{pubdet}{#1}}
\newcommand{\aicAUTHORdetails}[1]{\setkeys{pubdet}{#1}}
\newcommand{\aicEDITORdetails}[1]{\setkeys{pubdet}{#1}}

\newenvironment{aicauthors}{
  % Define tocinfo environment
  \newenvironment{authorinfo}[1][\@empty]{%
    \begin{verse}
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
  \let\authorinfo\relax % Undefine authorinfo
}
%  end tocauthors environment

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%% PART: Title page components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\newcommand\toc@bannermodifier{\relax}
\newcommand\toc@bannerspecialissue{\relax}

\newcommand\toc@specialissuelayout[1]{\fontsize{14}{16}\usefont{OT1}{ptm}{m}{sc}\selectfont{#1}}
\newcommand\toc@shortformbannerlayout[1]{\fontsize{16}{18}\usefont{OT1}{phv}{m}{n}\selectfont{#1}}

\newcommand{\toc@bannerpubdata}
           {\fontsize{11}{13}\usefont{OT1}{ptm}{m}{n}\selectfont
           {\toc@year:\toc@number, \toc@lastpage~pp.}}

\renewcommand\toc@bannertexta%
{\ifex\toc@number\@empty
  \toc@bannerjournalname
 \else
 \toc@bannerjournalname,~\toc@bannerpubdata
 \fi}

\setlength{\toc@bannerwidth}{\textwidth}
\addtolength{\toc@bannerwidth}{-5mm}
\renewcommand{\toc@banner}{\toc@bannerhook%
  \begin{minipage}{\toc@bannerwidth}%
    \centering \toc@bannertexta\\ \toc@bannertextb\\
    \vspace{2mm} \hrule\vspace{1pt}\hrule%
   \toc@bannermodifier%
    \toc@bannerspecialissue%
  \end{minipage}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\renewcommand\toc@runningcitation%
{\ifex\toc@number\@empty
 \href{\toc@journaldoiaddress}{\textsc{\toc@journalname}}
\else
\href{\toc@journaldoiaddress}{\textsc{\toc@journalname}}, \toc@year:\toc@number, \toc@lastpage pp.
\fi
}
%% These two must be identical, save for the hyperlinks.

\renewcommand\toc@runningcitation@nolink%
{\ifex\toc@number\@empty
  \toc@journaldoiaddress
  \else
  \textsc{\toc@journalname}, \toc@year:\toc@number, \toc@lastpage pp.
\fi
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
\settoheight\toc@footerheight{\toc@footerlayout{\toc@runningcitation@nolink}}

%% Determine titlepage text area.
\setlength\toc@titlepagecorrection\toc@crboxheight
\addtolength\toc@titlepagecorrection{-\toc@footerheight}

% Define the default page style to be headings.
\pagestyle{headings}
\pagenumbering{arabic}

\AtBeginDocument{%
  {\ifex{\toc@shortformarticle}{\@empty}{%
      \numberwithin{equation}{section}}
    \else{}\fi}}

%% Predefined special issues
