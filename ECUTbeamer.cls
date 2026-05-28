% !TeX program = xelatex
% ----------------------------------------------------------------------
% ECUTbeamer.cls
% @author  ECUT-TUG
% @date    2026/05/28
% @version v0.1.0
% @license MIT License
%
% East China University of Technology Beamer template.
% This template follows the MIT License.
%
% 这里特别感谢周成、胡仕琦以及其他为此模板做出帮助的同学！
% ----------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ECUTbeamer}[2026/05/28 v0.1.0 ECUT Beamer template]

% ----------------------------------------------------------------------
% 01. Class Options
% ----------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[12pt]{beamer}

% ----------------------------------------------------------------------
% 02. Package Requirements
% ----------------------------------------------------------------------
\RequirePackage[orientation=landscape,size=custom,width=16,height=9,scale=0.5]{beamerposter}
\RequirePackage[UTF8,noindent]{ctexcap}
\RequirePackage{unicode-math,amsmath,amssymb,amsthm,mathrsfs}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{xeCJK}
\RequirePackage{calligra}
\RequirePackage{mathptmx}
\RequirePackage{gbt7714}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{mhchem,chemfig,chemarrow}
\RequirePackage{extarrows}
\RequirePackage{listings}

\usetikzlibrary{arrows.meta,positioning,calc,fit}
\pgfplotsset{compat=1.18}
\setlength{\parindent}{2em}

% ----------------------------------------------------------------------
% 03. Theme, Fonts, And Colors
% ----------------------------------------------------------------------
\usetheme{Frankfurt}
\useoutertheme{infolines}

\setbeamerfont{frametitle}{family=\kaishu,size=\fontsize{18}{10}}
\setbeamerfont{section in head/foot}{family=\kaishu,size=\fontsize{10}{10}}
\setbeamerfont{section in toc}{family=\kaishu}
\setbeamerfont{institute}{family=\kaishu}
\setbeamerfont{date}{family=\kaishu}
\setbeamerfont{headline}{family=\kaishu}
\setbeamerfont{footline}{family=\kaishu}
\setbeamerfont{subtitle}{family=\kaishu}
\setbeamerfont{author}{family=\kaishu}
\setbeamerfont{normal text}{family=\kaishu}
\setbeamerfont{theorems}{family=\kaishu}
\AtBeginDocument{\usebeamerfont{normal text}}

\definecolor{UniOrange}{RGB}{212,69,0}
\definecolor{UniGray}{RGB}{62,61,60}
\definecolor{UniRed}{RGB}{124,35,62}
\definecolor{UniBlue}{RGB}{26,64,137}
\definecolor{UniBluetwo}{RGB}{8,46,120}
\definecolor{MyThemeBlue}{RGB}{165,180,200}

\setbeamercolor{structure}{fg=UniBlue}
\setbeamercolor{section in head/foot}{bg=UniBluetwo}
\setbeamercolor{author in head/foot}{bg=UniBluetwo}
\setbeamercolor{navigation symbols}{fg=MyThemeBlue}
\setbeamercolor{navigation symbols dimmed}{fg=MyThemeBlue!45}

% ----------------------------------------------------------------------
% 04. Beamer Templates
% ----------------------------------------------------------------------
\setbeamertemplate{theorems}[numbered]
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{section in head/foot shaded}[default][60]
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{headline}
{%
	\begin{beamercolorbox}{section in head/foot}
		\vskip2pt
		\insertsectionnavigationhorizontal{\textwidth}{}{}
		\vskip2pt
	\end{beamercolorbox}
}

% ----------------------------------------------------------------------
% 05. Public Logo Interface
% ----------------------------------------------------------------------
% Usage in main.tex:
%   \logo{理学院}
%
% The class searches these files in order:
%   logo/理学院
%   logo/理学院.png
%   logo/理学院.jpg
%   logo/理学院.pdf
% If no matched college logo is found, logo/学校.png is used.
\newcommand{\ECUTCollegeLogoFile}{logo/学校.png}

\newcommand{\ECUTSetCollegeLogo}[1]{%
	\IfFileExists{logo/#1}{%
		\gdef\ECUTCollegeLogoFile{logo/#1}%
	}{%
		\IfFileExists{logo/#1.png}{%
			\gdef\ECUTCollegeLogoFile{logo/#1.png}%
		}{%
			\IfFileExists{logo/#1.jpg}{%
				\gdef\ECUTCollegeLogoFile{logo/#1.jpg}%
			}{%
				\IfFileExists{logo/#1.pdf}{%
					\gdef\ECUTCollegeLogoFile{logo/#1.pdf}%
				}{%
					\gdef\ECUTCollegeLogoFile{logo/学校.png}%
					\ClassWarning{ECUTbeamer}{Cannot find logo/#1, logo/#1.png, logo/#1.jpg, or logo/#1.pdf. Use logo/学校.png instead}%
				}%
			}%
		}%
	}%
}

\renewcommand{\logo}[1]{\ECUTSetCollegeLogo{#1}}

% ----------------------------------------------------------------------
% 06. Header Logo And Watermark
% ----------------------------------------------------------------------
\addtobeamertemplate{frametitle}{}{%
	\begin{tikzpicture}[remember picture,overlay]
		\node[
		anchor=north east,
		xshift=-0.25cm,
		yshift=-0.50cm
		] at (current page.north east)
		{\includegraphics[height=0.7cm]{\ECUTCollegeLogoFile}};
	\end{tikzpicture}%
}

\newcommand{\ECUTWatermarkRight}{%
	\begin{tikzpicture}[remember picture,overlay]
		\node[
		anchor=east,
		inner sep=0pt,
		opacity=0.1,
		xshift=2.5cm,
		yshift=0cm
		] at (current page.east)
		{\includegraphics[height=5cm]{logo/ECUT.pdf}};
	\end{tikzpicture}%
}

\newcommand{\ECUTWatermarkCenter}{%
	\begin{tikzpicture}[remember picture,overlay]
		\node[
		anchor=center,
		inner sep=0pt,
		yshift=-1.2cm,
		opacity=0.12
		] at (current page.center)
		{\includegraphics[height=6cm]{logo/ECUT.pdf}};
	\end{tikzpicture}%
}

\newcommand{\ECUTWatermarkLast}{%
	\begin{tikzpicture}[remember picture,overlay]
		\node[
		anchor=center,
		inner sep=0pt,
		yshift=-0.3cm,
		opacity=0.12
		] at (current page.center)
		{\includegraphics[height=6cm]{logo/ECUT.pdf}};
	\end{tikzpicture}%
}

\AddToHook{shipout/foreground}{%
	\ifnum\value{page}=1\relax
		\ECUTWatermarkCenter
	\else
		\ifnum\value{page}=\insertdocumentendpage\relax
			\ECUTWatermarkLast
		\else
			\ECUTWatermarkRight
		\fi
	\fi
}

% ----------------------------------------------------------------------
% 07. Navigation Symbols
% ----------------------------------------------------------------------
\makeatletter
\newcommand{\ECUTTopNavigationSymbols}{%
	\begingroup
	\usebeamercolor[fg]{navigation symbols}%
	\hbox{%
		\insertslidenavigationsymbol%
		\insertframenavigationsymbol%
		\insertsubsectionnavigationsymbol%
		\insertsectionnavigationsymbol%
		\insertdocnavigationsymbol%
		\insertbackfindforwardnavigationsymbol%
	}%
	\endgroup
}
\makeatother

\AddToHook{shipout/foreground}{%
	\begin{tikzpicture}[remember picture,overlay]
		\ifnum\value{page}=1
			\node[
			anchor=south east,
			inner sep=2pt
			] at ([xshift=-3pt,yshift=0pt]current page.south east)
			{\ECUTTopNavigationSymbols};
		\else
			\node[
			anchor=south east,
			inner sep=2pt
			] at ([xshift=-3pt,yshift=6pt]current page.south east)
			{\ECUTTopNavigationSymbols};
		\fi
	\end{tikzpicture}%
}

% ----------------------------------------------------------------------
% 08. Listings Style
% ----------------------------------------------------------------------
\lstdefinestyle{ECUTCode}{
	basicstyle=\ttfamily\scriptsize,
	keywordstyle=\color{UniBlue}\bfseries,
	commentstyle=\color{UniGray},
	stringstyle=\color{UniRed},
	breaklines=true,
	breakatwhitespace=true,
	columns=fullflexible,
	keepspaces=true,
	frame=single,
	rulecolor=\color{UniBlue!35},
	backgroundcolor=\color{UniBlue!3},
	xleftmargin=0.5em,
	xrightmargin=0.5em
}
\lstset{style=ECUTCode}

% ----------------------------------------------------------------------
% 09. Public Frame Helpers
% ----------------------------------------------------------------------
\newcommand{\ECUTTitleFrame}{%
	\begin{frame}[plain]
		\titlepage
	\end{frame}
}

\newcommand{\ECUTOutlineFrame}{%
	\begin{frame}
		\frametitle{目录}
		\tableofcontents
	\end{frame}
}

\newcommand{\ECUTThanksFrame}[1][谢谢观看！]{%
	\begin{frame}
		\begin{tikzpicture}[remember picture,overlay]
			\fill[UniBlue]
			([yshift=-0.5cm]current page.north west)
			rectangle
			([yshift=-1.2cm]current page.north east);

			\node[
			anchor=north east,
			inner sep=0pt,
			xshift=-0.25cm,
			yshift=-0.50cm
			] at (current page.north east)
			{\includegraphics[height=0.7cm]{\ECUTCollegeLogoFile}};
		\end{tikzpicture}

		\vfill
		\begin{center}
			{\Huge #1}
		\end{center}
		\vfill
	\end{frame}
}

% ----------------------------------------------------------------------
% 10. Section And Overlay Behavior
% ----------------------------------------------------------------------
\newtheorem{mydef}{定义}

\AtBeginSection[]
{
	\begin{frame}{目录}
		\tableofcontents[currentsection]
	\end{frame}
	\addtocounter{framenumber}{-1}
}

\setbeamercovered{%
	still covered={\opaqueness<1>{15}\opaqueness<2>{10}\opaqueness<3>{5}\opaqueness<4->{2}},
	again covered={\opaqueness<1->{15}}%
}

\endinput
