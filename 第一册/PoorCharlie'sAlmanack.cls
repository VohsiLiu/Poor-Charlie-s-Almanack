\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PoorCharlie'sAlmanack}[2026/10/22 First volume book template]
\newif\if@twopages
\DeclareOption{twopages}{\@twopagestrue}
\ProcessOptions\relax
\LoadClass[zihao=-4,a4paper,12pt,twoside,fontset=none]{ctexart}
\RequirePackage[top=3.2cm,bottom=2.7cm,left=3.18cm,right=3.18cm]{geometry}
\RequirePackage{xcolor,graphicx}

% 中文各字体独立设置；西文保留模板的 Times New Roman。
\RequirePackage[AutoFallBack=true]{xeCJK}
\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
\setCJKsansfont[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\setCJKfamilyfont{zhsong}[BoldFont={FZHei-B01}]{FZShuSong-Z01}
\setCJKfamilyfont{zhhei}[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
\setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\providecommand{\songti}{}
\renewcommand*{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{}
\renewcommand*{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{}
\renewcommand*{\kaishu}{\CJKfamily{zhkai}}
\providecommand{\fangsong}{}
\renewcommand*{\fangsong}{\CJKfamily{zhfs}}
\newCJKfontfamily\xbsong{FZXiaoBiaoSong-B05S}
\newCJKfontfamily\cusong{FZCuSong-B09S}
\setCJKfallbackfamilyfont{\CJKrmdefault}{TH-Sy-P0,FZSongS--GB1-5,FZSONG_ZHSJ_02--GB1-5}
\xeCJKDeclareCharClass{CJK}{"2160 -> "216F, "2460 -> "2473}
\setmainfont{Times New Roman}[SmallCapsFont=TeX Gyre Termes:+smcp]
\xeCJKsetup{CJKecglue=\hskip 0.15em plus 0.05em minus 0.03em}

\RequirePackage{fancyhdr,emptypage}
\fancypagestyle{tocstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[C]{\kaishu\small 目录}\fancyfoot[C]{\small\thepage}}
\fancypagestyle{tocblankstyle}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}
\fancypagestyle{docstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[CO]{\kaishu\small\nouppercase{\leftmark}}%
  \fancyhead[CE]{\kaishu\small 穷查理宝典}%
  \fancyfoot[C]{\small\thepage}}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{}
\setlength{\headheight}{16pt}
\raggedbottom
\RequirePackage{indentfirst,setspace}
\setlength{\parindent}{2em}
\setstretch{1.5}
\setlength{\parskip}{0.25em}
\setlength{\emergencystretch}{1.5em}

% 注释转为每页重新编号的真正脚注。
\RequirePackage[stable,bottom]{footmisc}
\RequirePackage{perpage}
\MakePerPage{footnote}
\newcommand{\bookchapter}{0}
\renewcommand{\thefigure}{\bookchapter.\arabic{figure}}
\renewcommand{\thetable}{\bookchapter.\arabic{table}}
\providecommand{\theHfigure}{}
\renewcommand{\theHfigure}{\arabic{section}.\arabic{figure}}
\providecommand{\theHtable}{}
\renewcommand{\theHtable}{\arabic{section}.\arabic{table}}

% section 对应原书章/辑，subsection 对应节/独立书目。
\RequirePackage{titlesec}
\titleformat{\section}[block]
  {\centering\xbsong\zihao{-2}\xeCJKsetup{CJKglue=\hskip 1.5pt}}
  {\thesection}{0em}{}
\newcommand{\booksubsectioncolor}{black}
\newcommand{\BookEntry}[2][]{%
  \begingroup\renewcommand{\booksubsectioncolor}{black}%
  \subsection*{#2}\endgroup}
\titleformat{\subsection}[block]
  {\centering\heiti\color{\booksubsectioncolor}\setstretch{1.25}\zihao{-3}}
  {\thesubsection}{0em}{}
\titleformat{\subsubsection}[block]
  {\heiti\color{black}\setstretch{1.25}\zihao{4}}
  {\thesubsubsection}{0em}{}
\titlespacing*{\section}{0pt}{1.8em}{1.6em}
\titlespacing*{\subsection}{0pt}{1.5em}{0.8em}
\titlespacing*{\subsubsection}{0pt}{1.1em}{0.5em}
\newcommand{\q}{\ \ }
% 目录与书签采用原书 NCX 层级；正文标题层级独立保留。
\newcommand{\l@bookmain}[2]{\@dottedtocline{1}{0em}{0em}{#1}{#2}}
\newcommand{\l@bookchapter}[2]{\@dottedtocline{2}{2em}{0em}{#1}{#2}}
\newcommand{\l@bookpart}[2]{%
  \vskip 0.7em\@plus\p@
  {\bfseries\@dottedtocline{1}{0em}{0em}{#1}{#2}}\vskip 0.2em\@plus\p@}
\newcommand{\BookBodySection}[2][]{%
  \phantomsection\section*{#2}%
  \if\relax\detokenize{#1}\relax\markboth{#2}{}\else\markboth{#1}{}\fi}
\newcommand{\BookTOCMain}[2][]{%
  \BookBodySection[#1]{#2}%
  \if\relax\detokenize{#1}\relax\addcontentsline{toc}{bookmain}{#2}%
  \else\addcontentsline{toc}{bookmain}{#1}\fi}
\newcommand{\BookTOCChapter}[2][]{%
  \BookBodySection[#1]{#2}%
  \if\relax\detokenize{#1}\relax\addcontentsline{toc}{bookchapter}{#2}%
  \else\addcontentsline{toc}{bookchapter}{#1}\fi}
\newcommand{\bookpart}[2]{%
  \phantomsection\markboth{#1}{}\addcontentsline{toc}{bookpart}{#1}%
  \thispagestyle{docstyle}%
  \begin{center}\vspace*{8em}{\xbsong\zihao{-1}#2\par}\end{center}}

\RequirePackage{float,array,tabularx,longtable,enumitem}
\RequirePackage[font=small,labelfont=small]{caption}
\setlist[itemize]{topsep=0pt,itemsep=0pt,parsep=\parskip,partopsep=0pt}
\setlist[enumerate]{topsep=0pt,itemsep=0pt,parsep=\parskip,partopsep=0pt}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 原书三种框：圆角署名箴言、直角黑体导语、分辑上下横线。
% 纯文字语义框，保留可编辑正文；长框允许分页。
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable,skins}
\tcbset{bookframe/.style={enhanced,breakable,colback=white,colframe=black,coltext=black,
  boxrule=0.55pt,left=0.8em,right=0.8em,top=0.65em,bottom=0.65em,
  before skip=0.9em,after skip=0.9em,
  before upper={\setlength{\parindent}{2em}\setlength{\parskip}{0.3em}},
  fontupper=\songti}}
\newcommand{\WisdomSpeaker}[1]{\noindent\textbf{#1}}
\newtcolorbox{WisdomBox}{bookframe,arc=3mm}
\newtcolorbox{BookSummaryBox}{bookframe,arc=0mm,boxrule=0.9pt,fontupper=\heiti,
  before upper={\setlength{\parindent}{0pt}\setlength{\parskip}{0.3em}\centering}}
\newtcolorbox{MungerSaysBox}{bookframe,sharp corners,boxrule=0pt,frame hidden,
  borderline north={1pt}{0pt}{black},borderline south={1pt}{0pt}{black},
  fontupper=\kaishu}

% 封面是书目的一部分，没有原图号，固定紧随书目标题，不编造编号。
\newcommand{\BookCover}[2]{%
  \begin{center}\begin{minipage}{\linewidth}\centering
  \includegraphics[width=0.5\linewidth]{#1}%
  \par\smallskip{\kaishu\small #2\par}%
  \end{minipage}\end{center}}
\newcommand{\BookMinorHeading}[1]{\par\medskip{\centering\heiti #1\par}\nobreak}
\AtBeginEnvironment{quotation}{\kaishu}
\newenvironment{BookPoem}{\kaishu\setlength{\parindent}{0pt}\setlength{\leftskip}{2em}}{}
% 支持分辑入口内嵌套引用独立书目。
\RequirePackage{newclude}
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,allcolors=black,linktoc=all,bookmarksopen=true,bookmarksopenlevel=2,
  pdftitle={穷查理宝典（珍藏本）第一册：芒格智慧箴言与私人书单},pdfauthor={查理·芒格}}

\def\toclevel@bookpart{1}
\def\toclevel@bookmain{1}
\def\toclevel@bookchapter{2}
\endinput
