<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
  License Applicability. Except to the extent portions of this file are
  made subject to an alternative license as permitted in the SGI Free
  Software License B, Version 1.1 (the "License"), the contents of this
  file are subject only to the provisions of the License. You may not use
  this file except in compliance with the License. You may obtain a copy
  of the License at Silicon Graphics, Inc., attn: Legal Services, 1600
  Amphitheatre Parkway, Mountain View, CA 94043-1351, or at:

  https://khronos.org/registry/OpenGL-Refpages/LICENSES/LicenseRef-FreeB.txt

  Note that, as provided in the License, the Software is distributed on an
  "AS IS" basis, with ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS
  DISCLAIMED, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES AND
  CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A
  PARTICULAR PURPOSE, AND NON-INFRINGEMENT.

  Original Code. The Original Code is: OpenGL ES Reference Manual,
  Version 1.0, released September 2003, developed by Silicon Graphics,
  Inc.  The Original Code is Copyright (c) 2003 Silicon Graphics, Inc.
  Copyright in any portions created by third parties is as indicated
  elsewhere herein.  All Rights Reserved.

  Additional Notice Provisions: The application programming interfaces
  established by SGI in conjunction with the Original Code are The
  OpenGL(R) Graphics System: A Specification (Version 1.2.1), released
  April 1, 1999; The OpenGL(R) Graphics System Utility Library (Version
  1.3), released November 4, 1998; and OpenGL(R) Graphics with the X
  Window System(R) (Version 1.3), released October 19, 1998. This software
  was created using the OpenGL(R) version 1.2.1 Sample Implementation
  published by SGI, but has not been independently verified as being
  compliant with the OpenGL(R) version 1.2.1 Specification.
-->

<xsl:output method="text"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">
<xsl:text>\documentclass[12pt,twoside,titlepage,final,letterpaper]{book}

\usepackage{color}
\usepackage{fancyhdr}
\usepackage{mdwlist}
\usepackage{textcomp}

\ifx\pdfoutput\undefined
\else
  \usepackage[colorlinks,linkcolor=blue]{hyperref}
  \hypersetup{
    pdfauthor = {</xsl:text>
<xsl:value-of select="book/bookinfo/author/firstname/text()"/>
<xsl:text> </xsl:text>
<xsl:value-of select="book/bookinfo/author/surname/text()"/>
<xsl:text>},
    pdftitle = {</xsl:text>
<xsl:apply-templates select="book/title//text()"/>
<xsl:text>},
    pdfsubject = {</xsl:text>
<xsl:apply-templates select="book/bookinfo/subjectset"/>
<xsl:text>},
    pdfkeywords = {</xsl:text>
<xsl:apply-templates select="book/bookinfo/keywordset"/>
<xsl:text>},
    pdfcreator = {LaTeX with hyperref package},
    pdfproducer = {pdflatex}
  }
  \pdfcatalog{/pagemode /UseOutlines}
  \pdfadjustspacing=1
  \pdfcompresslevel=9
\fi

\setlength{\paperwidth}{8.5in}
\setlength{\textwidth}{6in}
\setlength{\oddsidemargin}{0.25in}
\setlength{\evensidemargin}{0.25in}
\addtolength{\headsep}{0.25in}
\addtolength{\textheight}{-0.5in}
\addtolength{\footskip}{0.25in}

\raggedbottom
\emergencystretch=1in\relax

\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{1}

\hyphenation{</xsl:text>
<xsl:value-of select="document('../xml/hyphenation-rules.xml')"/>
<xsl:text>}
</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="keywordset/keyword | subjectset/subject">
  <xsl:if test="not(position()=1)">
    <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template name="dingbat">
  <xsl:param name="dingbat"/>
  <xsl:choose>
    <xsl:when test="$dingbat='bullet'">&#8226;</xsl:when>
    <xsl:when test="$dingbat='copyright'">\copyright{}</xsl:when>
    <xsl:when test="$dingbat='trademark'">\texttrademark{}</xsl:when>
    <xsl:when test="$dingbat='trade'">&#8482;</xsl:when>
    <xsl:when test="$dingbat='registered'">\textregistered{}</xsl:when>
    <xsl:when test="$dingbat='service'">\textservicemark{}</xsl:when>
    <xsl:when test="$dingbat='nbsp'">\ </xsl:when>
    <xsl:when test="$dingbat='ldquo'">&#8220;</xsl:when>
    <xsl:when test="$dingbat='rdquo'">&#8221;</xsl:when>
    <xsl:when test="$dingbat='lsquo'">&#8216;</xsl:when>
    <xsl:when test="$dingbat='rsquo'">&#8217;</xsl:when>
    <xsl:when test="$dingbat='em-dash'">&#8212;</xsl:when>
    <xsl:when test="$dingbat='mdash'">&#8212;</xsl:when>
    <xsl:when test="$dingbat='en-dash'">&#8211;</xsl:when>
    <xsl:when test="$dingbat='ndash'">&#8211;</xsl:when>
    <xsl:otherwise><xsl:text>&#8226;</xsl:text></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="trademark">
  <xsl:choose>
    <xsl:when test="@class = 'registered'">
      <xsl:apply-templates/>
      <xsl:text>\raise 1.3ex\hbox{\footnotesize\textbf{</xsl:text>
      <xsl:call-template name="dingbat">
        <xsl:with-param name="dingbat" select="@class"/>
      </xsl:call-template>
      <xsl:text>}}</xsl:text>
    </xsl:when>
    <xsl:when test="@class = 'copyright'">
      <xsl:call-template name="dingbat">
        <xsl:with-param name="dingbat" select="@class"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
      <xsl:text>\raise 1.3ex\hbox{\footnotesize\textbf{</xsl:text>
      <xsl:call-template name="dingbat">
        <xsl:with-param name="dingbat" select="trademark"/>
      </xsl:call-template>
      <xsl:text>}}</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="book">
  <xsl:text>&#xa;\begin{document}&#xa;</xsl:text>

  <xsl:text>\title{\bf </xsl:text>
  <xsl:apply-templates select="title"/>
  <xsl:if test="subtitle">
    <xsl:text>\\</xsl:text>
    <xsl:apply-templates select="subtitle"/>
  </xsl:if>
  <xsl:if test="bookinfo/releaseinfo">
    <xsl:text>\\{\normalsize (</xsl:text>
    <xsl:apply-templates select="bookinfo/releaseinfo"/>
    <xsl:text>)}</xsl:text>
  </xsl:if>
  <xsl:text>}&#xa;</xsl:text>

  <xsl:apply-templates select="bookinfo"/>
  <xsl:text>\maketitle&#xa;</xsl:text>
  <xsl:text>\pagestyle{empty}&#xa;</xsl:text>
  <xsl:apply-templates select="bookinfo/legalnotice"/>
  <xsl:text>
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyfoot[LE,RO]{\thepage}
\renewcommand{\footrulewidth}{0pt}
  </xsl:text>
  <xsl:apply-templates select="toc"/>
  <xsl:apply-templates select="chapter"/>
  <xsl:if test="appendix">
    <xsl:text>\begin{appendix}</xsl:text>
    <xsl:apply-templates select="appendix"/>
    <xsl:text>\end{appendix}</xsl:text>
  </xsl:if>
  <xsl:text>\end{document}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="bookinfo">
  <xsl:text>\author{\it Editor: </xsl:text>
  <xsl:value-of select="author/firstname/text()"/>
  <xsl:text> </xsl:text>
  <xsl:value-of select="author/surname/text()"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:text>\date{</xsl:text>
  <xsl:value-of select="date/text()"/>
  <xsl:text>}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="legalnotice">
\clearpage{}
\null\vfill
{
  \setlength{\parskip}{1.5ex}
  \setlength{\parindent}{0em}
  <xsl:apply-templates select="*"/>
}
\clearpage{\pagestyle{empty}\cleardoublepage}
</xsl:template>

<!-- copyright -->
<xsl:template match="copyright">
  Copyright \copyright{}
  <xsl:apply-templates select="year"/>
  <xsl:text> </xsl:text>
  <xsl:apply-templates select="holder"/>
</xsl:template>

<xsl:template match="year">
  <xsl:if test="not(../year[1]=.)">
    <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="toc">
\pagenumbering{roman}
\pdfbookmark[1]{Contents}{toc}
\fancyhead[LE,RO]{Contents}
\tableofcontents
\clearpage{\pagestyle{empty}\cleardoublepage}
\pagenumbering{arabic}
</xsl:template>

<xsl:template match="chapter | appendix">
  <xsl:text>\clearpage{\pagestyle{empty}\cleardoublepage}&#xa;</xsl:text>
  <xsl:text>\chapter{</xsl:text>
  <xsl:value-of select="title/text()"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:if test="subtitle">
    <xsl:text>\fancyhead[LE,RO]{\bf </xsl:text>
    <xsl:apply-templates select="title/text()"/>
    <xsl:text>}&#xa;</xsl:text>
  </xsl:if>
  <xsl:if test="..//appendix=.">
    <xsl:text>\label{</xsl:text>
    <xsl:apply-templates select="title/text()"/>
    <xsl:text>}&#xa;</xsl:text>
  </xsl:if>
  <xsl:if test="subtitle">
    <xsl:text>\noindent </xsl:text>
    <xsl:value-of select="subtitle/text()"/>
    <xsl:text>&#xa;&#xa;</xsl:text>
  </xsl:if>

  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="section">
  <xsl:text>\section*{</xsl:text>
  <xsl:value-of select="title/text()"/>
  <xsl:text>}&#xa;{</xsl:text>
  <xsl:text>\setlength{\parskip}{1.5ex}&#xa;</xsl:text>
  <xsl:text>\setlength{\parindent}{0em}&#xa;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="sect1">
  <xsl:text>\section*{</xsl:text>
  <xsl:value-of select="title/text()"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:text>\addcontentsline{toc}{section}{</xsl:text>
  <xsl:value-of select="title/text()"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:text>&#xa;\fancyhead[LE,RO]{\bf </xsl:text>
  <xsl:apply-templates select="title/text()"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sect2">
  <xsl:text>\subsection*{</xsl:text>
  <xsl:value-of select="title/text()"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="book/title">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="book/subtitle">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="title">
</xsl:template>

<xsl:template match="subtitle">
</xsl:template>

<xsl:template match="refentry">
  <xsl:text>&#xa;\newpage</xsl:text>
  <xsl:text>&#xa;\fancyhead[LE,RO]{\bf </xsl:text>
  <xsl:apply-templates select="refmeta/refentrytitle"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:apply-templates select="refnamediv"/>
  <xsl:text>\addcontentsline{toc}{section}{</xsl:text>
  <xsl:apply-templates select="refmeta/refentrytitle"/>
  <xsl:text>}&#xa;\label{</xsl:text>
  <xsl:apply-templates select="refmeta/refentrytitle"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:apply-templates select="refsynopsisdiv | refsect1"/>
</xsl:template>

<xsl:template match="refentrytitle">
  <xsl:call-template name="wrapquotes">
    <xsl:with-param name="text">
      <xsl:value-of select="."/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="manvolnum">
  <xsl:text>(</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>)</xsl:text>
</xsl:template>

<!-- name -->
<xsl:template match="refnamediv">
  <xsl:text>&#xa;\subsection*{\Large Name}&#xa;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="refnamediv/refpurpose">
  <xsl:text> -- </xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- c specification -->
<xsl:template match="funcprototype">
  <xsl:text>&#xa;\noindent {\tt </xsl:text>
  <xsl:choose>
    <xsl:when test="string-length(.)>60">
      <xsl:text>\begin{tabbing}</xsl:text>
      <xsl:apply-templates select="funcdef"/>
      <xsl:text>\end{tabbing}</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="funcdef"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="funcdef/function">
  <xsl:text>{\bf </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}(</xsl:text>
  <xsl:if test="string-length(../..)>60">
    <xsl:text>\=</xsl:text>
  </xsl:if>
  <xsl:apply-templates select="../../void"/><xsl:apply-templates select="../../paramdef"/><xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="paramdef">
  <xsl:if test="not(position()=1)">
    <xsl:choose>
      <xsl:when test="string-length(..)>60">
        <!-- wrap long lines -->
        <xsl:text>,\\&#xa;\></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>, </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="void">
  <xsl:text>void</xsl:text>
</xsl:template>

<!-- section titles -->
<xsl:template match="refsect1/title | refsynopsisdiv/title">
  <xsl:text>&#xa;\subsection*{\Large </xsl:text>
  <xsl:value-of select="."/>
  <xsl:text>}&#xa;</xsl:text>
</xsl:template>

<!-- paragraph -->
<xsl:template match="para">
  <xsl:text>&#xa;</xsl:text>
  <xsl:choose>
    <xsl:when test="contains(../title/text(), 'Errors') or contains(../title/text(), 'Associated Gets')">
      <xsl:text>\medskip&#xa;\noindent </xsl:text>
      <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>&#xa;</xsl:text>
</xsl:template>

<!-- program listing -->
<xsl:template match="programlisting/text()">
  <xsl:text>\begin{verbatim}&#xa;</xsl:text>
  <xsl:value-of select="."/>
  <xsl:text>\end{verbatim}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="programlisting">
  <xsl:apply-templates/>
</xsl:template>

<!-- ordered list -->

<xsl:template name="orderedlistlevel">
  <xsl:choose>
    <xsl:when test="//orderedlist//orderedlist//orderedlist//orderedlist=.">
      <xsl:text>iv</xsl:text>
    </xsl:when>
    <xsl:when test="//orderedlist//orderedlist//orderedlist=.">
      <xsl:text>iii</xsl:text>
    </xsl:when>
    <xsl:when test="//orderedlist//orderedlist=.">
      <xsl:text>ii</xsl:text>
    </xsl:when>
    <xsl:when test="//orderedlist=.">
      <xsl:text>i</xsl:text>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="orderedlist">
  <xsl:text>\begin{enumerate}&#xa;</xsl:text>
  <xsl:if test="@spacing='compact'">
    <xsl:text>\setlength{\itemsep}{0ex}&#xa;</xsl:text>
  </xsl:if>
  <xsl:text>\renewcommand{\labelenum</xsl:text>
  <xsl:call-template name="orderedlistlevel"/>
  <xsl:text>}{</xsl:text>
  <xsl:if test="@inheritnum='inherit'">
    <!-- kludge -->
    <xsl:text>\arabic{enumi}.</xsl:text>
  </xsl:if> 
  <xsl:choose>
    <xsl:when test="@numeration='arabic'">
      <xsl:text>\arabic</xsl:text>
    </xsl:when>
    <xsl:when test="@numeration='loweralpha'">
      <xsl:text>\alph</xsl:text>
    </xsl:when>
    <xsl:when test="@numeration='lowerroman'">
      <xsl:text>\roman</xsl:text>
    </xsl:when>
    <xsl:when test="@numeration='upperalpha'">
      <xsl:text>\Alph</xsl:text>
    </xsl:when>
    <xsl:when test="@numeration='upperroman'">
      <xsl:text>\Roman</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>\arabic</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>{enum</xsl:text>
  <xsl:call-template name="orderedlistlevel"/>
  <xsl:text>}</xsl:text>
<!--  <xsl:if test="not(@inheritnum='inherit')"> -->
    <xsl:text>.</xsl:text>
<!--  </xsl:if> -->
  <xsl:text>}</xsl:text>

  <xsl:apply-templates/>
  <xsl:text>\end{enumerate}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="orderedlist/listitem">
  <xsl:text>\item </xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- inbetween text -->

<xsl:template match="refdescriptor | refentry/text()">
</xsl:template>

<xsl:template match="refname">
  <xsl:if test="not(../refname[1]/text()=text())">
    <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:text>{\bf </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="function">
  <xsl:text>{\bf </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="anchor">
  <xsl:text>\label{</xsl:text>
  <xsl:value-of select="@id"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="link">
  <xsl:text>\hyperref[</xsl:text>
  <xsl:value-of select="@linkend"/>
  <xsl:text>]{</xsl:text>
  <xsl:value-of select="."/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="ulink">
  <xsl:text>\href{</xsl:text>
  <xsl:value-of select="@url"/>
  <xsl:text>}{</xsl:text>
  <xsl:value-of select="."/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="citerefentry">
  <xsl:variable name="name" select="refentrytitle/text()"/>

  <xsl:text>\hyperref[</xsl:text>

  <xsl:choose>
    <xsl:when test="$name='glDisable'">
      <xsl:text>glEnable</xsl:text>
    </xsl:when>
    <xsl:when test="$name='glDisableClientState'">
      <xsl:text>glEnableClientState</xsl:text>
    </xsl:when>
    <xsl:when test="$name='glPopMatrix'">
      <xsl:text>glPushMatrix</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$name"/>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:text>]{\bf </xsl:text>
  <xsl:apply-templates select="refentrytitle"/>
  <xsl:text>}</xsl:text>

  <xsl:apply-templates select="manvolnum"/>
</xsl:template>

<!-- parameter -->
<xsl:template match="paramdef/parameter">
  <xsl:text>{\it </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="parameter">
  <xsl:text>{\tt {\it </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}}</xsl:text>
</xsl:template>

<xsl:template match="constant | errorcode | type | filename">
  <xsl:text>{\tt </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="emphasis[@role='bold'] | emphasis[@role='strong']">
  <xsl:text>{\bf </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>
  
<xsl:template match="firstterm | emphasis">
  <xsl:text>{\em </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- simple list -->

<xsl:template match="simplelist">
  <xsl:text>\begin{itemize}&#xa;</xsl:text>
  <xsl:text>\setlength{\itemsep}{0ex}&#xa;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>\end{itemize}&#xa;\noindent </xsl:text>
</xsl:template>

<xsl:template match="member">
  <xsl:text>\item[] </xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- variable list -->

<xsl:template match="variablelist">
  <xsl:text>\begin{basedescript}{\desclabelstyle{\nextlinelabel}\desclabelwidth{4em}}&#xa;\setlength{\parsep}{0em}&#xa;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>\end{basedescript}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="term">
  <xsl:text>\item[\textnormal{</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}] </xsl:text>
</xsl:template>

<xsl:template match="listitem">
  <xsl:apply-templates/>
</xsl:template>

<!-- table -->

<xsl:template match="table | informaltable">
  <xsl:text>\&#xa;\begin{center}&#xa;\begin{tabular}{</xsl:text>
  <xsl:apply-templates select="tgroup/colspec"/>
  <xsl:text>}&#xa;</xsl:text>
  <xsl:apply-templates select="tgroup/thead/row | tgroup/tbody/row"/>
  <xsl:text>\end{tabular}&#xa;\end{center}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="colspec">
  <xsl:value-of select="substring(@align, 1, 1)"/>
</xsl:template>

<xsl:template match="thead/row">
  <xsl:if test="not(position()=1)">
    <xsl:text>\\&#xa;</xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tbody/row">
  <xsl:text>\\ </xsl:text>
  <xsl:if test="@rowsep=1">
    <xsl:text>\hline</xsl:text>
  </xsl:if>
  <xsl:text>&#xa;</xsl:text>

  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="thead/row/entry">
  <xsl:if test="not(position()=1)">
    <xsl:text> &amp; </xsl:text>
  </xsl:if>
  <xsl:text>{\bf </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="entry">
  <xsl:if test="not(position()=1)">
    <xsl:text> &amp; </xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<!-- wrapquotes -->
<xsl:template name="wrapquotes">
  <xsl:param name="text"/>

  <xsl:choose>
    <xsl:when test="contains($text, ' ')">
      <xsl:value-of select="concat(concat('&quot;', $text), '&quot;')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$text"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- escape with backslashes -->
<xsl:template name="escape">
  <xsl:param name="text"/>

  <xsl:call-template name="escape-plus">
    <xsl:with-param name="text">
      <xsl:value-of select="$text"/>
    </xsl:with-param>
    <xsl:with-param name="characters">
      <xsl:value-of select="'#$&amp;~_^%{}'"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="escape-plus">
  <xsl:param name="text"/>
  <xsl:param name="characters"/>

  <!-- constains characters to escape -->
  <xsl:variable name="translated" select="translate($text, $characters, '\\\\\\\\\')"/>
  <xsl:choose>
  <xsl:when test="not($translated=$text)">
    <xsl:variable name="before" select="substring-before($translated, '\')"/>
    <xsl:variable name="pos" select="string-length($before)"/>
    <xsl:value-of select="$before"/>
    <xsl:text>\</xsl:text>
    <!-- special cases for ^ and ~ -->

    <xsl:variable name="char" select="substring($text, $pos+1, 1)"/>
    <xsl:choose>
      <xsl:when test="$char='^'">
        <xsl:text>^{} </xsl:text>
      </xsl:when>
      <xsl:when test="$char='~'">
        <xsl:text>~{} </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($text, $pos+1, 1)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="escape-plus">
      <xsl:with-param name="text">
        <xsl:value-of select="substring($text, $pos+2)"/>
      </xsl:with-param>
      <xsl:with-param name="characters">
        <xsl:value-of select="$characters"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <xsl:value-of select="$text"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- text -->
<!--
  Every text node is normalized (multiple white-spaces are collapsed
  to a single space).

  Special case handling is done for the first and last text node
  at the beginning and ending of the text node.

  Variables can only be changed for the current scope, therefore
  the fully expanded case tree.
-->
<xsl:template match="text()">
  <xsl:variable name="temp0" select="string()"/>

  <xsl:choose>
  <xsl:when test="not(position()=1)">
    <xsl:variable name="temp1" select="concat('X', $temp0)"/>

    <xsl:choose>
    <xsl:when test="not(position()=last())">
      <xsl:variable name="temp2" select="concat($temp1, 'X')"/>
      <xsl:variable name="temp3" select="normalize-space($temp2)"/>
      <xsl:variable name="length" select="string-length($temp3)"/>
      <xsl:variable name="temp4" select="substring($temp3, 2, $length - 2)"/>

      <xsl:call-template name="escape">
        <xsl:with-param name="text">
          <xsl:value-of select="$temp4"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="temp2" select="normalize-space($temp1)"/>
      <xsl:variable name="temp3" select="substring($temp2, 2)"/>

      <xsl:call-template name="escape">
        <xsl:with-param name="text">
          <xsl:value-of select="$temp3"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:when>
  <xsl:otherwise>
    <xsl:choose>
    <xsl:when test="not(position()=last())">
      <xsl:variable name="temp2" select="concat($temp0, 'X')"/>
      <xsl:variable name="temp3" select="normalize-space($temp2)"/>
      <xsl:variable name="length" select="string-length($temp3)"/>
      <xsl:variable name="temp4" select="substring($temp3, 1, $length - 1)"/>

      <xsl:call-template name="escape">
        <xsl:with-param name="text">
          <xsl:value-of select="$temp4"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="temp2" select="normalize-space($temp0)"/>

      <xsl:call-template name="escape">
        <xsl:with-param name="text">
          <xsl:value-of select="$temp2"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- MathML -->

<xsl:template match="equation | informalequation">
  <xsl:choose>
    <xsl:when test="count(math/mtable)=1">
      <xsl:text>\begin{eqnarray*}&#xa;</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>\end{eqnarray*}&#xa;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>\begin{displaymath}&#xa;</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>\end{displaymath}&#xa;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>\noindent </xsl:text>
</xsl:template>

<xsl:template match="mrow/mtable">
  <xsl:text>\begin{array}{cccc}&#xa;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>\end{array}&#xa;</xsl:text>
</xsl:template>

<xsl:template match="mtr">
  <xsl:apply-templates/>
  <xsl:text>\\&#xa;</xsl:text>
</xsl:template>

<xsl:template match="mtd">
  <xsl:if test="not(position()=1)">
    <xsl:text> &amp; </xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="mgroupalign">
  <xsl:text> &amp; </xsl:text>
</xsl:template>

<xsl:template match="mrow">
  <xsl:text>{</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="inlineequation">
  <xsl:text>$</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>$</xsl:text>
</xsl:template>

<xsl:template match="mi">
  <xsl:choose>
    <xsl:when test="starts-with(text(), 'GL_') or starts-with(text(), 'EGL_')">
      <xsl:text>\mbox{\tt </xsl:text>
      <xsl:apply-templates/>
      <xsl:text>}</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- number -->
<xsl:template match="mn">
  <xsl:apply-templates/>
</xsl:template>

<!-- operator -->
<xsl:template match="mo">
  <!-- incomplete -->
  <xsl:if test="text()='&gt;='">
    <xsl:text> \ge </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&gt;'">
    <xsl:text> &gt; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&lt;='">
    <xsl:text> \le </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&lt;'">
    <xsl:text> &lt; </xsl:text>
  </xsl:if>
  <xsl:if test="text()=','">
    <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:if test="text()='['">
    <xsl:text>\left[</xsl:text>
  </xsl:if>
  <xsl:if test="text()=']'">
    <xsl:text>\right] </xsl:text>
  </xsl:if>
  <xsl:if test="text()='('">
    <xsl:text>\left(</xsl:text>
  </xsl:if>
  <xsl:if test="text()=')'">
    <xsl:text>\right) </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x2260;'">
    <xsl:text> \ne </xsl:text>
  </xsl:if>
  <xsl:if test="text()='='">
    <xsl:text> = </xsl:text>
  </xsl:if>
  <xsl:if test="text()='/'">
    <xsl:text> / </xsl:text>
  </xsl:if>
  <xsl:if test="text()='+'">
    <xsl:text> + </xsl:text>
  </xsl:if>
  <xsl:if test="text()='-'">
    <xsl:text> - </xsl:text>
  </xsl:if>
  <xsl:if test="text()='x'">
    <xsl:text> \times </xsl:text>
  </xsl:if>
  <xsl:if test="text()='*'">
    <xsl:text> \ast </xsl:text>
  </xsl:if>
  <xsl:if test="text()='max'">
    <xsl:text>\max </xsl:text>
  </xsl:if>
  <xsl:if test="text()='min'">
    <xsl:text>\min </xsl:text>
  </xsl:if>
  <xsl:if test="text()='cos'">
    <xsl:text>\cos </xsl:text>
  </xsl:if>
  <xsl:if test="text()='sin'">
    <xsl:text>\sin </xsl:text>
  </xsl:if>
  <xsl:if test="text()='log'">
    <xsl:text>\log</xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x394;'">
    <xsl:text>\Delta </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x230a;'">
    <xsl:text>\lfloor </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x230b;'">
    <xsl:text>\rfloor </xsl:text>
  </xsl:if>
  <xsl:if test="text()='|'">
    <xsl:if test="position()=1 and not(position()=last())">
      <xsl:text>\left|</xsl:text>
    </xsl:if>
    <xsl:if test="(position()=1) = (position()=last())">
      <xsl:text> \mid </xsl:text>
    </xsl:if>
    <xsl:if test="position()=last() and not(position()=1)">
      <xsl:text>\right|</xsl:text>
    </xsl:if>
  </xsl:if>
  <xsl:if test="text()='~'">
    <xsl:text> \tilde{\hspace{0.5em}}</xsl:text>
  </xsl:if>
  <xsl:if test="text()='^'">
    <xsl:text> \hat{\hspace{1em}} </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&amp;'">
    <xsl:text> \mbox{\hspace{0.3em}{\small \&amp;}\hspace{0.3em}} </xsl:text>
  </xsl:if>
  <xsl:if test="text()='||'">
    <xsl:text>\| </xsl:text>
  </xsl:if>
  <xsl:if test="text()='...'">
    <xsl:text>\ldots </xsl:text>
  </xsl:if>
  <xsl:if test="text()='M'">
    <xsl:text>M</xsl:text>
  </xsl:if>
</xsl:template>

<!-- subscript -->
<xsl:template match="msub">
  <xsl:apply-templates select="*[1]"/>
  <xsl:text>_{</xsl:text>
  <xsl:apply-templates select="*[2]"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- superscript -->
<xsl:template match="msup">
  <xsl:apply-templates select="*[1]"/>
  <xsl:text>^{</xsl:text>
  <xsl:apply-templates select="*[2]"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- fraction -->
<xsl:template match="mfrac">
  <xsl:text>\frac{</xsl:text>
  <xsl:apply-templates select="*[1]"/>
  <xsl:text>}{</xsl:text>
  <xsl:apply-templates select="*[2]"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template name="translate-op">
  <xsl:param name="value"/>
  <xsl:if test="$value='|'">
    <xsl:if test="position()=1">
      <xsl:text>\left|</xsl:text>
    </xsl:if>
    <xsl:if test="position()=last()">
      <xsl:text>\right|</xsl:text>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template match="mfenced">
  <xsl:text>{</xsl:text>
  <xsl:choose>
    <xsl:when test="string-length(@open)&gt;0">
      <!-- should call a template -->
      <!-- <xsl:value-of select="@open"/> -->
      <xsl:call-template name="translate-op">
        <xsl:with-param name="value" select="@close"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text> (</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:for-each select="*">
    <xsl:if test="not(position()=1)">
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="."/>
  </xsl:for-each>
  <xsl:choose>
    <xsl:when test="string-length(@close)&gt;0">
      <!-- should call a template -->
      <!--<xsl:value-of select="@close"/>-->
      <xsl:call-template name="translate-op">
        <xsl:with-param name="value" select="@close"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>) </xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="replaceable">
  <xsl:text>\textit{</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

</xsl:stylesheet>
