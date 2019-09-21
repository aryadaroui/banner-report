% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Banner Report Class											
% v0.8 - Sep 2019
%
% Written by Arya Daroui, daroui.arya@gmail.com
% This work is under the MIT License
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% Base
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bannerReport}[2019/09/18 v0.8]
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}

% General Packages
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage{graphicx}
\RequirePackage{xpatch}
\RequirePackage[table]{xcolor}
\RequirePackage[framemethod = tikz]{mdframed}
\RequirePackage{calc}
\RequirePackage{listings}

% Margins
\RequirePackage[
	top = 1in,
	bottom = 1in,
	left= 0.7in,
	right = 0.7in,
	headheight = 0.7in,
	letterpaper
]{geometry}

% Font
\RequirePackage{fontspec}
\RequirePackage{times}
\newfontfamily{\light}[UprightFont={* Light}]{Helvetica Neue}
\newfontfamily{\mono}[Scale=.95]{Consolas}
\setmainfont[Ligatures=TeX]{Times}
\setsansfont{Helvetica Neue}
\setmonofont[Scale=.95]{Consolas}
% \lstset{
%   basicstyle=\ttfamily,
% }


% Figures and Tables Captions
\RequirePackage[labelfont={bf,sf,small}, labelsep=period, justification=raggedright]{caption}
\setlength{\abovecaptionskip}{3pt}
\setlength{\belowcaptionskip}{0pt}

% Text Positioning
\RequirePackage[absolute]{textpos}
\setlength{\TPHorizModule}{1in}
\setlength{\TPVertModule}{1in}

% Titlepage
\renewcommand{\title}[1]{\def\title{#1}}
\newcommand{\subtitle}[1]{\def\subtitle{#1}}
\newcommand{\info}[1]{\def\info{#1}}
\renewcommand{\author}[1]{\def\author{#1}}

\renewcommand{\titlepage}[1]{
	% banner
	\begin{textblock}{3.6}(0.7, 0.7)
		\vspace{-8pt}
		\noindent
		\begin{flushleft}
			\includegraphics{#1}
		\end{flushleft}
	\end{textblock}

	% info
	\begin{textblock}{3.4}(4.4, 0.7)
		\vspace{-9pt}
		\begin{flushright}
			\light{\info}
		\end{flushright}
	\end{textblock}

	% titles
	\begin{textblock}{3.4}(4.4, 2.5)
		\begin{flushleft}
			\noindent{\Huge{\sffamily{\textbf{\title}}}}
			\vspace{.1in}
			\textcolor{darkColor}{\rule{3.4in}{2.5pt}} 
			\color{darkColor}{\huge{\sffamily{\textbf{\subtitle}}}}
		\end{flushleft}
	\end{textblock}

	% author
	\begin{textblock}{3.4}[1,1](7.8, 10.3)
		\begin{flushright}
			\large{\light{\author}}
		\end{flushright}
		\vspace{-12pt}
	\end{textblock}

	\thispagestyle{empty}
	\null\newpage
	\setcounter{page}{1}
	\twocolumn
}

% Header and Footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\lhead{\color{darkColor}{\sffamily{\title \; --- \hspace{.08em} \subtitle}}}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\color{black}{\sffamily{\thepage}}}
\xpretocmd\headrule{\color{darkColor}}{}{\PatchFailed}
\xpretocmd\footrule{\color{darkColor}}{}{\PatchFailed}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}

% Sections
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{white}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{darkColor}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{
{\arabic{section}.\hfil} {\centering #1}}}}
  []
\titleformat{name=\section,numberless}
  {\color{white}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{darkColor}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering #1}}}
  []  
\titleformat{\subsection}
  {\color{darkColor}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    

% Environments

\newenvironment{dent}
{
	\begin{mdframed}[leftline=true, backgroundcolor=lightColor, innerleftmargin=.11in, linewidth=1.2pt, topline=false, bottomline=false, rightline=false, linecolor = darkColor]
}{		
	\end{mdframed}
}

\newenvironment{dent2}[1]
{
	\begin{mdframed}[hidealllines=true, backgroundcolor=lightColor, innerleftmargin=0in]
		\begin{tabular}{l !{\color{darkColor}\vline width 1.2pt} p{\linewidth - \widthof{#1}*\real{1.5} - 0.24in}}
			\color{darkColor}{\Large{#1}} &
}{		
		\end{tabular}
	\end{mdframed}
}

\lstnewenvironment{code}{
	\lstset{
		basicstyle=\ttfamily,
		frame = leftline,
		framerule=1.2pt,
		backgroundcolor=\color{lightColor},
		numbers=left,
		xleftmargin=.21in,
		rulecolor=\color{darkColor}
	}
}{}

% need figwide
% trash for now
% \begin{dent}
% 	\begin{lstlisting}[basicstyle=\ttfamily, frame = leftline, framerule=1pt, backgroundcolor=\color{lightColor}, numbers=left, xleftmargin=.14in,  rulecolor=\color{darkColor}, framexleftmargin=2pt, ]
% foo
% bar
% 	\end{lstlisting}
% \end{dent}