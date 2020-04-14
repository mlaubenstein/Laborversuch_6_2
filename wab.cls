% wab.cls - class for the WAB lecture of the HfTL
%
% Copyright (C) 2015 Roman Szczepanski.
%
%
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wab}[2015/10/03 v1.0 WAB Class]

%\DeclareOption{ngerman}{\PassOptionsToPackage{ngerman}{babel}}
%\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{babel}}


\ProcessOptions \relax

%\LoadClassWithOptions{scrbook}
\LoadClass[12pt,titlepage,oneside]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

% utf8 input encoding
\RequirePackage[utf8]{inputenc}

% worttrennung babel
\RequirePackage[ngerman]{babel}
\RequirePackage{csquotes}

\RequirePackage{scrhack}

%für \ifthen befehl
\RequirePackage{ifthen}

% Hochformat, Anpassen der Ränder
\RequirePackage[portrait,top=20mm,bottom=20mm,left=25mm,right=25mm,a4paper,pdftex]{geometry}

% zum einbinden von Grafiken und dem Nutzen von Farben
\RequirePackage[pdftex,final]{graphicx}
\RequirePackage[pdftex,final]{xcolor}

% um Bilder textumflossen darstellen zu können
\RequirePackage{wrapfig}

% um Bilder und Objekte zu drehen
\RequirePackage{rotating}

% u.a. picture-Manipulation, weitere Fließumgebungen
\RequirePackage{float}

\RequirePackage{subcaption}

\RequirePackage{listings}

\RequirePackage{courier}

%Umbenennung der Tabellen und Bild Beschriftungen
\addto\captionsngerman{
\renewcommand{\figurename}{Abb.}%
\renewcommand{\tablename}{Tab.}%
}


%zum Einbinden von Originaltext unter Nutzung von LATEX-Befehlen
\RequirePackage{alltt}

% fürs Highlighting
\RequirePackage{soul}


%um bestimmte Boxenumrandungen zu erzeugen, z.B. mit Schatten oder abgerundeten Ecken
\RequirePackage{fancybox}

%fuer mehr Moeglichkeiten bei mathematischen Formeln
\RequirePackage{amsmath}

% Zusatzpaket für Tabellenmanipulation
\RequirePackage{multirow}

%Tabellen über mehrere Seiten
\RequirePackage{longtable}

% farbige Tabellen
\RequirePackage{colortbl}

% Zusatzpaket für mehrspaltige Seiten
\RequirePackage{multicol}

% Erweiterungspaket für Stickwortverzeichnis
\RequirePackage{makeidx}

\RequirePackage[style=ieee,backend=biber,sorting=none]{biblatex}

%\makeatletter

% Definition für Literaturverzeichnis
\def\thebibliography#1{\section*{Quellenverzeichnis\@mkboth
		{\footnotesize{Quellenverzeichnis}}{\footnotesize{Quellenverzeichnis}}}
		\list
		{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\usecounter{enumi}}
	\def\newblock{\hskip .11em plus .33em minus .07em}
	\sloppy\clubpenalty4000\widowpenalty4000
	\sfcode`\.=1000\relax}

% Definition für Inhaltsverzeichnis
\def\tableofcontents{%
		\section*{\contentsname%
			\@mkboth{\footnotesize{\contentsname}}{\footnotesize{\contentsname}}}%
		{\parskip=0mm%
		\@starttoc{toc}}%
}

\RequirePackage[printonlyused]{acronym}


\renewcommand{\lstlistlistingname}{Quellcodeverzeichnis} %rename list of listings
\renewcommand{\lstlistingname}{Quellcode} %rename label of listings

% Definition für Abbildungsverzeichnis
	\def\listoffigures{%
		\section*{Abbildungsverzeichnis%
			\@mkboth{\footnotesize{Abbildungsverzeichnis}}{\footnotesize{Abbildungsverzeichnis}}}%
		{\parskip=0mm%
		\@starttoc{lof}}%
		\addcontentsline{toc}{section}{Abbildungsverzeichnis}
	}
% \def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

% Definition für Tabellenverzeichnis
	\def\listoftables{%
		\section*{Tabellenverzeichnis%
			\@mkboth{\footnotesize{Tabellenverzeichnis}}{\footnotesize{Tabellenverzeichnis}}}%
		{\parskip=0mm%
		\@starttoc{lot}}%
	\addcontentsline{toc}{section}{Tabellenverzeichnis}
	}
% \let\l@table\l@figure

%Gruppenkopf
\newcommand*{\heading}[1]{%
	\makebox[0pt][l]{%
		\rule[-3pt]{\linewidth}{0.5pt}}%
	\textsf{\textbf{\normalsize #1}}\hfil\nopagebreak\vspace{4pt}}
% 	\textsf{\textbf{\large #1}}\hfil\nopagebreak\vspace{4pt}}

%zweispaltige theindex-Umgebung
\renewenvironment{theindex}{%
	\@mkboth{\footnotesize{Stichwortverzeichnis}}{\footnotesize{Stichwortverzeichnis}}
	\setlength{\columnseprule}{0.4pt}
	\setlength{\columnsep}{2em}
% 	\null
	\begin{multicols}{2}[\section*{Stichwortverzeichnis}\null]
		\footnotesize
		\parindent\z@
		\parskip\z@ \@plus .3\p@\relax
		\let\item\@idxitem}%
	{\end{multicols}\clearpage}
%\makeatother

% um tabular-Umgebung zu erweitern, z.B. mit \toprule oder \botomrule
\RequirePackage{booktabs}

% für Symbole wie z.B. \textdegree
\RequirePackage{textcomp}

% Kopf- und Fußzeilen anpassen
\RequirePackage{fancyhdr}

% Kopf- und Fusszeilen anpassen
\pagestyle{fancyplain}

\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\plainheadrulewidth}{0.2pt}
\renewcommand{\footrulewidth}{0.2pt}
\renewcommand{\plainfootrulewidth}{0.2pt}
\renewcommand{\headwidth}{\textwidth}

%\makeatletter

\newcommand{\chaptermark}[1]%
             {\markboth{\footnotesize Kapitel \thesection:\ #1}{\footnotesize Kapitel \thesection:\ #1}}
\lhead[\footnotesize \leftmark]{\footnotesize }
\chead[\footnotesize ]{\footnotesize }
\rhead[\footnotesize ]{\footnotesize \leftmark}
\lfoot[\footnotesize \thepage]{\footnotesize \@title}
\cfoot[\footnotesize ]{\footnotesize }
\rfoot[\footnotesize \@title]{\footnotesize \thepage}


% für die Nutzung von \url{}
%\RequirePackage[hyphens]{url}

\RequirePackage[bookmarks,unicode]{hyperref}


%Links im Text mit \href{http://www.test.de/}{test}
\hypersetup
{
 pdfcreator = {LaTeX2e},
 pdftitle = {\@title},
 pdfsubject = {WebRTC},
 pdfauthor = {\@author},
 colorlinks = {true},
 linkcolor = {black},
 anchorcolor = {black},
 citecolor = {black},
 urlcolor = {blue},
 unicode = {true},
 pdfpagemode = {UseOutlines},
%  bookmarks = {true},
 bookmarksopen = {true},
 draft = {false}
}

%\makeatother

% DER Grund warum es LaTeX gibt :P
\RequirePackage{microtype}

% um Stichwortverzeichnis bzw. Index zu erstellen
\RequirePackage{makeidx}

% Zeilenabstand auf einfach stellen
\linespread{1.0}

% Definition Farben
\definecolor{satz_green}{HTML}{BFFCBF}
\definecolor{def_red}{HTML}{FFD2D2}

\renewcommand{\arraystretch}{1.2}

\newcommand{\abs}[1]{\lvert#1\rvert}
\newcolumntype{g}{>{\columncolor[gray]{0.9}}l}

\newcommand{\coloredtitlebox}[3]{
	\par\vspace{-\parskip}\vspace{5mm}\noindent\ignorespaces%
	\textbf{\sffamily #1}\par\nopagebreak\hspace{0.03\textwidth}%
	\fcolorbox{black}{#2}{%
		\hspace{5pt}%
		\parbox{0.9\textwidth}{\vspace{5pt}#3\vspace{5pt}}%
		\hspace{5pt}%
	}%
	\vspace{-\parskip}\nopagebreak\vspace{6mm}\nopagebreak\noindent\ignorespacesafterend
}

\newcommand{\centerinbox}[1]{\par\vspace{10pt}\centerline{#1}}

\newcounter{examplecounter}[section]
\newenvironment{example}{%
	\refstepcounter{examplecounter}\noindent\ignorespaces%
	\textbf{Beispiel \thesection.\theexamplecounter:}%
	\nopagebreak\par\nopagebreak\list{}{\rightmargin0pt\leftmargin20pt}\item\relax%
}{\endlist}

\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}

\lstset{
basicstyle=\ttfamily,
captionpos=b,
numbers=left,
numberstyle=\color{black}\footnotesize,
numbersep=7.5pt,
rulesep=-26pt,
frame=tbr,
showstringspaces=false,
breaklines=true,
xleftmargin=10mm,
framexleftmargin=10mm,
frameshape={yyy}{yy}{y}{yyy},
rulesepcolor=\color{lightgray}
}
\lstdefinelanguage{JSON}{
	basicstyle=\color{black}\bfseries,
	keywords={cmd, status, attributes},
	keywordstyle=\color{blue}\bfseries,
	ndkeywords={sessions,sessionId, sessionName, addressUri, currentTime, contentStatus, info, videoformat, quality, newQuality, user, pubID, pass, realm, pcscf, wsuri},
	ndkeywordstyle=\color{cyan}\bfseries,
	stringstyle=\color{black}\ttfamily,
	morestring=[b]',
	morestring=[b]"
}

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}


\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={class, export, boolean, throw, implements, import, this},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{cyan}\ttfamily,
  morestring=[b]',
  morestring=[b]"
}

\lstdefinelanguage{bash}
  {keywords={for, if, else, then, fi, echo, case, in,
      elif, esac, for, do, done, tar, while, until, shift,
      mv, mkdir, ;;, \$\#, \$1, \$2},
   string=[d]{"},
  % comment={\#},
   sensitive=false,
   basicstyle=\ttfamily
	}

\lstdefinestyle{csharp}{language=[Sharp]C}

% muss AKTIV sein für Anhang!
\RequirePackage{pdfpages}

\RequirePackage{xparse}

\newcommand{\institute}[1]{\gdef\@institute{#1}}

\NewDocumentCommand{\authors}{mG{}G{}G{}G{}}{\def\@authorA{#1}\def\@authorB{#2}\def\@authorC{#3}\def\@authorD{#4}\def\@authorE{#5}}

\NewDocumentCommand{\contactperson}{mG{}}{\def\@contactpersonA{#1}}

\newcommand{\handindate}[1]{\gdef\@handindate{#1}}

%define title page layout
\renewcommand{\maketitle}{

\thispagestyle{empty}
\pagenumbering{roman}

\begin{titlepage}
	\begin{center}
		\Large
		Hochschule für Telekommunikation Leipzig (HfTL)\\
		\bigskip
		\large
		\@institute
	\end{center}
	
	\vfill
	
	\begin{center}
		\Large
		\textbf{Laborprotokol Netzwerktechnik}\\
		\bigskip
		\textbf{Labor \\Informations- und Kommunikationstechnik}\par
	\end{center}
	
	\vfill
	
	\begin{table}[htb]
		%\renewcommand{\arraystretch}{1.5}
		\begin{tabular}{lp{11cm}}
			Thema: & \Large \@title \\
			&\\
			&\\
			Vorgelegt am: & \large \@handindate\\
			&\\
			Vorgelegt von: & \large \@authorA \\[4pt]
			&\large \@authorB\\[4pt]
			&\large \@authorC\\%[4pt]
%			&\large \@authorD\\[4pt]
%			&\large \@authorE\\
			Kontakt: & \@contactpersonA\\
			
		\end{tabular}
	\end{table}
	\vfill
	
\end{titlepage}
	
}

% set indentation
\setlength{\parskip}{1em}
\setlength{\parindent}{0em}
