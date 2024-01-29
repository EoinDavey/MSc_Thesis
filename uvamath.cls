\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uvamath}[2016/01/12 0.1 Master mathematics LaTeX document class]
\RequirePackage{graphicx}
\RequirePackage{array}

% Default values for translatable constant text
\def\supervisorstext{Supervisor}
\def\dailysupervisorText{Daily supervisor}
\def\titletext{Title}
\def\authortext{Author}
\def\authortextsingular{Author}
\def\authortextplural{Authors}
\def\datetext{Examination date}
\def\secondexaminertext{Second Examiner}

\ProcessOptions

\LoadClassWithOptions{scrreprt}
\setkomafont{disposition}{\bfseries}
%\RequirePackage[a4paper]{geometry}


% Variable text commands
\def\institute#1{\gdef\@institute{#1}}
\def\institutelogo#1{\gdef\@institutelogo{#1}}
\def\instituteaddress#1{\gdef\@instituteaddress{#1}}
\def\program#1{\gdef\@program{#1}}
\def\documentTitle#1{\gdef\@documentTitle{#1}}

\def\supervisors#1{\gdef\@supervisors{#1}}
\def\supervisorsTitle#1{\gdef\@supervisorsTitle{#1}}
\def\dailysupervisor#1{\gdef\@dailysupervisor{#1}}
\def\dailysupervisorTitle#1{\gdef\@dailysupervisorTitle{#1}}

\def\secondexaminer#1{\gdef\@secondexaminer{#1}}

\def\secondinstitute#1{\gdef\@secondinstitute{#1}}
\def\secondlogo#1{\gdef\@secondlogo{#1}}
\def\secondadress#1{\gdef\@secondadress{#1}}

% Default values for variable text
\institute{
Korteweg-de Vries Institute for Mathematics
}
\institutelogo{
\includegraphics[height=1cm]{uvalogo}
}

\instituteaddress{Korteweg-de Vries Institute for Mathematics \\ 
University of Amsterdam\\
Science Park 105-107, 1098 XG Amsterdam\\
\url{http://kdvi.uva.nl}
}

\program{MSc Mathematics}
\documentTitle{Master Thesis}
\supervisors{\relax}
\supervisorsTitle{\relax}
\dailysupervisorTitle{\relax}
\dailysupervisor{\relax}
\secondexaminer{\relax}
\secondinstitute{\relax}
\secondlogo{\relax}
\secondadress{\relax}

% Author command
\newcounter{authors}
\def\@authordetails{}
\def\@authors{}
\renewcommand\author[2][\relax]{
    \ifnum\value{authors}>0\relax
        \addtocounter{authors}{1}
        \xdef\@authors{\@authors, #2}
        \protected@xdef\@authordetails{\@authordetails\protect{\\}\indent #2\if#1\relax\else{, #1}\fi}
    \else
        \addtocounter{authors}{1}
        \gdef\@authors{#2}
        \gdef\@authordetails{#2, #1}
    \fi
}


\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} 

\renewcommand{\maketitle}{
\thispagestyle{empty}

\begin{centering} 
%----------------------------------------------------------------------------------------
%	HEADING SECTIONS
%----------------------------------------------------------------------------------------
\vspace{3cm}
\includegraphics[width=\textwidth]{UvaLogoTekst}\\[1.5cm]
\textsc{\LARGE \@program}\\[0.5cm]
\textsc{\Large \@documentTitle}\\[0.5cm]

%----------------------------------------------------------------------------------------
%	TITLE SECTION
%----------------------------------------------------------------------------------------

\HRule
\vspace{0.5cm}
{ \huge \bfseries \@title }
\vspace{0.5cm}
\HRule

\vspace{2cm}
 
 
\begin{tabular}{p{0.45\textwidth} >{\raggedleft\let\newline\\\hspace{0pt}}p{0.45\textwidth}}
\large\emph{\authortext:} &  \large\emph{\supervisorstext:}  \tabularnewline
{\Large \@authors} & {\Large \@supervisorsTitle} \tabularnewline
& \tabularnewline
\large\emph{\datetext:} & \if\@dailysupervisorTitle\relax \else \large\emph{\dailysupervisorText:} \fi \tabularnewline
{\Large \@date} & \raggedleft {\if\@dailysupervisorTitle\relax \else \Large \@dailysupervisorTitle \fi}
\end{tabular}



\vspace{\stretch{1}}

\if\@secondinstitute\relax
\begin{tabular}{>{\centering\let\newline\\\hspace{0pt}}p{0.4\textwidth}}
\@institute \tabularnewline
\@institutelogo
\end{tabular}
\else
\begin{tabular}{>{\centering\let\newline\\\hspace{0pt}}p{0.4\textwidth} >{\centering\let\newline\\\hspace{0pt}}p{0.4\textwidth}}
\@institute & \@secondinstitute \tabularnewline
\@institutelogo &  \@secondlogo
\end{tabular}
\fi

\vspace{-70pt}

\end{centering}
\newpage
}




\renewenvironment{abstract}{\section*{\abstractname}}{
\vfill
\noindent
\titletext: \@title\\
\ifnum\value{authors} < 2%
\authortextsingular: \@authordetails\\
\else
\authortextplural:\\ \indent\@authordetails\\
\fi
\supervisorstext: \@supervisors \\
\if\@dailysupervisor\relax\else \dailysupervisorText: \@dailysupervisor \\ \fi
\if\@secondexaminer\relax\else \secondexaminertext: \@secondexaminer\\ \fi
\datetext: \@date

\bigskip\noindent
\@instituteaddress
% 
% \if\@secondadress\relax\else \noindent\@secondadress \fi
% \newpage
}
\endinput

