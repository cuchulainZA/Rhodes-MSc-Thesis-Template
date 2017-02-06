%% New RU Computer Science Class -- date changed from previous file 2010
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{newrucsthesis}[2007/09/15 New RU Computer Science Class]

\RequirePackage{graphicx}
\RequirePackage{calc}
\RequirePackage{fancybox}
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[12pt, a4paper]{report}

\newcommand{\Degree}{Master of Science}
\newcommand{\DegType}{partial fulfilment}
\newcommand{\degree}[1]{\renewcommand{\Degree}{#1}}
\newcommand{\partdegree}[1]{\renewcommand{\Degree}{#1} \renewcommand{\DegType}{partial fulfilment}}
\newcommand{\fulldegree}[1]{\renewcommand{\Degree}{#1} \renewcommand{\DegType}{partial fulfilment}}
\newcommand{\TitleBox}{false}
\newcommand{\titlebox}[1]{\renewcommand{\TitleBox}{#1}}
\newcommand{\Logo}{false}
\newcommand{\logo}[1]{\renewcommand{\Logo}{#1}}

\newcommand{\SetMargins}[3]{
	\setlength{\hoffset}{-1in + (#1 / 2)}
	\setlength{\voffset}{-1in}
	\setlength{\oddsidemargin}{#1}
	\setlength{\evensidemargin}{#1}
	\setlength{\topmargin}{#1}
	\ifthenelse{\boolean{#2}}{\setlength{\headheight}{15pt}%
		\setlength{\headsep}{20pt}}{\setlength{\headheight}{0pt}%
		\setlength{\headsep}{0pt}}
	\ifthenelse{\boolean{#3}}{\setlength{\footskip}{35pt}}%
		{\setlength{\footskip}{0pt}}
	\setlength{\textheight}{\paperheight - \footskip - \headsep - \headheight - \topmargin - #1}
	\setlength{\textwidth}{\paperwidth - (#1 * 2) - (#1 / 2)}

	\setlength\parskip{\bigskipamount}
	\setlength\parindent{0pt}
	\onehalfspacing
}

\SetMargins{2cm}{true}{true}

\renewcommand{\headrulewidth}{\iffloatpage{0pt}{0.4pt}}
\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername}\ \thechapter}{}}


%\fancypagestyle{plain}{\fancyhf{}\fancyhead[R]{\thepage}}
\fancyhf{}\fancyhead[R]{\thepage}
\fancyhead[L]{\iffloatpage{}{\slshape \rightmark}}


\renewcommand{\maketitle}{%
	\begin{titlepage}%
	\begin{center}%
	\ifthenelse{\boolean{\Logo}}{\includegraphics[scale=0.75]{ru}\vfill}{\vspace*{\fill}}%
	\ifthenelse{\boolean{\TitleBox}}{
	\Ovalbox{\begin{minipage}[c][\height + 6cm][c]{(\textwidth * 3) / 4}\begin{center}%
	\vspace*{\fill}\LARGE\textsc{\@title}%
	\large\vfill%
	Submitted in \DegType\\%
	of the requirements of the degree of\vskip 0.5em\textsc{\Degree}\vskip 0.5em%
	of Rhodes University%
	\vfill\Large\@author\vspace*{\fill}%
	\end{center}\end{minipage}}}{%

	\begin{center}%
	\vspace*{\fill}\LARGE\textsc{\@title}%
	\large\vfill%
	Submitted in \DegType\\%
	of the requirements of the degree of\vskip 0.5em\textsc{\Degree}\vskip 0.5em%
	of Rhodes University%
	\vfill\Large\@author\vspace*{\fill}%
	\end{center}}%

	\vfill\normalsize%
	\emph{Grahamstown, South Africa}\\%
%	\ifcase\month\or
%  January\or February\or March\or April\or May\or June\or
%  July\or August\or September\or October\or November\or December\fi
%  \space\number\year
	\@date
  \end{center}%
	\end{titlepage}%
}

\newcommand\ackname{Acknowledgements}

\if@titlepage
  \newenvironment{ack}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \ackname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{ack}{%
      \if@twocolumn
        \section*{\ackname}%
      \else
        \small
        \begin{center}%
          {\bfseries \ackname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi

\newcommand\acmname{ACM Computing Classification System Classification}

\if@titlepage
  \newenvironment{acm}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \acmname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{acm}{%
      \if@twocolumn
        \section*{\acmname}%
      \else
        \small
        \begin{center}%
          {\bfseries \ackname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi