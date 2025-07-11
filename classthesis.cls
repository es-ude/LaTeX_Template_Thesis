%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Title:   LaTeX Class for Building Thesis Document
%% Version: 1.5
%% Stand:   29.04.2025
%% Author:  Andreas Erbslöh
%% Company: UDE-IES
%% Input:   #1: language (DE, EN) 
%%          #2: twoside (false, true)
%%          #3: thesis type (bachelor, master, phd, project)
%%          #4: showTutorial (true, false)
%%.         #5: Offset on inner print site (default: 10mm, use: 8-14 mm)
%%          #6: Watermark text: string
%%          #7: Watermark Scaling value: float
%% Compile: LaTeX, 2023
%% ToDo:    - XeTex verwenden, Neue Funktion für psfrag finden (pstool for pdfLaTeX)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classthesis}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=classthesis,
	prefix=classthesis@
}
%% Set default values of global options
\DeclareStringOption[11pt]{fontsize}
\DeclareStringOption[DE]{language}
\DeclareStringOption[bachelor]{type}
\DeclareStringOption[false]{showTutorial}
\DeclareStringOption[10mm]{offset}
\DeclareStringOption[false]{twoside}
\DeclareStringOption[]{watermarkText}
\DeclareStringOption[2.0]{watermarkScale}
\ProcessKeyvalOptions*

% --- Input parameters for this Document
\newcommand{\AuthorNameOne}{Max Mustermann}
\newcommand{\AuthorMatrNoOne}{3000000}
\newcommand{\AuthorNameTwo}{\empty}
\newcommand{\AuthorMatrNoTwo}{\empty}
\newcommand{\AuthorNameThree}{\empty}
\newcommand{\AuthorMatrNoThree}{\empty}
\newcommand{\AuthorNameFour}{\empty}
\newcommand{\AuthorMatrNoFour}{\empty}
\newcommand{\AuthorNameFive}{\empty}
\newcommand{\AuthorMatrNoFive}{\empty}
\newcommand{\AuthorNameSix}{\empty}
\newcommand{\AuthorMatrNoSix}{\empty}
\newcommand{\AuthorNameSeven}{\empty}
\newcommand{\AuthorMatrNoSeven}{\empty}
\newcommand{\AuthorNameEight}{\empty}
\newcommand{\AuthorMatrNoEight}{\empty}
\newcommand{\AuthorNameNine}{\empty}
\newcommand{\AuthorMatrNoNine}{\empty}
\newcommand{\AuthorNameTen}{\empty}
\newcommand{\AuthorMatrNoTen}{\empty}

\newcommand{\ThesisTitle}{Beispiel zum Schreiben einer Abschlussarbeit in \LaTeX}
\newcommand{\ThesisLocation}{Duisburg}
\newcommand{\DateSubmission}{\today}
\newcommand{\ThesisSupervisor}{Max Mustermann}
\newcommand{\ThesisExaminerOne}{Prof. Dr. Barbara Mustermann}
\newcommand{\ThesisExaminerTwo}{Prof. Dr. Albert Einstein}

\newcommand{\InfoUniversity}{Universität Duisburg-Essen}
\newcommand{\InfoFaculty}{Informatik}
\newcommand{\InfoDepartment}{Allgemeine Informatik}
\newcommand{\InfoOrganisation}{Fachgebiet}
\newcommand{\InfoInstitution}{Intelligente Eingebettete Systeme}
\newcommand{\PathCompanyLogo}{logo_ude.eps}
\newcommand{\PathCompanyLogoHeight}{20mm}
\newcommand{\PathGroupLogo}{\empty}
\newcommand{\PathGroupLogoHeight}{20mm}

\newcommand{\AuthorStudy}{Fancy-Design}
\newcommand{\AuthorPlaceOfBirth}{Musterstadt}
\newcommand{\DateOralExam}{\today}
\newcommand{\DoctorType}{Naturwissenschaften}
\newcommand{\ThesisAccepted}{false}	
\newcommand{\DateListAITools}{09.12.2024}

% --- Start processing
\ProcessOptions\relax
\LoadClass[
    a4paper,                         % Papierformat
    \classthesis@fontsize,	         % Schriftgröße
    twoside=\classthesis@twoside,	 % Layout definieren (ein- oder zweiseitig)
    open=right,				         % Kapitel können auf linken/rechten Seiten beginnen
    chapterprefix,			% Zusatz von Kapitel beim Text einfügen
    index=totoc,			% Index ins Inhaltsverzeichnis
    listof=totoc,			% Abb.- und Tab.-Verzeichnisse ins Inhaltsverzeichnis
    bibliography=totoc		% Literaturverzeichnis ins Inhaltsverzeichnis
]{scrbook}

% --- Loading Packages
\RequirePackage{blindtext}
\RequirePackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Declaration of Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
\ifthenelse{\equal{\classthesis@type}{project}}{
    \newcommand{\ThesisType}{Projekt}
}{\empty}
\ifthenelse{\equal{\classthesis@type}{bachelor}}{
    \newcommand{\ThesisType}{Bachelor}
}{\empty}
\ifthenelse{\equal{\classthesis@type}{master}}{
    \newcommand{\ThesisType}{Master}
}{\empty}
\ifthenelse{\equal{\classthesis@type}{phd}}{
    \newcommand{\ThesisType}{Dissertation}
}{\empty}
}

\AtEndDocument{
\ifthenelse{\equal{\classthesis@showTutorial}{true}}{
    \include{body/0tutorial}
}{\empty}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Layout incl. Head- und Footline	                           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{lscape}
\RequirePackage{geometry}
\geometry{centering,
    paper=a4paper, 
    width=160mm,
    height=250mm,
    headheight=12mm,
    includefoot=false, 
    includehead=false,
    layoutvoffset=6mm,
    bindingoffset={\classthesis@offset}
}
% Aussehen der Kopfzeile und Fußzeile
\RequirePackage[headsepline=1pt]{scrlayer-scrpage}
\RequirePackage{scrhack}
\renewcommand{\chaptermark}[1]{\markboth{#1}{\empty}}
\clearpairofpagestyles
\renewcommand{\chaptermark}[1]{\markboth{ \thechapter\ #1}{\empty}}  
\renewcommand{\sectionmark}[1]{\markright{ \thesection\ #1}{\empty}} 
\renewcommand{\chapterpagestyle}{empty}	        % Bei Kapitelanfängen keine Seitenzahl   
\setkomafont{pagenumber}{\normalfont\bfseries}  % Seitenzahl in fett

 % --- Wasserzeichensetzen
\RequirePackage[firstpage]{draftwatermark}
\SetWatermarkText{\textsc{\classthesis@watermarkText}}
\SetWatermarkScale{\classthesis@watermarkScale}
\SetWatermarkAngle{55}
\SetWatermarkLightness{0.85}

% --- Header-Gestaltung
\ifthenelse{\equal{\classthesis@twoside}{false}}{
    \newcommand{\SetHeader}{\leftmark}  
}{
    \newcommand{\SetHeader}{\headmark}
}

\ihead[]{\textsc{\SetHeader}} 		            % Header: Innen
\chead[]{\empty}                                      % Header: Mittig
\ohead[]{\pagemark} 							% Header: Außen
\ifoot[]{\empty}
\cfoot[]{\empty}
\ofoot[]{\empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Language
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\equal{\classthesis@language}{DE}}{
    \RequirePackage[ngerman]{babel}
    \RequirePackage{icomma}
    \newcommand{\SetBabel}{ngerman}
    \newcommand{\LangTask}{Aufgabenstellung}
    \newcommand{\LangAbstract}{Kurz-Zusammenfassung}
    \newcommand{\LangACRO}{Abkürzungsverzeichnis}
    \newcommand{\LangAppendix}{Anhang} 
    \newcommand{\LangThanks}{Danksagung}
    \newcommand{\LangChapName}{Kapitel}
}{\empty}
\ifthenelse{\equal{\classthesis@language}{EN}}{
    \RequirePackage[english]{babel}
    \newcommand{\LangTask}{Task description}
    \newcommand{\LangAbstract}{Abstract}
    \newcommand{\LangACRO}{List of abbreviations}
    \newcommand{\LangAppendix}{Appendix}
    \newcommand{\LangThanks}{Special Thanks}
    \newcommand{\LangChapName}{Chapter}
}{\empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Font style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}	                % bessere Silbentrennung
\RequirePackage[printonlyused]{acronym}         % Akronyme einfügen
\RequirePackage{textcomp}
\RequirePackage[
    pdfborder={0 0 0}, 
    linktocpage={true}
]{hyperref} 	      
% Lesezeichen im PDF setzen
\RequirePackage{setspace}	                    % Paket für Textabstände
\setlength{\parskip}{0.8em}                     % Abstand zwischen Absätzen
\setlength{\parindent}{0pt}                     % Vermeiden von Einrückungen nach neuem Absatz

\RequirePackage{chngcntr}						% Abschnittsweise Nummerierung
\counterwithin{figure}{chapter}					% der Abbildungen
\counterwithin{equation}{chapter}				% der Formeln
\counterwithin{table}{chapter}					% der Tabellen

%Vermeidung von Hurenkind und Schusterjunge
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Embedding of code segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{listings}			% Einbetten von Quellcode
\lstset{ 
  basicstyle=\small,                % text size
  captionpos=b,                     % sets the caption-position to bottom
  commentstyle=\color{green},       % comment style
  extendedchars=true,               
  firstnumber=1,                    % start line enumeration with line 1000
  keepspaces=true,                  % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{blue},       % keyword style
  language=Octave,                 % the language of the code
  morekeywords={*,...},            % if you want to add more keywords to the set
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=10pt,                  % how far the line-numbers are from the code
  numberstyle=\tiny\color{gray}, % the style that is used for the line-numbers
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stringstyle=\color{mymauve},      % string literal style
  tabsize=5	                       % sets default tabsize to 2 spaces
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Konfiguration der Aufzählungen und Verlinkungen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}			% Auflistungspacket
\RequirePackage{float}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Zeichnen von Abbildungen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}				% State Diagrams
%\RequirePackage{tikz-uml}			% State Diagrams
\RequirePackage{tikz-timing}		% Timing Diagramme
\RequirePackage[european, strokediode, lazymos]{circuitikz} % Elek. Schaltungen

% --- Definitions for Tikz picture generation
\tikzset{
    singlestate/.style={draw,fill=white!20, rounded corners},
    teststate/.style={draw, dashed, fill=white!20, rounded corners, inner sep = 0.5cm},
    annot/.style={text width=4em, text centered, node distance=1.5cm},  
    neuron/.style={circle, fill=black!25, minimum size=40, inner sep=0, draw},
    input neuron/.style={neuron, fill=green!40, pin={[pin edge={<-}]left: }},
    hidden neuron/.style={neuron, fill=blue!40},
    output neuron/.style={neuron, fill=red!40, pin={[pin edge={->}]right: }}
}

\usetikzlibrary{calc, arrows.meta, intersections, patterns, positioning, shapes.misc, fadings, through,decorations.pathreplacing}
\definecolor{MidnightBlue}{HTML}{006795}
\definecolor{RedOrange}{HTML}{F26035}
\definecolor{Plum}{HTML}{92268F}
\definecolor{Dandelion}{HTML}{00CD00}


% --- Definition of Plot Generation
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18,
    plot_graphs/.style={ 
        grid=both,
        xlabel={$x$},       xtick align=outside,
        ylabel={$f(x)$},    ytick align=outside,
        %axis x line=left, axis y line=left,
    },
    plot_scatter/.style={
        % --- Settings for Cluster results
        scatter/classes={a={fill=red}, b={fill=blue}, c={fill=black},
        n={fill=red}, y={fill=blue}},
        enlargelimits=false,
        % --- Figure Definitions
        grid=both,
        minor grid style={very thin, lightgray!25}, 
        minor tick num = 4, 
        major grid style={thin},
        xticklabel style={rotate=90}, xlabel near ticks,
        ytick align=outside, xtick align=outside
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Konfiguration der Abbbildungen und Tabellen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx} 
\RequirePackage[position=bottom, font=normal, 
    justification=raggedright, singlelinecheck=false, 
    farskip=2pt, captionskip=-6pt
]{subfig}

\RequirePackage{xcolor}
\RequirePackage{psfrag}
\RequirePackage{caption}
\RequirePackage{pdfpages}
\RequirePackage{colortbl}

\setlength\belowcaptionskip{0pt}
\setlength{\intextsep}{3.0pt plus 0.5pt minus 0.5pt}
\setlength{\textfloatsep}{3.0pt plus 0.5pt minus 0.5pt}

\RequirePackage{tabularx, longtable}
\RequirePackage{multirow, multicol}

% Ändern der Kürzel von Tabellen und Abbildung
\ifthenelse{\equal{\classthesis@language}{DE}}{
\addto\captionsngerman{
	\renewcommand{\figurename}{Abb.}		
	\renewcommand{\tablename}{Tab.}	
}
}{\empty}
\ifthenelse{\equal{\classthesis@language}{EN}}{
\addto\captionsngerman{
	\renewcommand{\figurename}{Fig.}		
	\renewcommand{\tablename}{Tab.}	
}
}{\empty}

% Angabe des Pfades
\graphicspath{{./figures/}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Konfiguration der Formeln
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath, amssymb}			% Mathemodus
\RequirePackage[version=4]{mhchem}          % Chemische Symbole
\RequirePackage{cancel}                     % Draw lines and arrows in math mode
\RequirePackage{siunitx}
\sisetup{per-mode = symbol, locale = DE,
  group-separator=.,
  % <- ergänzt, default ist \, (also ein kleiner Abstand)
  group-minimum-digits=4
  % <- ergänzt, default ist 5 (also Gruppierung erst ab 5 Ziffern)
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Konfiguration der Zitiersystemes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{csquotes}
\RequirePackage[backend=biber,
    natbib,
    bibstyle=ieee,
    citestyle=numeric-comp, 
    maxbibnames=3, 
    giveninits=true]{biblatex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Content of different Erklärungen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\declareEidesStatt}{
    \chapter*{Eidesstattliche Erklärung}
    Hiermit versichere ich, dass ich diese Arbeit bzw. im Fall einer Gruppenarbeit den von mir entsprechend gekennzeichneten Anteil an der Arbeit selbständig verfasst habe. Ich habe keine unzulässige Hilfe Dritter in Anspruch genommen. Zudem habe ich keine anderen als die angegebenen Quellen und Hilfsmittel benutzt und alle Ausführungen (insbesondere Zitate), die anderen Quellen wörtlich oder sinngemäß entnommen wurden, kenntlich gemacht. Die Liste zugelassener Hilfsmittel vom \DateListAITools~ist mir ausdrücklich bekannt. 
    
    Ich versichere, dass die von mir in elektronischer Form eingereichte Version dieser Arbeit mit den eingereichten gedruckten Exemplaren übereinstimmt.
    
    Mir ist bekannt, dass im Falle eines Täuschungsversuches die betreffende Leistung als mit “nicht ausreichend” (5,0) bewertet gilt. Zudem kann ein Täuschungsversuch als Ordnungswidrigkeit mit einer Geldbuße von bis zu 50.000 Euro geahndet werden. Im Falle eines mehrfachen oder sonstigen schwerwiegenden Täuschungsversuchs kann ich zudem exmatrikuliert werden.
    
    Mir ist bekannt, dass sich die Prüferin oder der Prüfer bzw. der Prüfungsausschuss zur Feststellung der Täuschung des Einsatzes einer entsprechenden Software oder sonstiger elektronischer Hilfsmittel bedienen kann.

    Ich versichere an Eides Statt, dass ich die vorbenannten Angaben nach bestem Wissen und Gewissen gemacht habe und dass die Angaben der Wahrheit entsprechen und ich nichts verschwiegen habe. Die Strafbarkeit einer falschen eidesstattlichen Versicherung ist mir bekannt, insbesondere die Strafandrohung gemäß §§ 156, 161 StGB, auf welche ich konkret hingewiesen wurde.

    \fbox{\begin{minipage}{\textwidth}
    \textbf{§ 156 Falsche Versicherung an Eides Statt}

    Wer vor einer zur Abnahme einer Versicherung an Eides Statt zuständigen Behörde eine solche Versicherung falsch abgibt oder unter Berufung auf eine solche Versicherung falsch aussagt, wird mit Freiheitsstrafe bis zu drei Jahren oder mit Geldstrafe bestraft.
    \vspace{0.5cm}
    
    \textbf{§ 161 Fahrlässiger Falscheid}
    
    Fahrlässige falsche Versicherung an Eides Statt liegen bspw. bei den folgenden Punkte vor.
    
    (1) Wenn eine der in den §§ 154 bis 156 bezeichneten Handlungen aus Fahrlässigkeit begangen worden ist, so tritt Freiheitsstrafe bis zu einem Jahr oder Geldstrafe ein.
    
    (2) Straflosigkeit tritt ein, wenn der Täter die falsche Angabe rechtzeitig berichtigt. Die Vorschriften des § 158 Abs. 2 und 3 gelten entsprechend.
    \end{minipage}}
    %%%%
    \generateSignTable
}

\newcommand{\declareEigenstaendig}{
    \chapter*{Eigenständigkeits-Erklärung}
    Hiermit versichere ich, dass ich diese Arbeit bzw. im Fall einer Gruppenarbeit den von mir entsprechend gekennzeichneten Anteil an der Arbeit selbständig verfasst habe. Ich habe keine unzulässige Hilfe Dritter in Anspruch genommen. Zudem habe ich keine anderen als die angegebenen Quellen und Hilfsmittel benutzt und alle Ausführungen (insbesondere Zitate), die anderen Quellen wörtlich oder sinngemäß entnommen wurden, kenntlich gemacht. Die Liste zugelassener Hilfsmittel vom \DateListAITools~ist mir ausdrücklich bekannt. Ich versichere, dass die von mir in elektronischer Form eingereichte Version dieser Arbeit mit den eingereichten gedruckten Exemplaren übereinstimmt.

    Mir ist bekannt, dass sich die Prüferin oder der Prüfer bzw. der Prüfungsausschuss zur Feststellung der Täuschung des Einsatzes einer entsprechenden Software oder sonstiger elektronischer Hilfsmittel bedienen kann.
    %%%%
    \generateSignTable
}

\newcommand{\generateSignTable}{
    \vspace{0.8cm}
    \begin{flushleft}
        {\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameOne}
        {\ifthenelse{\equal{\AuthorNameTwo}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameTwo}}}
        {\ifthenelse{\equal{\AuthorNameThree}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameThree}}}
        {\ifthenelse{\equal{\AuthorNameFour}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameFour}}}
        {\ifthenelse{\equal{\AuthorNameFive}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameFive}}}
        {\ifthenelse{\equal{\AuthorNameSix}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameSix}}}
        {\ifthenelse{\equal{\AuthorNameSeven}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameSeven}}}
        {\ifthenelse{\equal{\AuthorNameEight}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameEight}}}
        {\ifthenelse{\equal{\AuthorNameNine}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameNine}}}
        {\ifthenelse{\equal{\AuthorNameTen}{\empty}}{\empty}{
        {\\[1.5cm]\ThesisLocation,\\
        den \the\day.\the\month.\the\year
        \hspace{1cm} \line(1,0){250}\\
        \hspace{3.6cm} \AuthorNameTen}}}
    \end{flushleft}
}
\makeatletter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matter-Anpassungen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\LangDistanceText}{2}
% --- Design of the main chapter sides 
\renewcommand*{\@@makechapterhead}[1]{
    \vspace*{\LangDistanceText\p@}
    {\parindent \z@ \raggedleft \reset@font
        \scshape
        \par\nobreak
        \interlinepenalty\@M
        \ifthenelse{\equal{\LangDistanceText}{10}}{\empty}{\Large \textsc{\LangChapName~\thechapter}\\}
        \Huge \bfseries \textsc{#1} \par\nobreak
        \hrulefill
        \par\nobreak
        \vskip 6\p@
    }    
}
% --- Design of appendix chapter sides
\renewcommand*{\@@makeschapterhead}[1]{
    \vspace*{2\p@}
    {\parindent \z@ \raggedleft \reset@font
        \scshape
        \par\nobreak
        \interlinepenalty\@M
        \Huge \bfseries \scshape{#1} \par\nobreak
        \hrulefill
        \par\nobreak
        \vskip 2\p@
    }
}

% --- Design of the matter
\renewcommand{\frontmatter}{
    \cleardoublepage
    \pagestyle{scrheadings}
    \pagenumbering{roman}
    \singlespacing
    \renewcommand{\LangDistanceText}{2}
}

\renewcommand{\mainmatter}{
    \cleardoublepage
    \pagestyle{scrheadings}
    \pagenumbering{arabic}
    \onehalfspacing
    \renewcommand{\LangDistanceText}{340}
}

\renewcommand{\backmatter}{
    \cleardoublepage
    \pagestyle{scrheadings}
    \singlespacing
    \renewcommand{\LangDistanceText}{10}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Anpassungen am Deckblatt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
\begin{titlepage}
    \pagestyle{empty}
    % --- Inhalt der Titelseite
    % Einfügen der Logos
    \singlespacing
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
	   \ifthenelse{\equal{\PathGroupLogo}{\empty}}{\empty}{\includegraphics[height={\PathGroupLogoHeight}, clip]{\PathGroupLogo}}  
      & \includegraphics[height={\PathCompanyLogoHeight}, clip]{\PathCompanyLogo} 
    \end{tabular*}
	% --- Textkörper
    \ifthenelse{\equal{\ThesisType}{Dissertation}}{
    % --- Textkörper für eine Dissertation
    \begin{center}
        \vspace{2cm}
        \setstretch{2}
        {\huge\textbf{\textsc{\ThesisTitle}}}\\
        \vspace*{\fill}
        \singlespacing
        {\large \ifthenelse{\equal{\ThesisAccepted}{true}}{Von der}{Der} Fakultät für \InfoFaculty,}\\
        \ifthenelse{\equal{\InfoDepartment}{\empty}}{\empty}{\large Abteilung \InfoDepartment,\\}
        {\large der \InfoUniversity}\\
        \vspace*{\fill}
        {\large zur Erlangung des akademischen Grades}\\
        \vspace*{\fill}
        {\large Doktor der\\\DoctorType}\\ 
        \vspace*{\fill}
        {\large \ifthenelse{\equal{\ThesisAccepted}{true}}{genehmigte}{vorgelegten} Dissertation}\\
        {\large von}\\
        \vspace*{\fill}
        {\large \AuthorNameOne}\\
        {\large aus}\\
        {\large \AuthorPlaceOfBirth}
    \end{center}
    \vspace*{\fill}
    % Terminangaben 
    \onehalfspacing
    {\ifthenelse{\equal{\ThesisAccepted}{true}}{
        \begin{tabular}{ll}
            Erst-Gutachter:                 & \ThesisExaminerOne\\
            Zweit-Gutachter:                & \ThesisExaminerTwo\\
            Datum der Einreichung:          & \DateSubmission\\
            Datum der mündlichen Prüfung:   & \DateOralExam
        \end{tabular}
    }{
        \begin{center}
    	   {\large Datum der Einreichung: \DateSubmission}
        \end{center}
    }}}{
     % --- Textkörper für Projekt- und Abschlussarbeiten
    \begin{center}
        \vspace*{\fill}
        \setstretch{2}
        {\Large \ThesisType -Arbeit}\\
        \textsc{\huge{\bfseries{\ThesisTitle}}} \\
        \setstretch{1}
        \vspace*{\fill}
        Bearbeitet am\\
        \ifthenelse{\equal{\InfoOrganisation}{Fachgebiet}}{Fachgebiet }{\empty}\InfoInstitution,\\
        \ifthenelse{\equal{\InfoFaculty}{\empty}}{\empty}{Fakultät für \InfoFaculty,\\}
        \ifthenelse{\equal{\InfoDepartment}{\empty}}{\empty}{Abteilung \InfoDepartment,\\}
        der \InfoUniversity\\
        \vspace*{\fill}
        von\\
        \vspace*{\fill}
        \AuthorNameOne~(Mat.-Nr.:~\AuthorMatrNoOne)\\
        \ifthenelse{\equal{\AuthorNameTwo}{\empty}}{\empty}{\AuthorNameTwo~(Mat.-Nr.:~\AuthorMatrNoTwo)\\}
        \ifthenelse{\equal{\AuthorNameThree}{\empty}}{\empty}{\AuthorNameThree~(Mat.-Nr.:~\AuthorMatrNoThree)\\}
        \ifthenelse{\equal{\AuthorNameFour}{\empty}}{\empty}{\AuthorNameFour~(Mat.-Nr.:~\AuthorMatrNoFour)\\}
        \ifthenelse{\equal{\AuthorNameFive}{\empty}}{\empty}{\AuthorNameFive~(Mat.-Nr.:~\AuthorMatrNoFive)\\}
        \ifthenelse{\equal{\AuthorNameSix}{\empty}}{\empty}{\AuthorNameSix~(Mat.-Nr.:~\AuthorMatrNoSix)\\}
        \ifthenelse{\equal{\AuthorNameSeven}{\empty}}{\empty}{\AuthorNameSeven~(Mat.-Nr.:~\AuthorMatrNoSeven)\\}
        \ifthenelse{\equal{\AuthorNameEight}{\empty}}{\empty}{\AuthorNameEight~(Mat.-Nr.:~\AuthorMatrNoEight)\\}
        \ifthenelse{\equal{\AuthorNameNine}{\empty}}{\empty}{\AuthorNameNine~(Mat.-Nr.:~\AuthorMatrNoNine)\\}
        \ifthenelse{\equal{\AuthorNameTen}{\empty}}{\empty}{\AuthorNameTen~(Mat.-Nr.:~\AuthorMatrNoTen)\\}
    \end{center}
    \vspace*{\fill}
    % --- Zusatzinformationen
    \begin{tabular}{ll} 
        \ifthenelse{\equal{\ThesisSupervisor}{\empty}}{\empty}{Betreuer:        & \ThesisSupervisor\\}
        \ifthenelse{\equal{\ThesisExaminerOne}{\empty}}{\empty}{Erst-Gutachter: & \ThesisExaminerOne\\}
        \ifthenelse{\equal{\ThesisExaminerTwo}{\empty}}{\empty}{Zweit-Gutachter:& \ThesisExaminerTwo\\}
        \ifthenelse{\equal{\AuthorStudy}{\empty}}{\empty}{Studiengang:          & \AuthorStudy \\}
        \ifthenelse{\equal{\DateSubmission}{\empty}}{\empty}{Einreichungsdatum: & \DateSubmission}
    \end{tabular}
    }
    \end{titlepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Anpassungen an Andere
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatother
