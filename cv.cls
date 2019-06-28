\ProvidesClass{cv}[2019/06/28 v0.1.0 Curriculum Vitae class by Markus Pawellek (markuspawellek@gmail.com)]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{extsizes}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[top=25mm,bottom=25mm,left=25mm,right=25mm]{geometry}
\RequirePackage[ngerman]{babel}
% \RequirePackage{hyphenat}
\RequirePackage{bookman}
% \RequirePackage{times}
\RequirePackage{fontawesome}
\RequirePackage{multicol}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}
% \RequirePackage[dvipsnames]{xcolor}
\RequirePackage{enumitem}

\definecolor{cvColor}{rgb}{0.25, 0.25, 0.5}
\definecolor{cvBackgroundColor}{rgb}{0.95, 0.95, 0.99}
\definecolor{cvFooterColor}{rgb}{0.4, 0.4, 0.4}
\definecolor{cvContentColor}{rgb}{0.3, 0.3, 0.3}
\definecolor{cvSubsectionColor}{rgb}{0.15, 0.15, 0.15}

\newcommand{\cvCV}{Curriculum~Vitae}
\newcommand{\cvName}{\cvFirstName~\cvLastName}
\newcommand{\cvFooterStyle}{%
  \normalfont%
  \sffamily%
  \bfseries%
  \color{cvFooterColor}%
  \footnotesize%
  \scshape%
}
\newcommand{\cvFooterSeparator}{\quad $\cdot$ \quad}
\newcommand{\cvHeadCVStyle}{%
  \normalfont%
  \footnotesize%
  \itshape%
  \color{cvColor}%
}
\newcommand{\cvHeadCVRule}{%
  \parbox{0.3\linewidth}{\rule{\linewidth}{0.5pt}}%
}
\newcommand{\cvHeadNameBaseStyle}{%
  \normalfont%
  \sffamily%
  \Huge%
}
\newcommand{\cvHeadLastNameStyle}{%
  \color{cvColor}%
  \bfseries%
}
\newcommand{\cvHeadAddressStyle}{%
  \normalfont%
  \small%
  \sffamily%
  % \color{cvContentColor}
}
\newcommand{\cvHeadContactStyle}{%
  \normalfont%
  \small%
  \sffamily%
}
\newcommand{\cvHeadBirthStyle}{%
  \normalfont%
  \small%
  \sffamily%
  \color{cvContentColor}%
  \itshape%
  % \scshape%
  % \bfseries%
}
\newcommand{\cvSectionStyle}{%
  \normalfont%
  \Large%
  \color{cvColor}%
  \bfseries%
  \sffamily%
}
\newcommand{\cvSubsectionStyle}{%
  \normalfont%
  \sffamily%
  \itshape%
  \bfseries%
  \color{cvSubsectionColor}%
}
\newcommand{\cvTimeStyle}{%
  \normalfont%
  \sffamily%
  \footnotesize%
  \itshape%
}

\fancypagestyle{cvPagestyle}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[L]{%
    \bigskip%
    \cvFooterStyle%
    \today
  }
  \fancyfoot[R]{%
    \bigskip%
    \cvFooterStyle%
    \cvName%
    \cvFooterSeparator%
    \cvCV%
  }
}

\newcommand{\cvQuote}[1]{\guillemotright{}#1\guillemotleft}

\newcommand{\cvHead}{
  \begin{minipage}[c]{0.7\linewidth}
    \begin{center}
      {%
        \cvHeadNameBaseStyle%
        \cvFirstName~\cvHeadLastNameStyle\cvLastName%
      } \\[0.2em]
      {%
        \cvHeadCVStyle%
        \cvHeadCVRule~~\cvCV~~\cvHeadCVRule%
      } \\[1em]
      \begin{minipage}[c]{0.46\linewidth}
        \raggedleft%
        \cvHeadAddressStyle%
        \cvAddress%
      \end{minipage}
      \hfill%
      \vrule%
      \hfill%
      \begin{minipage}[c]{0.46\linewidth}
        \newcommand{\iconBox}[1]{\parbox{1.5em}{\centering ##1}}%
        \cvHeadContactStyle%
        \iconBox{\faMobile} \cvMobile \\
        \iconBox{\faEnvelopeO} \cvMail \\
        \iconBox{\faGithub} \cvGitHub
      \end{minipage}\\[2.5em]
      {%
        \cvHeadBirthStyle%
        Geboren am \cvBirthday{} in \cvBirthplace%
      }%
    \end{center}
  \end{minipage}
  \hfill%
  \begin{minipage}[c]{0.28\linewidth}
    \begin{tikzpicture}
      \node[circle,draw=black,line width=1pt, inner sep=0.25\linewidth, fill overzoom image=\cvPhoto] () {};
    \end{tikzpicture}
  \end{minipage}
  \par
  \bigskip%
}

\newcommand{\cvSection}[1]{%
  \smallskip%
  {%
    \cvSectionStyle #1%
  }\\[-0.5em]
  \rule{\linewidth}{0.8pt}%
  \par%
  \smallskip%
}

\newcommand{\cvSubsection}[1]{%
  \begin{tcolorbox}[left=0pt, top=0pt, bottom=0pt, right=0pt, boxsep=5pt, arc=5pt, frame code={}, colback=cvBackgroundColor]
    \cvSubsectionStyle #1%
  \end{tcolorbox}
}

\newenvironment{cvItemize}{%
  \begin{itemize}[itemsep=0mm, leftmargin=4mm]
}{%
  \end{itemize}
}

\newenvironment{cvTimeItem}[2]{
  \par
  \begin{minipage}[c]{0.15\linewidth}
    \raggedleft
    \cvTimeStyle #1
  \end{minipage}
  \quad
  \vrule
  \quad
  \begin{minipage}[t]{0.79\linewidth}
    \sffamily\textsc{\color{cvColor} \textbf{#2}}\par
    \normalfont\footnotesize\sffamily\color{cvContentColor}
}{
  \end{minipage}
  \par%
  \vspace{\baselineskip}%
}

\newenvironment{cvSkillItem}[2]{
  \par
  \begin{minipage}[c]{0.2\linewidth}
    \raggedleft
    \normalfont
    \sffamily
    % \small
    \itshape
    #1
  \end{minipage}
  \hspace{0.02\linewidth}
  \vrule
  \hspace{0.02\linewidth}
  \begin{minipage}[t]{0.74\linewidth}
    \sffamily\textsc{\color{cvColor} \textbf{#2}}\par
    \normalfont\footnotesize\sffamily\color{cvContentColor}
}{
  \end{minipage}
  \par%
  \vspace{\baselineskip}%
}

\linespread{1.2}
\pagestyle{cvPagestyle}
\setlength{\parindent}{0mm}

\endinput