%%
%% This is file `CAS_syllabus.cls',
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{CAS_syllabus}
              [2016/08/12 v0.5
 NonStandard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
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
\newcommand\maketitle{\par
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
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\Large \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname~\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%Set modified header spacing
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -0.5ex \@minus -1.2ex}%
                                   {0.5ex \@plus.0ex}%
                                   {\normalsize\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.1ex \@plus .2ex}%
                                     {\normalsize\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.1ex \@plus .2ex}%
                                     {\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\center \normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalsize\bfseries}}

\usepackage[text={6.75in,9.38in}, top=0.8in, left=0.9in]{geometry}
\usepackage[protrusion=true,expansion=true]{microtype}
\usepackage{fancyhdr}
\usepackage{lastpage}
\usepackage{amssymb,amsfonts,amsmath,amsthm,eucal}
\usepackage[latin1]{inputenc}
%\usepackage[scaled=0.92]{beramono}
%\usepackage{units}
\usepackage{xspace}
%\usepackage{fp}


%--------------- set spacing  --------------------------------------------------
% \usepackage{setspace}

\usepackage[T1]{fontenc}
\usepackage{mathptmx}
%\usepackage{newtxmath}
%\usepackage{newtxtext}
\usepackage{graphicx}
  \graphicspath{ {assets/} }
\usepackage{underscore}
\usepackage{enumerate}
\usepackage{paralist}
\usepackage{longtable,datetime}
%\usepackage[normalem]{ulem} % \uwave{}),\uuline{},\sout{},\xout{}

% FOR FONTS:
\newcommand{\TimesFont}[2]{\fontfamily{ptm}\fontsize{#1}{#2}\selectfont }
\newcommand{\HelveticaFont}[2]{\fontfamily{phv}\fontsize{#1}{#2}\selectfont }
\newcommand{\UtopiaFont}[2]{\fontfamily{put}\fontsize{#1}{#2}\selectfont }
\newcommand{\PalatinoFont}[2]{\fontfamily{ppl}\fontsize{#1}{#2}\selectfont }
\newcommand{\NcntrsbkFont}[2]{\fontfamily{pnc}\fontsize{#1}{#2}\selectfont }
\newcommand{\CourierFont}[2]{\fontfamily{pcr}\fontsize{#1}{#2}\selectfont }
\newcommand{\BookmanFont}[2]{\fontfamily{pbk}\fontsize{#1}{#2}\selectfont }
\newcommand{\CharterFont}[2]{\fontfamily{bch}\fontsize{#1}{#2}\selectfont }
\newcommand{\AvantgardeFont}[2]{\fontfamily{pag}\fontsize{#1}{#2}\selectfont }
\newcommand{\OpensansFont}[2]{\fontfamily{fos}\fontsize{#1}{#2}\selectfont }

% FOR COLOR:
%\usepackage{color}
\usepackage[table]{xcolor}
%\input{stdcolors}
  \definecolor{darkred}{rgb}{0.7,0,0}
  \definecolor{darkbrown}{rgb}{0.45,.2,0}

  \definecolor{darkbrown}{rgb}{0.4,0.1,0}
  \definecolor{darkgreen}{rgb}{0.1,0.4,0.2}
  \definecolor{darkblue}{rgb}{0.0,0.2,0.4}
  \definecolor{linkblue}{rgb}{0.0,0.14,0.72}
%  \definecolor{unhblue}{rgb}{0.05,0.2,0.6}
  \definecolor{unhlink}{rgb}{0.42,0.28,0.2}
  \definecolor{unhblue}{rgb}{0.08,0.32,0.55}
  \definecolor{pink}{rgb}{1,.3,.9}
  \definecolor{paleyellow1}{rgb}{1,1,0.85}
  \definecolor{paleyellow2}{rgb}{1,1,0.95}
  \definecolor{gold}{rgb}{1,.8,.1}
  \definecolor{darkgold}{rgb}{.9,.6,.02}
  \definecolor{palegreen1}{rgb}{0.9,1,0.9}
  \definecolor{palegreen2}{rgb}{0.88,0.97,0.88}
%  \definecolor{paleblue1}{rgb}{0.9,0.92,1.0}
  \definecolor{paleblue1}{rgb}{0.91,0.96,1.0}
  \definecolor{paleblue2}{rgb}{0.9,0.92,0.97}
  \definecolor{paleyellow}{rgb}{1.0,1,0.95}
  \definecolor{DeepPink}{rgb}{1,0.078,0.576}
 
  \definecolor{gray10}{rgb}{.1,.1,.1}
  \definecolor{gray20}{rgb}{.2,.2,.2}
  \definecolor{gray30}{rgb}{.3,.3,.3}
  \definecolor{gray40}{rgb}{.4,.4,.4}
  \definecolor{gray45}{rgb}{.45,.45,.45}
  \definecolor{gray50}{rgb}{.5,.5,.5}
  \definecolor{gray60}{rgb}{.6,.6,.6}
  \definecolor{gray70}{rgb}{.7,.7,.7}
  \definecolor{gray80}{rgb}{.8,.8,.8}
  \definecolor{gray90}{rgb}{.9,.9,.9}
  \definecolor{gray98}{rgb}{.98,.98,.98}
  \definecolor{gray99}{rgb}{.99,.99,.99}

\newcommand{\changed}[1]{\textbf{\color{DeepPink}{#1}}}

\newcommand{\unhcolor}{\color{unhblue}}
\newcommand{\tofill}[1]{\color{red}{#1}}
\usepackage{hyperref}
\usepackage{url}
\hypersetup{colorlinks=true,linkcolor={unhlink},urlcolor={unhlink}}

\newcommand{\linewide}{0.8pt}
\renewcommand{\arraystretch}{1.0}
\renewcommand{\arrayrulewidth}{\linewide}
\newcommand{\colorfirst}{white}
\newcommand{\colornext}{white}
\rowcolors{3}{\colorfirst}{\colornext}
%\setlength{\tabcolsep}{-4.3pt}

\newcommand{\ec}{\usefont{T1}{antt}{sb}{n}\fontsize{10.2}{10.2}\selectfont  \color{darkbrown}}
%\newcommand{\ec}{\color{darkgreen}}
%\newcommand{\ec}{\usefont{T1}{phv}{m}{n}\fontsize{10.2}{10.2}\selectfont  \color{darkgreen}}
\newcommand{\el}{\color{darkblue}}
\newcommand{\hilite}{\color{darkred}}
\newcommand{\Ss}{\textbf{\S}\hspace*{-0.2em} }
\newcommand{\Sb}[1]{\textbf{\ec\S}\textbf{#1}:\hspace*{0.05em}}
\newcommand{\Ex}[1]{\textbf{\color{darkgold} \raisebox{0.088em}{$\bigstar$}}\hspace*{-0.025em}{#1}\hspace*{0.05em}}
%\newcommand{\Se}{$\circ$\;}
\newcommand{\Se}{;\;}
\newcommand{\tel}[1]{\textbf{\el {#1}}}

\newcommand{\Title}[1]{\vspace*{1.0em} \section*{\centering \unhcolor \LARGE {#1}}}
\newcommand{\SubTitle}[1]{\vspace*{0.0em} \section*{\centering \unhcolor \LARGE {#1}}}
\newcommand{\Topic}[1]{\section*{\centering \unhcolor \large {#1}}\vspace{0.4em}}
\newcommand{\Subtopic}[1]{\vspace{-0.3em}\subsection*{\color{gray20} {#1}} \vspace*{-0.4em}}

%\newcommand{\tfont}[1]{\texttt{\small \color{darkbrown} \textbf{#1}}}
\newcommand{\tfont}[1]{\texttt{\small \color{darkgreen} \textbf{#1}}}
\newcommand{\tfontw}[1]{\texttt{\small \color{darkbrown} \textbf{#1}}}


\newcommand{\LastPage}{\label{lastpage}}
\font\fsbfontb  = ptmr scaled 980

%..............................................................................
\newcommand{\Fl}{\hspace*{0.1em}}
\newcommand{\Fm}{\hspace*{0.07em}}
\newcommand{\Fs}{\hspace*{0.04em}}
\newcommand{\CAShead}{
\setlength{\unitlength}{1in}
\begin{picture}(0.0,0.0)(0.35,0.0)
\includegraphics[scale=0.7]{./CASseal}
\end{picture}
\begin{picture}(0.0,0.0)(0.25,3.3)
\put(2.659,3.16){\makebox(0,0){\unhcolor \rule[0pt]{9.28cm}{0.6pt} }}
\usefont{OT1}{pag}{m}{n}\fontsize{9.95}{11}\selectfont \textbf{
%
\put(2.05,3.30){\makebox(0,0){\unhcolor
C{}O{\Fm}L{\Fm}L{\Fm}E{\Fm}G{\Fm}E \  O{\Fm}F \ A{\Fl}R{\Fl}T{\Fl}S \ A{\Fm}N{\Fm}D \ S{\Fm}C{\Fm}I{\Fm}E{\Fm}N{\Fm}C{\Fm}E{\Fm}S}}
%
%\usefont{T1}{phv}{m}{n}\fontsize{11.6}{12}\selectfont  \sf  \textbf{
\put(4.03,3.02){\makebox(0,0){\parbox[t]{16.4cm}{\unhcolor
D{\Fs}e{\Fs}p{\Fs}a{\Fs}r{\Fs}t{\Fs}m{\Fs}e{\Fs}n{\Fs}t  o{\Fs}f  M{\Fs}a{\Fs}t{\Fs}h{\Fs}e{\Fs}m{\Fs}a{\Fs}t{\Fs}i{\Fs}c{\Fs}s  a{\Fs}n{\Fs}d  P{\Fs}h{\Fs}y{\Fs}s{\Fs}i{\Fs}c{\Fs}s  }}}
}
\end{picture}

%\newcommand{\syllabusfontn}{\HelveticaFont{10.0}{14.0}}
%\newcommand{\syllabusfontl}{\HelveticaFont{11.0}{16.2}}
%\newcommand{\syllabusfonts}{\HelveticaFont{9.0}{12.0}}
%\newcommand{\syllabusfontf}{\HelveticaFont{8.2}{10.8}}
%\newcommand{\syllabusfontstable}{\syllabusfonts}
\newcommand{\syllabusfontn}{\OpensansFont{9.7}{13.2}}
\newcommand{\syllabusfontl}{\OpensansFont{11.0}{16.2}}
\newcommand{\syllabusfonts}{\OpensansFont{8.8}{11.8}}
\newcommand{\syllabusfontf}{\OpensansFont{8.2}{10.8}}
\newcommand{\syllabusfontstable}{\syllabusfonts}
%\renewcommand{\mathrm}{\HelveticaFont{9.2}{12.8}}



\hspace*{1.8cm}\parbox[t]{8cm}{
%\CharterFont{12}{14}
\HelveticaFont{12}{14}
%\AvantgardeFont{12}{12}
\textbf{\unhcolor
%JK\usefont{T1}{phvb}{b}{n}\fontsize{11.6}{12}\selectfont  \sf
%The University of New Haven \\[0.2em]
%JKThe College of Arts and Sciences \\[0.2em]
%JKDepartment of Mathematics and Physics
 }
}
%\begin{picture}(8.0,0.0)(-5.6,0.2)
%\includegraphics[scale=0.28]{./CASseal}
%\end{picture}
\vspace*{-0.8em}
\syllabusfontn
}
%..............................................................................

\newcommand{\LCAShead}{
\begin{center}
\end{center}
\setlength{\unitlength}{1in}
\begin{picture}(0.0,0.0)(0.0,0.0)
\includegraphics[scale=1.10]{./CASseal}
\end{picture}
\vspace*{-1.8em}
}

%..............................................................................
%\urlstyle{rm}
%\urlstyle{sf}
%\urlstyle{tt}
%\newcommand{\ufont}{\usefont{T1}{LinuxBiolinumT-OsF}{m}{n}\fontsize{11.0}{14.2}\selectfont}
%\newcommand{\ufont}{\usefont{T1}{txtt}{sb}{n}\fontsize{10.2}{14.2}\selectfont }
\newcommand{\ufont}{\usefont{T1}{txtt}{bx}{n}\fontsize{10.2}{14.2}\selectfont }
\renewcommand{\UrlFont}{\small\ufont}
%
%\makeatletter
%\def\url@foostyle{%
%  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
%\makeatother
%\urlstyle{foo}
%\urlstyle{same}
%
\def\UrlBreaks{\do\.\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%no @
 \do\)\do\,\do\?\do\'\do+\do\=\do\#}%
\def\UrlBigBreaks{\do\/\do@url@hyp}%add /
\def\UrlSpecials{\do\/{\Url@slash}\do\ {\Url@space}\do\%{\Url@percent}\do\^^M{\Url@space}%
   \Url@force@Tilde}%
\def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.15em}%
   {\kern-.05em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
%
%\newcommand{\Urls}[1]{
%%\textls[-20]{}
%\href{#1}{\color{blue}\url{#1}}}
%\newcommand{\Urlx}[2]{
%{\ufont \color{blue}
%\href{#1}{#2}}}
%\newcommand{\MailTo}[1]{
%{\ufont \color{blue}
%\href{mailto:{#1}}{#1}}}
%\newcommand{\Urls}[1]{{\ufont\href{#1}{\url{#1}}}}
\newcommand{\Urls}[1]{{\ufont\href{#1}{\url{#1}}}} 
\newcommand{\Urlx}[2]{{\ufont\href{#1}{#2}}}
\newcommand{\MailTo}[1]{{\ufont\href{mailto:{#1}}{#1}}}


%\newcommand{\syllabusfontn}{\HelveticaFont{10.2}{14.8}}
%\newcommand{\syllabusfontl}{\HelveticaFont{11.0}{16.2}}
%\newcommand{\syllabusfonts}{\HelveticaFont{9.0}{12.8}}
%\newcommand{\syllabusfontf}{\HelveticaFont{8.2}{10.8}}
%\newcommand{\syllabusfontstable}{\syllabusfonts}
%%\renewcommand{\mathrm}{\HelveticaFont{9.2}{12.8}}

\define@key{headers}{instructor}{\def\Instructor{#1}\xspace}
\define@key{headers}{phone}{\def\Phone{#1}\xspace}
\define@key{headers}{course}{\def\Course{#1\xspace}}
\define@key{headers}{coursesection}{\def\Coursesection{#1\xspace}}
%\define@key{headers}{syllabusparti}{\def\Syllabusparti{#1}}
\define@key{headers}{coursecrosslist}{\def\Coursecrosslist{#1\xspace}}
\define@key{headers}{coursename}{\def\Coursename{#1\xspace}}
\define@key{headers}{coursetext}{\def\Coursetext{#1\xspace}}
\define@key{headers}{revision}{\def\Revision{#1\xspace}}
\define@key{headers}{semester}{\def\Semester{#1\xspace}}
\define@key{headers}{office}{\def\Office{#1\xspace}}
\define@key{headers}{meetingtimes}{\def\Meetingtimes{#1\xspace}}
\define@key{headers}{classroom}{\def\Classroom{#1\xspace}}
\define@key{headers}{email}{\def\Email{#1\xspace}}
\define@key{headers}{webpages}{\def\Webpages{#1}}
\define@key{headers}{officehours}{\def\Officehours{#1\xspace}}
\define@key{headers}{credits}{\def\Credits{#1\xspace}}
\define@key{headers}{addanddrop}{\def\Addanddrop{#1\xspace}}
\define@key{headers}{undergraduatecalendarurl}{\def\UndergraduatecalendarURL{#1}\xspace}
\define@key{headers}{gradepolicyurl}{\def\GradepolicyURL{#1}\xspace}
\define@key{headers}{importantdatesurl}{\def\ImportantdatesURL{#1}\xspace}
\define@key{headers}{finalexamurl}{\def\FinalexamURL{#1}\xspace}
\define@key{headers}{integrityurl}{\def\IntegrityURL{#1}\xspace}
\define@key{headers}{studenthandbook}{\def\Studenthandbook{#1}\xspace}
\define@key{headers}{codeofconducthb}{\def\CodeofconductSHURL{#1}\xspace}
\define@key{headers}{attendancehb}{\def\AttendanceSHURL{#1}\xspace}
\define@key{headers}{courseworkexpecturl}{\def\CourseworkexpectURL{#1}\xspace}
\define@key{headers}{courseworkurl}{\def\CourseworkURL{#1}\xspace}
\define@key{headers}{attendanceurl}{\def\AttendanceURL{#1}\xspace}
\define@key{headers}{assignmenturl}{\def\AssignmentURL{#1}\xspace}
\define@key{headers}{accessurl}{\def\AccessURL{#1}\xspace}
\define@key{headers}{titleixurl}{\def\TitleixURL{#1}\xspace}
\define@key{headers}{clrurl}{\def\ClrURL{#1}\xspace}
\define@key{headers}{incompletepolicyurl}{\def\IncompletepolicyURL{#1}\xspace}
\define@key{headers}{holidaypolicyhb}{\def\HolidaypolicySHURL{#1}\xspace}
\define@key{headers}{internathandbookurl}{\def\InternathandbookURL{#1}\xspace}
\define@key{headers}{academicsuccessurl}{\def\AcademicsuccessURL{#1}\xspace}
\define@key{headers}{semesterclasses}{\def\Semesterclasses{#1}\xspace}
\define@key{headers}{startsemesterclasses}{\def\Startsemesterclasses{#1}\xspace}
\define@key{headers}{endsemesterclasses}{\def\Endsemesterclasses{#1}\xspace}
\define@key{headers}{lastdropdate}{\def\Lastdropdate{#1}\xspace}
\define@key{headers}{semesterholidays}{\def\Semesterholidays{#1}\xspace}
\define@key{headers}{semesterfinalexam}{\def\Semesterfinalexam{#1}\xspace}
\define@key{headers}{bookstoretext}{\def\Bookstore{#1}\xspace}
\define@key{headers}{withdrawalform}{\def\WithdrawalFORM{#1}\xspace}
\define@key{headers}{biaspolicyform}{\def\BiaspolicyFORM{#1}\xspace}


\newcommand{\Heading}[1][]{%
 \setkeys{headers}{#1}
\CAShead
\thispagestyle{plain}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
%\fancyhead[LE,RO]{\sc{#1}}
%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%                           The University  of New Haven}}
\lfoot{\fsbfontb {\Course \Coursesection, \Meetingtimes}}
\rfoot{\fsbfontb {Rev.\ \Revision}}
\cfoot{\fsbfontb Page \thepage\hspace*{1pt} of \pageref{lastpage}}
}

\newcommand{\SHeading}[1][]{%
 \setkeys{headers}{#1}
\CAShead
\thispagestyle{plain}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
%\fancyhead[LE,RO]{\sc{#1}}
%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%                           The University  of New Haven}}
\lfoot{\fsbfontb {Department Syllabus for \Course, \Semester}}
\rfoot{\fsbfontb {Rev.\ \Revision}}
\cfoot{\fsbfontb Page \thepage\hspace*{1pt} of \pageref{lastpage}}
}


\newcommand{\HHeading}[1][]{%
 \setkeys{headers}{#1}
\LCAShead
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
%\fancyhead[LE,RO]{\sc{#1}}
%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%                           The University  of New Haven}}
\lfoot{\fsbfontb {\Course \Coursesection, Syllabus, Rev.\ \Revision}}
\rfoot{\fsbfontb {\Semester, \, \Meetingtimes}}
\cfoot{\fsbfontb Page \thepage\hspace*{1pt} of \pageref{lastpage}}
}

\newcommand{\VHeading}[1][]{%
 \setkeys{headers}{#1}
\LCAShead
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
%\fancyhead[LE,RO]{\sc{#1}}
%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%                           The University  of New Haven}}
\lfoot{\fsbfontb {\Course \, Syllabus, Rev.\ \Revision}}
\rfoot{\fsbfontb {\Semester, \, \Meetingtimes}}
\cfoot{\fsbfontb Page \thepage\hspace*{1pt} of \pageref{lastpage}}
}

\newcommand{\Syllabushead}[1][]{%
\vspace*{1.8em}
 \setkeys{headers}{#1}
}
%



\newcommand{\Coursehead}[1][]{%
\vspace*{2.8em}
% \setkeys{headers}{key={#1}}
 \setkeys{headers}{#1}
\noindent
%\hspace*{-0.8em}
%\begin{tabular}{p{3.0in}>{\hfill}p{4.5in}}
\parbox[t]{3.5in}{
  \textbf{\unhcolor Course}: \Course \Coursesection  \\
  \textbf{\unhcolor Title}: \Coursename \\
  \textbf{\unhcolor Credit Hours}: \Credits
} \hfill \hspace*{1.1em}
%
\parbox[t]{3.5in}{
\begin{flushleft}\vspace{-1.8em}
  \textbf{\unhcolor Semester}: \Semester \\
  \textbf{\unhcolor Classroom}: \Classroom \\ 
  \textbf{\unhcolor Meeting Times}: \Meetingtimes
\end{flushleft}
}

\noindent
\parbox[t]{3.5in}{
  \textbf{\unhcolor Instructor}: \Instructor \\
  \textbf{\unhcolor Email}: \Email \\
%  \textbf{\unhcolor Webpage}: \Webpages \\
} \hfill \hspace*{1.1em}
\parbox[t]{3.5 in}{
\begin{flushleft}\vspace*{-1.8em}
  \textbf{\unhcolor Office}: \Office \\
  \textbf{\unhcolor Office Hours}: \Officehours \\
\end{flushleft}
\vspace*{-0.5em}
}
\noindent
}
\newcommand{\Web}[1]{
  \begin{flushright}{\vspace*{-2.4em}
      \textbf{\unhcolor Web}: \Urls{#1}
    }\end{flushright}
}
\newcommand{\Extra}[2]{
  \vspace*{-0.5em}
  \noindent
  \textbf{\unhcolor {#1}}: {#2}
}





\newcommand{\Assignmenthead}[2][]{%
 \setkeys{headers}{#1}
{
\syllabusfonts
\vspace*{-5.9em}
\section*{
\renewcommand{\thefootnote}{}
\unhcolor \hfill Assignments for \Course, \Coursename
\footnotetext[0]{\syllabusfonts \Instructor, \Office,\, \Phone,\, \Email. Office hours: \Officehours.},
 }
\section*{\unhcolor \hfill \Semester,\, \Meetingtimes,\, \Classroom} 
\vspace*{1.2cm}
}
}


\define@key{schedule}{day01}{\def\Dayaa{#1}}
\define@key{schedule}{day02}{\def\Dayab{#1}}
\define@key{schedule}{day03}{\def\Dayac{#1}}
\define@key{schedule}{day04}{\def\Dayad{#1}}
\define@key{schedule}{day05}{\def\Dayae{#1}}
\define@key{schedule}{day06}{\def\Dayaf{#1}}
\define@key{schedule}{day07}{\def\Dayag{#1}}
\define@key{schedule}{day08}{\def\Dayah{#1}}
\define@key{schedule}{day09}{\def\Dayai{#1}}
\define@key{schedule}{day10}{\def\Dayaj{#1}}
\define@key{schedule}{day11}{\def\Dayak{#1}}
\define@key{schedule}{day12}{\def\Dayal{#1}}
\define@key{schedule}{day13}{\def\Dayam{#1}}
\define@key{schedule}{day14}{\def\Dayan{#1}}
\define@key{schedule}{day15}{\def\Dayao{#1}}
\define@key{schedule}{day16}{\def\Dayap{#1}}
\define@key{schedule}{day17}{\def\Dayaq{#1}}
\define@key{schedule}{day18}{\def\Dayar{#1}}
\define@key{schedule}{day19}{\def\Dayas{#1}}
\define@key{schedule}{day20}{\def\Dayat{#1}}
\define@key{schedule}{day21}{\def\Dayau{#1}}
\define@key{schedule}{day22}{\def\Dayav{#1}}
\define@key{schedule}{day23}{\def\Dayaw{#1}}
\define@key{schedule}{day24}{\def\Dayax{#1}}
\define@key{schedule}{day25}{\def\Dayay{#1}}
\define@key{schedule}{day26}{\def\Dayaz{#1}}
\define@key{schedule}{day27}{\def\Dayba{#1}}
\define@key{schedule}{day28}{\def\Daybb{#1}}
\define@key{schedule}{day29}{\def\Daybc{#1}}
\define@key{schedule}{day30}{\def\Daybd{#1}}
\define@key{schedule}{day31}{\def\Daybe{#1}}
\define@key{schedule}{day32}{\def\Daybf{#1}}
\define@key{schedule}{day33}{\def\Daybg{#1}}
\define@key{schedule}{day34}{\def\Daybh{#1}}
\define@key{schedule}{day35}{\def\Daybi{#1}}
\define@key{schedule}{day36}{\def\Daybj{#1}}
\define@key{schedule}{day37}{\def\Daybk{#1}}
\define@key{schedule}{day38}{\def\Daybl{#1}}
\define@key{schedule}{day39}{\def\Daybm{#1}}
\define@key{schedule}{day40}{\def\Daybn{#1}}
\define@key{schedule}{day41}{\def\Daybo{#1}}
\define@key{schedule}{day42}{\def\Daybp{#1}}
\define@key{schedule}{day43}{\def\Daybq{#1}}
\define@key{schedule}{day44}{\def\Daybr{#1}}
\define@key{schedule}{day45}{\def\Daybs{#1}}
\define@key{schedule}{day46}{\def\Daybt{#1}}
\define@key{schedule}{day47}{\def\Daybu{#1}}
\define@key{schedule}{day48}{\def\Daybv{#1}}
\define@key{schedule}{day49}{\def\Daybw{#1}}
\define@key{schedule}{day50}{\def\Daybx{#1}}
\define@key{schedule}{day51}{\def\Dayby{#1}}
\define@key{schedule}{day52}{\def\Daybz{#1}}


\define@key{schedule}{sec01}{\def\Secaa{#1}}
\define@key{schedule}{sec02}{\def\Secab{#1}}
\define@key{schedule}{sec03}{\def\Secac{#1}}
\define@key{schedule}{sec04}{\def\Secad{#1}}
\define@key{schedule}{sec05}{\def\Secae{#1}}
\define@key{schedule}{sec06}{\def\Secaf{#1}}
\define@key{schedule}{sec07}{\def\Secag{#1}}
\define@key{schedule}{sec08}{\def\Secah{#1}}
\define@key{schedule}{sec09}{\def\Secai{#1}}
\define@key{schedule}{sec10}{\def\Secaj{#1}}
\define@key{schedule}{sec11}{\def\Secak{#1}}
\define@key{schedule}{sec12}{\def\Secal{#1}}
\define@key{schedule}{sec13}{\def\Secam{#1}}
\define@key{schedule}{sec14}{\def\Secan{#1}}
\define@key{schedule}{sec15}{\def\Secao{#1}}
\define@key{schedule}{sec16}{\def\Secap{#1}}
\define@key{schedule}{sec17}{\def\Secaq{#1}}
\define@key{schedule}{sec18}{\def\Secar{#1}}
\define@key{schedule}{sec19}{\def\Secas{#1}}
\define@key{schedule}{sec20}{\def\Secat{#1}}
\define@key{schedule}{sec21}{\def\Secau{#1}}
\define@key{schedule}{sec22}{\def\Secav{#1}}
\define@key{schedule}{sec23}{\def\Secaw{#1}}
\define@key{schedule}{sec24}{\def\Secax{#1}}
\define@key{schedule}{sec25}{\def\Secay{#1}}
\define@key{schedule}{sec26}{\def\Secaz{#1}}
\define@key{schedule}{sec27}{\def\Secba{#1}}
\define@key{schedule}{sec28}{\def\Secbb{#1}}
\define@key{schedule}{sec29}{\def\Secbc{#1}}
\define@key{schedule}{sec30}{\def\Secbd{#1}}
\define@key{schedule}{sec31}{\def\Secbe{#1}}
\define@key{schedule}{sec32}{\def\Secbf{#1}}
\define@key{schedule}{sec33}{\def\Secbg{#1}}
\define@key{schedule}{sec34}{\def\Secbh{#1}}
\define@key{schedule}{sec35}{\def\Secbi{#1}}
\define@key{schedule}{sec36}{\def\Secbj{#1}}
\define@key{schedule}{sec37}{\def\Secbk{#1}}
\define@key{schedule}{sec38}{\def\Secbl{#1}}
\define@key{schedule}{sec39}{\def\Secbm{#1}}
\define@key{schedule}{sec40}{\def\Secbn{#1}}
\define@key{schedule}{sec41}{\def\Secbo{#1}}
\define@key{schedule}{sec42}{\def\Secbp{#1}}
\define@key{schedule}{sec43}{\def\Secbq{#1}}
\define@key{schedule}{sec44}{\def\Secbr{#1}}
\define@key{schedule}{sec45}{\def\Secbs{#1}}
\define@key{schedule}{sec46}{\def\Secbt{#1}}
\define@key{schedule}{sec47}{\def\Secbu{#1}}
\define@key{schedule}{sec48}{\def\Secbv{#1}}
\define@key{schedule}{sec49}{\def\Secbw{#1}}
\define@key{schedule}{sec50}{\def\Secbx{#1}}
\define@key{schedule}{sec51}{\def\Secby{#1}}
\define@key{schedule}{sec52}{\def\Secbz{#1}}


\define@key{schedule}{wrk01}{\def\Wrkaa{#1}}
\define@key{schedule}{wrk02}{\def\Wrkab{#1}}
\define@key{schedule}{wrk03}{\def\Wrkac{#1}}
\define@key{schedule}{wrk04}{\def\Wrkad{#1}}
\define@key{schedule}{wrk05}{\def\Wrkae{#1}}
\define@key{schedule}{wrk06}{\def\Wrkaf{#1}}
\define@key{schedule}{wrk07}{\def\Wrkag{#1}}
\define@key{schedule}{wrk08}{\def\Wrkah{#1}}
\define@key{schedule}{wrk09}{\def\Wrkai{#1}}
\define@key{schedule}{wrk10}{\def\Wrkaj{#1}}
\define@key{schedule}{wrk11}{\def\Wrkak{#1}}
\define@key{schedule}{wrk12}{\def\Wrkal{#1}}
\define@key{schedule}{wrk13}{\def\Wrkam{#1}}
\define@key{schedule}{wrk14}{\def\Wrkan{#1}}
\define@key{schedule}{wrk15}{\def\Wrkao{#1}}
\define@key{schedule}{wrk16}{\def\Wrkap{#1}}
\define@key{schedule}{wrk17}{\def\Wrkaq{#1}}
\define@key{schedule}{wrk18}{\def\Wrkar{#1}}
\define@key{schedule}{wrk19}{\def\Wrkas{#1}}
\define@key{schedule}{wrk20}{\def\Wrkat{#1}}
\define@key{schedule}{wrk21}{\def\Wrkau{#1}}
\define@key{schedule}{wrk22}{\def\Wrkav{#1}}
\define@key{schedule}{wrk23}{\def\Wrkaw{#1}}
\define@key{schedule}{wrk24}{\def\Wrkax{#1}}
\define@key{schedule}{wrk25}{\def\Wrkay{#1}}
\define@key{schedule}{wrk26}{\def\Wrkaz{#1}}
\define@key{schedule}{wrk27}{\def\Wrkba{#1}}
\define@key{schedule}{wrk28}{\def\Wrkbb{#1}}
\define@key{schedule}{wrk29}{\def\Wrkbc{#1}}
\define@key{schedule}{wrk30}{\def\Wrkbd{#1}}
\define@key{schedule}{wrk31}{\def\Wrkbe{#1}}
\define@key{schedule}{wrk32}{\def\Wrkbf{#1}}
\define@key{schedule}{wrk33}{\def\Wrkbg{#1}}
\define@key{schedule}{wrk34}{\def\Wrkbh{#1}}
\define@key{schedule}{wrk35}{\def\Wrkbi{#1}}
\define@key{schedule}{wrk36}{\def\Wrkbj{#1}}
\define@key{schedule}{wrk37}{\def\Wrkbk{#1}}
\define@key{schedule}{wrk38}{\def\Wrkbl{#1}}
\define@key{schedule}{wrk39}{\def\Wrkbm{#1}}
\define@key{schedule}{wrk40}{\def\Wrkbn{#1}}
\define@key{schedule}{wrk41}{\def\Wrkbo{#1}}
\define@key{schedule}{wrk42}{\def\Wrkbp{#1}}
\define@key{schedule}{wrk43}{\def\Wrkbq{#1}}
\define@key{schedule}{wrk44}{\def\Wrkbr{#1}}
\define@key{schedule}{wrk45}{\def\Wrkbs{#1}}
\define@key{schedule}{wrk46}{\def\Wrkbt{#1}}
\define@key{schedule}{wrk47}{\def\Wrkbu{#1}}
\define@key{schedule}{wrk48}{\def\Wrkbv{#1}}
\define@key{schedule}{wrk49}{\def\Wrkbw{#1}}
\define@key{schedule}{wrk50}{\def\Wrkbx{#1}}
\define@key{schedule}{wrk51}{\def\Wrkby{#1}}
\define@key{schedule}{wrk52}{\def\Wrkbz{#1}}

\newcommand{\tableheaderl}{
\begin{longtable}{p{0.4cm}|p{1.6cm}|p{4cm}|p{11.2cm}}
$N$ & \hspace*{0.8em} \textbf{Date } & \hspace*{2.0em}  \textbf{Reading or Task} &  \hspace*{5.0em} \textbf{Assignment due  for class discussion} \\
}
\newcommand{\tableheaders}{
\begin{longtable}{p{0.4cm}|p{1.6cm}|p{4cm}|p{9.2cm}}
$N$ & \hspace*{0.8em} \textbf{Date } & \hspace*{2.0em}  \textbf{Reading or Task} &  \hspace*{5.0em} \textbf{Assignment due for class discussion} \\
}
\newcommand{\tableheaderh}{
\begin{longtable}{p{0.4cm}|p{1.6cm}|p{4cm}|p{16.0cm}}
$N$ & \hspace*{0.8em} \textbf{Date } & \hspace*{2.0em}  \textbf{Reading or Task} &  \hspace*{12.0em} \textbf{Assignment due for class discussion} \\
}


\newcommand{\tableheader}{\tableheaderl}


\newcommand{\Quote}[1]{
\parbox[t]{16cm}{
\syllabusfonts
{#1}
}
}

% to include part i of syllabus   
\usepackage{pdfpages}
  

\endinput
%%
%% End of file `CAS_syllabus.cls'.
