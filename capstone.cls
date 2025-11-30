\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{capstone}[2025/11/29 Capstone cover-to-TOC class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[12pt,a4paper]{report}

\RequirePackage[a4paper,margin=1in]{geometry}
\RequirePackage{setspace}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{etoolbox} % for \gappto
\onehalfspacing

% Default info commands (override in main.tex)
\newcommand{\Department}{Department of Electrical and Computer Engineering}
\newcommand{\University}{North South University}
\newcommand{\ProjectType}{Senior Design Project}

\newcommand{\AdvisorName}{Dr.\ X}
\newcommand{\AdvisorTitle}{Assistant Professor}
\newcommand{\ChairName}{Dr.\ Y}
\newcommand{\ChairTitle}{Professor}

\newcommand{\Semester}{Spring}
\newcommand{\Year}{2023}

% Project title
\newcommand{\ProjectTitle}{YOUR PROJECT TITLE}

% Logo file base name (logo.png by default)
\newcommand{\Logofile}{logo}

% Student list machinery (no @ macros)
\newcounter{capstoneStudents}
\newcommand{\CapstoneStudentTable}{} % rows for the cover table
\newcommand{\CapstoneStudentText}{}  % inline "Name (ID), Name (ID), ..."
\newcommand{\CapstoneStudentDecl}{}  % numbered lines in DECLARATION

% Add one student: \CapstoneStudent{Name}{ID}
\newcommand{\CapstoneStudent}[2]{%
  % rows for the cover table
  \gappto{\CapstoneStudentTable}{#1 & #2\\}%
  % inline text list with commas
  \ifnum\value{capstoneStudents}=0
    \gdef\CapstoneStudentText{#1\ (#2)}%
  \else
    \gappto{\CapstoneStudentText}{, #1\ (#2)}%
  \fi
  % numbered lines in DECLARATION
  \stepcounter{capstoneStudents}%
  \gappto{\CapstoneStudentDecl}{%
    \noindent \thecapstoneStudents.\ #1

    \vspace{1.5cm}

    \noindent\rule{10cm}{0.4pt}

    \vspace{1cm}
  }%
}

% Abstract text (can be set in main.tex with \abstract{...})
\newcommand{\CapstoneAbstractText}{%
Write your abstract here. The abstract should briefly introduce the topic,
describe the current status, outline the methods followed, present key
results and mention the impact or significance of the work. Do not include
references, symbols or equations in the abstract.%
}

% User interface to set the abstract from main.tex
\newcommand{\setabstract}[1]{%
  \renewcommand{\CapstoneAbstractText}{#1}%
}


% Macro that prints cover to TOC
\newcommand{\makecapstonefront}{%
  % TITLE PAGE
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{center}
      \includegraphics[width=3cm]{\Logofile}\par
      \vspace*{1cm}
      {\Large \Department\\[0.5em]
      \University\par}

      \vspace{1cm}
      {\Large \ProjectType\par}

      \vspace{1.5cm}
      {\LARGE \bfseries \ProjectTitle\par}

      \vspace{1.5cm}

      \begin{tabular}{@{}l@{\hspace{1cm}}l@{}}
        \CapstoneStudentTable
      \end{tabular}

      \vfill

      {\bfseries Faculty Advisor:}\\[0.5em]
      \AdvisorName\\
      \AdvisorTitle\\
      ECE Department

      \vspace{1.5cm}
      {\Semester, \Year\par}
    \end{center}
  \end{titlepage}

  \clearpage
  \pagenumbering{roman}

  % APPROVAL
  \section*{APPROVAL}
  \addcontentsline{toc}{section}{APPROVAL}

  \noindent
  The following students from the Department of Electrical and Computer
  Engineering, \University{}, have worked on the Senior Design Project
  titled ``\ProjectTitle'' under the supervision of \AdvisorName{} in
  partial fulfillment of the requirement for the degree of Bachelor of
  Science in Engineering and the work has been accepted as satisfactory:

  \medskip
  \noindent \CapstoneStudentText.

  \vspace{2cm}

  \noindent Supervisor's Signature

  \vspace{2.5cm}

  \noindent\rule{7cm}{0.4pt}\\
  \AdvisorName\\
  \AdvisorTitle\\
  Department of Electrical and Computer Engineering\\
  \University\\
  Dhaka, Bangladesh.

  \vspace{2cm}

  \noindent Chairman's Signature

  \vspace{2.5cm}

  \noindent\rule{7cm}{0.4pt}\\
  \ChairName\\
  \ChairTitle\\
  Department of Electrical and Computer Engineering\\
  \University\\
  Dhaka, Bangladesh.

  \clearpage

  % DECLARATION
  \section*{DECLARATION}
  \addcontentsline{toc}{section}{DECLARATION}

  \noindent
  This is to declare that this project is our original work. No part of this
  work has been submitted elsewhere partially or fully for the award of any
  other degree or diploma. All project related information will remain
  confidential and shall not be disclosed without the formal consent of the
  project supervisor. Relevant previous works presented in this report have
  been properly acknowledged and cited. The plagiarism policy, as stated by
  the supervisor, has been maintained.

  \vspace{1.5cm}

  \noindent Students names and signatures

  \vspace{1cm}

  \CapstoneStudentDecl

  \clearpage

  % ACKNOWLEDGEMENTS
  \section*{ACKNOWLEDGEMENTS}
  \addcontentsline{toc}{section}{ACKNOWLEDGEMENTS}

  The authors would like to express their heartfelt gratitude towards their
  project and research supervisor, \AdvisorName{}, \AdvisorTitle{},
  Department of Electrical and Computer Engineering, \University{}, for his
  invaluable support, precise guidance and advice pertaining to the
  experiments, research and theoretical studies carried out during the
  course of the current project and also in the preparation of the current
  report.

  Furthermore, the authors would like to thank the Department of Electrical
  and Computer Engineering, \University{} for facilitating the research.
  The authors would also like to thank their friends and loved ones for
  their countless sacrifices and continual support.

  \clearpage

    \section*{ABSTRACT}
    \addcontentsline{toc}{section}{ABSTRACT}
    
    \noindent
    \CapstoneAbstractText

  \clearpage

  % TABLE OF CONTENTS
  \tableofcontents
  \clearpage
  \pagenumbering{arabic}
}
