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

<xsl:output method="text" indent="no"/>
<xsl:strip-space elements="*"/>

<xsl:template name="dingbat">
  <xsl:param name="dingbat"/>
  <xsl:choose>
    <xsl:when test="$dingbat='bullet'">*</xsl:when>
    <xsl:when test="$dingbat='copyright'">(c)</xsl:when>
    <xsl:when test="$dingbat='trademark'">(TM)</xsl:when>
    <xsl:when test="$dingbat='trade'">&#8482;</xsl:when>
    <xsl:when test="$dingbat='registered'">(R)</xsl:when>
    <xsl:when test="$dingbat='service'">(SM)</xsl:when>
    <xsl:when test="$dingbat='nbsp'"> </xsl:when>
    <xsl:when test="$dingbat='ldquo'">&#8220;</xsl:when>
    <xsl:when test="$dingbat='rdquo'">&#8221;</xsl:when>
    <xsl:when test="$dingbat='lsquo'">&#8216;</xsl:when>
    <xsl:when test="$dingbat='rsquo'">&#8217;</xsl:when>
    <xsl:when test="$dingbat='em-dash'">--</xsl:when>
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
      <xsl:call-template name="dingbat">
        <xsl:with-param name="dingbat" select="@class"/>
      </xsl:call-template>
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
      <xsl:call-template name="dingbat">
        <xsl:with-param name="dingbat" select="trademark"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="refentry">
  <xsl:apply-templates select="refmeta | refnamediv | refsynopsisdiv | refsect1[not(title/.='See Also')]"/>
  <xsl:apply-templates select="document('../xml/copyright-section.xml')"/>
  <xsl:apply-templates select="refsect1[title/.='See Also']"/>
</xsl:template>

<!-- refmeta -->
<xsl:template match="refmeta">
  <xsl:text>.TH </xsl:text>
  <xsl:apply-templates select="refentrytitle"/>
  <xsl:text> 3G "September 2003"</xsl:text>
  <xsl:if test="starts-with(refentrytitle/text(), 'gl')">
    <xsl:text> "OpenGL ES 1.0"</xsl:text>
  </xsl:if>
  <xsl:if test="starts-with(refentrytitle/text(), 'egl')">
    <xsl:text> "EGL 1.0"</xsl:text>
  </xsl:if>
</xsl:template>

<!-- name -->
<xsl:template match="refnamediv">
  <xsl:text>&#xa;.EQ&#xa;delim $$&#xa;.EN</xsl:text>
  <xsl:text>&#xa;.SH NAME&#xa;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="refnamediv/refpurpose">
  <xsl:text> - </xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- c specification -->
<xsl:template match="funcprototype">
  <xsl:if test="not(position()=1)">
    <xsl:choose>
      <xsl:when test="string-length(.)>50">
        <xsl:text>&#xa;.P</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&#xa;.br</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates select="funcdef"/>
</xsl:template>

<xsl:template match="funcdef/function">
  <xsl:text>\f3</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>\fP(</xsl:text>
  <xsl:apply-templates select="../../void"/>
  <xsl:apply-templates select="../../paramdef"/>
</xsl:template>

<!--
<xsl:template match="paramdef">
  <xsl:if test="not(position()=1)">
    <xsl:choose>
      <xsl:when test="string-length(..)>60">
        <! wrap long lines >
        <xsl:text>,&#xa;    </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>, </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>
-->
<xsl:template match="paramdef">
  <xsl:choose>
    <!-- wrap long lines -->
    <xsl:when test="count(../paramdef)>1 and string-length(..)>50">
      <xsl:if test="position()>=2">
        <xsl:text>,&#xa;</xsl:text>
      </xsl:if>
      <xsl:if test="position()=2">
        <xsl:text>.nf&#xa;.ta </xsl:text>
        <xsl:value-of select="string-length(../funcdef/function/text()) + string-length(../funcdef/text()) + 1"/>
        <xsl:text>&#xa;</xsl:text>
      </xsl:if>
      <xsl:if test="position()>=2">
        <xsl:text>&#x9;</xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="position()=count(../paramdef)">
        <xsl:text>)</xsl:text>
        <xsl:text>&#xa;.fi</xsl:text>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="not(position()=1)">
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="position()=count(../paramdef)">
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="void">
  <xsl:text>void)</xsl:text>
</xsl:template>

<!-- section titles -->
<xsl:template match="refsect1/title | refsynopsisdiv/title">
  <xsl:text>&#xa;.SH </xsl:text>
  <xsl:call-template name="toupper">
    <xsl:with-param name="text">
      <xsl:value-of select="."/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- paragraph -->
<xsl:template match="listitem/para">
  <xsl:if test="not(position()=1)">
    <xsl:text>&#xa;&#xa;</xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="para">
  <xsl:choose>
    <xsl:when test="preceding-sibling::para and contains(../title/text(), 'Associated Gets')">
      <xsl:text>&#xa;.br&#xa;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>&#xa;.P&#xa;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates/>
</xsl:template>

<!-- preformatted text -->
<xsl:template match="programlisting/text()">
  <xsl:call-template name="pre-text">
    <xsl:with-param name="text">
      <xsl:value-of select="."/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="programlisting">
  <xsl:text>&#xa;.P&#xa;.nf&#xa;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&#xa;.fi</xsl:text>
</xsl:template>

<!-- inbetween text -->
<xsl:template match="refentry/text() | ul/text() | ol/text() | dl/text()">
</xsl:template>

<!-- unordered lists -->
<xsl:template match="ul">
  <xsl:text>&#xa;.BL</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&#xa;.LE</xsl:text>
</xsl:template>

<!-- list item -->
<xsl:template match="li">
  <xsl:text>&#xa;.LI&#xa;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- ordered lists -->
<xsl:template match="orderedlist">
<!--  <xsl:text>&#xa;.TP</xsl:text>-->
  <xsl:apply-templates/>
<!--  <xsl:text>&#xa;.TE</xsl:text>-->
</xsl:template>

<xsl:template match="orderedlist/listitem">
  <xsl:text>&#xa;.TP&#xa;</xsl:text>
  <xsl:value-of select="position()"/>
  <xsl:text>.&#xa;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- description list -->
<xsl:template match="variablelist">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="varlistentry">
  <xsl:choose>
    <xsl:when test="position()=1">
      <xsl:text>&#xa;.TP 12&#xa;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>&#xa;.TP&#xa;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="listitem">
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- italic text -->
<xsl:template match="emphasize | parameter | firstterm">
  <xsl:text>\f2</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>\fP</xsl:text>
</xsl:template>

<!-- refdescriptor -->
<xsl:template match="refdescriptor">
</xsl:template>

<!-- refname -->
<xsl:template match="refname">
  <xsl:if test="not(../refname[1]/text()=text())">
    <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:text>\f3</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>\fP</xsl:text>
</xsl:template>

<!-- bold text -->

<xsl:template match="function | constant | ulink | citerefentry | filename">
  <xsl:text>\f3</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>\fP</xsl:text>
</xsl:template>

<xsl:template match="manvolnum">
  <xsl:text>(</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>)</xsl:text>
</xsl:template>

<!-- table -->

<xsl:template match="table | informaltable">
  <xsl:text>&#xa;.P&#xa;.TS&#xa;center tab(@);</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&#xa;.TE</xsl:text>
</xsl:template>

<xsl:template match="colspec">
  <xsl:if test="position()=1">
    <xsl:text>&#xa;</xsl:text>
  </xsl:if>
  <xsl:if test="not(position()=1)">
    <xsl:if test="../@colsep=1">
      <xsl:text>|</xsl:text>
    </xsl:if>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="string-length(@align)=0">
      <xsl:text>l</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="substring(@align, 1, 1)"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:if test="position()=count(../colspec)">
    <xsl:text>.</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="row">
  <!-- first row defines table width -->
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="entry">
  <xsl:if test="not(position()=1)">
    <xsl:text>@</xsl:text>
  </xsl:if>
  <xsl:if test="//thead/row/entry=.">
    <xsl:text>\f3</xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
  <xsl:if test="//thead/row/entry=.">
    <xsl:text>\fP</xsl:text>
  </xsl:if>
</xsl:template>

<!-- link -->
<xsl:template match="a">
  <!-- check for empty links -->
  <xsl:if test="not(string-length(normalize-space(.))=0)">
    <xsl:text>\fI</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>\fP</xsl:text>
  </xsl:if>
</xsl:template>

<!-- preformatted text -->
<xsl:template name="pre-text">
  <xsl:param name="text"/>

  <xsl:variable name="pattern" select="string('&#xa;')"/>

  <xsl:choose>
  <xsl:when test="contains($text, $pattern)">
    <xsl:call-template name="escape">
      <xsl:with-param name="text">
        <xsl:value-of select="substring-before($text, $pattern)"/>
      </xsl:with-param>
    </xsl:call-template>

    <xsl:text>&#xa;</xsl:text>

    <xsl:call-template name="pre-text">
      <xsl:with-param name="text">
        <xsl:value-of select="substring-after($text, $pattern)"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="escape">
      <xsl:with-param name="text">
        <xsl:value-of select="$text"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- copyright -->
<xsl:template match="copyright">
  <xsl:text>Copyright (c) </xsl:text>
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

<!-- toupper -->
<xsl:template name="toupper">
  <xsl:param name="text"/>

  <xsl:value-of select="translate($text, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
</xsl:template>

<!-- escape backslashes -->
<xsl:template name="escape">
  <xsl:param name="text"/>

  <xsl:choose>
  <xsl:when test="contains($text, '\')">
    <xsl:value-of select="substring-before($text, '\')"/>
    <xsl:text>\\</xsl:text>
    <xsl:call-template name="escape">
      <xsl:with-param name="text">
        <xsl:value-of select="substring-after($text, '\')"/>
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
  <xsl:text>&#xa;.P&#xa;.ce&#xa;.EQ&#xa;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&#xa;.EN&#xa;</xsl:text>
</xsl:template>

<xsl:template match="inlineequation">
  <xsl:text>$</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>$</xsl:text>
</xsl:template>

<xsl:template match="mn">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="mi">
  <xsl:choose>
    <xsl:when test="starts-with(text(), 'GL_')">
      <xsl:text>$\f3</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>\fP$</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>"</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>"</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="mo">
  <xsl:if test="text()='&lt;'">
    <xsl:text> ~&lt;~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&lt;='">
    <xsl:text> ~&lt;=~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&gt;'">
    <xsl:text> ~&gt;~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&gt;='">
    <xsl:text> ~&gt;=~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='('">
    <xsl:choose>
      <xsl:when test="following-sibling::mtable">
        <xsl:text> left ( ~ </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> ( </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:if test="text()=')'">
    <xsl:choose>
      <xsl:when test="preceding-sibling::mtable">
        <xsl:text> ~ right ) </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> ) </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:if test="text()=','">
    <xsl:text>,~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x2260;'">
    <xsl:text> ~!=~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='='">
    <xsl:text> ~=~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='+'">
    <xsl:text> ~+~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='-'">
    <xsl:choose>
      <xsl:when test="position()=1">
        <xsl:text> -^</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> ~-~ </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:if test="text()='*'">
    <xsl:text> ~*~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='/'">
    <xsl:text> ~/~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='x'">
    <xsl:text> ~times~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='min'">
    <xsl:text> min </xsl:text>
  </xsl:if>
  <xsl:if test="text()='max'">
    <xsl:text> max </xsl:text>
  </xsl:if>
  <xsl:if test="text()='cos'">
    <xsl:text> cos </xsl:text>
  </xsl:if>
  <xsl:if test="text()='sin'">
    <xsl:text> sin </xsl:text>
  </xsl:if>
  <xsl:if test="text()='log'">
    <xsl:text> log </xsl:text>
  </xsl:if>
  <xsl:if test="text()='|'">
    <xsl:text> ~|~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='||'">
    <xsl:text> || </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x394;'">
    <xsl:text> delta </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x230a;'">
    <xsl:text> floor( </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x230b;'">
    <xsl:text> ) </xsl:text>
  </xsl:if>
  <xsl:if test="text()='~'">
    <xsl:text> "~"^</xsl:text>
  </xsl:if>
  <xsl:if test="text()='^'">
    <xsl:text> ~"^"~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&amp;'">
    <xsl:text> ~"&amp;"~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='['">
    <xsl:text>[</xsl:text>
  </xsl:if>
  <xsl:if test="text()=']'">
    <xsl:text>]</xsl:text>
  </xsl:if>
  <xsl:if test="text()='...'">
    <xsl:text> "..." </xsl:text>
  </xsl:if>
  <xsl:if test="text()='M'">
    <xsl:text> "M" </xsl:text>
  </xsl:if>
</xsl:template>

<!-- subscript -->
<xsl:template match="msub">
  <xsl:text>{</xsl:text>
  <xsl:apply-templates select="*[1]"/>
  <xsl:text> sub </xsl:text>
  <xsl:apply-templates select="*[2]"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- superscript -->
<xsl:template match="msup">
  <xsl:text>{</xsl:text>
  <xsl:apply-templates select="*[1]"/>
  <xsl:text> sup </xsl:text>
  <xsl:apply-templates select="*[2]"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- frac -->
<xsl:template match="mfrac">
  <xsl:text>{</xsl:text>
  <xsl:apply-templates select="*[1]"/>
  <xsl:text> over </xsl:text>
  <xsl:apply-templates select="*[2]"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- row -->
<xsl:template match="mrow">
  <xsl:text>{</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- fenced -->
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
      <xsl:text> ( </xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:for-each select="*">
    <xsl:if test="not(position()=1)">
      <xsl:text>,~ </xsl:text>
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
      <xsl:text> ) </xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="replaceable">
  <xsl:text>$"</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>"$</xsl:text>
</xsl:template>

<xsl:template match="math/mtable">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="mtable[@class='vector']">
  <xsl:text>matrix {&#xa;</xsl:text>

  <xsl:text>ccol {</xsl:text>
  <xsl:apply-templates select="mtr[1]/mtd[1]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[2]/mtd[1]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[3]/mtd[1]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[4]/mtd[1]"/>
  <xsl:text>}&#xa;</xsl:text>

  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="mtable[@class='matrix']">
  <xsl:text>matrix {&#xa;</xsl:text>

  <xsl:text>ccol {</xsl:text>
  <xsl:apply-templates select="mtr[1]/mtd[1]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[2]/mtd[1]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[3]/mtd[1]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[4]/mtd[1]"/>
  <xsl:text>}&#xa;</xsl:text>

  <xsl:text>ccol {</xsl:text>
  <xsl:apply-templates select="mtr[1]/mtd[2]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[2]/mtd[2]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[3]/mtd[2]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[4]/mtd[2]"/>
  <xsl:text>}&#xa;</xsl:text>

  <xsl:text>ccol {</xsl:text>
  <xsl:apply-templates select="mtr[1]/mtd[3]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[2]/mtd[3]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[3]/mtd[3]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[4]/mtd[3]"/>
  <xsl:text>}&#xa;</xsl:text>

  <xsl:text>ccol {</xsl:text>
  <xsl:apply-templates select="mtr[1]/mtd[4]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[2]/mtd[4]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[3]/mtd[4]"/>
  <xsl:text> above </xsl:text>
  <xsl:apply-templates select="mtr[4]/mtd[4]"/>
  <xsl:text>}&#xa;</xsl:text>

  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="math/mtable/mtr">
  <xsl:if test="not(position()=1)">
    <xsl:text>&#xa;.EN&#xa;.ce&#xa;.EQ&#xa;</xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="math/mtable/mtr/mtd">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="mtd">
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
