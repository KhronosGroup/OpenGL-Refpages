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

<xsl:output method="xml" version="1.0" encoding="UTF-8"
  doctype-public="-//W3C//DTD XHTML 1.1//EN"
  doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
  indent="yes"/>

<!--
<xsl:strip-space elements="*"/>
-->

<xsl:template name="dingbat">
  <xsl:param name="dingbat"/>
  <xsl:choose>
    <xsl:when test="$dingbat='bullet'">&#149;</xsl:when>
    <xsl:when test="$dingbat='copyright'">&#169;</xsl:when>
    <xsl:when test="$dingbat='trademark'">&#153;</xsl:when>
    <xsl:when test="$dingbat='trade'">&#8482;</xsl:when>
    <xsl:when test="$dingbat='registered'">&#174;</xsl:when>
    <xsl:when test="$dingbat='service'">SM</xsl:when>
    <xsl:when test="$dingbat='nbsp'">&#160;</xsl:when>
    <xsl:when test="$dingbat='ldquo'">&#8220;</xsl:when>
    <xsl:when test="$dingbat='rdquo'">&#8221;</xsl:when>
    <xsl:when test="$dingbat='lsquo'">&#8216;</xsl:when>
    <xsl:when test="$dingbat='rsquo'">&#8217;</xsl:when>
    <xsl:when test="$dingbat='em-dash'">&#151;</xsl:when>
    <xsl:when test="$dingbat='mdash'">&#8212;</xsl:when>
    <xsl:when test="$dingbat='en-dash'">&#150;</xsl:when>
    <xsl:when test="$dingbat='ndash'">&#8211;</xsl:when>
    <xsl:otherwise><xsl:text>&#8226;</xsl:text></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="trademark">
  <xsl:choose>
    <xsl:when test="@class = 'registered'">
      <xsl:apply-templates/>
      <sup>
      <xsl:call-template name="dingbat">
        <xsl:with-param name="dingbat" select="@class"/>
      </xsl:call-template>
      </sup>
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
  <html>
    <head>
      <title>
        <xsl:apply-templates select="refmeta/refentrytitle"/>
      </title>
      <link rel="stylesheet" href="man.css" type="text/css" />
      <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
      <meta name="keywords" content="OpenGL ES, {refmeta/refentrytitle//text()}, man" />
      <meta name="description" content="OpenGL ES man page of {refmeta/refentrytitle//text()}" />
    </head>
    <body>
<!--
      <p class="center">
        <a href="index.html">Alphabetical Index</a> |
        <a href="index-thematic.html">Thematic Index</a>
      </p>
-->
      <xsl:apply-templates select="refnamediv | refsynopsisdiv | refsect1[not(title/.='See Also')]"/>
      <xsl:apply-templates select="document('../xml/copyright-section.xml')"/>
      <xsl:apply-templates select="refsect1[title/.='See Also']"/>
    </body>
  </html>
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
  <h2>Name</h2>
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="refnamediv/refpurpose">
  <xsl:text> - </xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- c specification -->
<xsl:template match="funcsynopsis">
  <pre><xsl:apply-templates select="funcprototype"/></pre>
</xsl:template>

<xsl:template match="funcprototype">
  <xsl:if test="not(position()=1)">
    <xsl:text>&#xa;</xsl:text>
    <xsl:if test="string-length(normalize-space(.))>60">
      <xsl:text>&#xa;</xsl:text>
    </xsl:if>
  </xsl:if>
  <xsl:apply-templates select="funcdef"/>
</xsl:template>

<xsl:template match="funcdef/function">
  <strong><xsl:apply-templates/></strong>(<xsl:apply-templates select="../../void"/><xsl:apply-templates select="../../paramdef"/>)</xsl:template>

<xsl:template match="paramdef">
  <xsl:if test="not(position()=1)">
    <xsl:choose>
      <xsl:when test="string-length(normalize-space(..))>60">
        <!-- wrap long lines -->
        <xsl:text>,&#xa;    </xsl:text>
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

<!-- sections and paragraphs -->

<xsl:template match="refsect1/title | refsynopsisdiv/title">
  <h2><xsl:value-of select="."/></h2>
</xsl:template>

<xsl:template match="para">
  <p>
    <xsl:apply-templates/>
  </p>
</xsl:template>

<!-- program listing -->

<!--
<xsl:template match="programlisting/text()">
  <pre><xsl:value-of select="."/></pre>
</xsl:template>

<xsl:template match="programlisting">
  <xsl:apply-templates/>
</xsl:template>
-->

<xsl:template match="programlisting/text()">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="programlisting">
  <pre><xsl:apply-templates/></pre>
</xsl:template>

<!-- ordered list -->

<xsl:template match="orderedlist">
  <ol>
    <xsl:apply-templates/>
  </ol>
</xsl:template>

<xsl:template match="orderedlist/listitem">
  <li><xsl:apply-templates/></li>
</xsl:template>

<!-- -->

<xsl:template match="refdescriptor | refentry/text()">
</xsl:template>

<!-- refname -->
<xsl:template match="refname">
  <xsl:if test="not(../refname[1]/text()=text())">
    <xsl:text>, </xsl:text>
  </xsl:if>
  <code><strong><xsl:apply-templates/></strong></code>
</xsl:template>

<xsl:template match="function">
  <code><strong><xsl:apply-templates/></strong></code>
</xsl:template>

<xsl:template match="anchor">
  <a name="{@id}"><xsl:apply-templates/></a>
</xsl:template>

<xsl:template match="ulink">
  <a href="{@url}"><xsl:value-of select="."/></a>
</xsl:template>

<xsl:template match="citerefentry">
  <xsl:variable name="name" select="refentrytitle/text()"/>

  <xsl:choose>
    <xsl:when test="$name='glDisable'">
      <a href="glEnable.html">
        <code><strong><xsl:apply-templates select="refentrytitle"/></strong></code>
      </a>
    </xsl:when>
    <xsl:when test="$name='glDisableClientState'">
      <a href="glEnableClientState.html">
        <code><strong><xsl:apply-templates select="refentrytitle"/></strong></code>
      </a>
    </xsl:when>
    <xsl:when test="$name='glPopMatrix'">
      <a href="glPushMatrix.html">
        <code><strong><xsl:apply-templates select="refentrytitle"/></strong></code>
      </a>
    </xsl:when>
    <xsl:otherwise>
      <a href="{concat($name, '.html')}">
        <code><strong><xsl:value-of select="refentrytitle"/></strong></code>
      </a>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:apply-templates select="manvolnum"/>
</xsl:template>

<xsl:template match="paramdef/parameter">
  <var><xsl:apply-templates/></var>
</xsl:template>

<xsl:template match="parameter">
  <code><var><xsl:apply-templates/></var></code>
</xsl:template>

<xsl:template match="constant | errorcode | type | filename">
  <code><xsl:apply-templates/></code>
</xsl:template>

<xsl:template match="programlisting//structname | programlisting//structfield">
  <strong><xsl:apply-templates/></strong>
</xsl:template>

<xsl:template match="structname | structfield">
  <code><strong><xsl:apply-templates/></strong></code>
</xsl:template>

<xsl:template match="firstterm">
  <dfn><xsl:apply-templates/></dfn>
</xsl:template>

<xsl:template match="emphasis[@role='bold'] | emphasis[@role='strong']">
  <strong><xsl:apply-templates/></strong>
</xsl:template>

<xsl:template match="emphasis">
  <em><xsl:apply-templates/></em>
</xsl:template>

<!-- description list -->

<xsl:template match="variablelist">
  <dl>
    <xsl:apply-templates/>
  </dl>
</xsl:template>

<xsl:template match="term">
  <dt><xsl:apply-templates/></dt>
</xsl:template>

<xsl:template match="listitem">
  <dd><xsl:apply-templates/></dd>
</xsl:template>

<!-- table -->

<xsl:template match="table | informaltable">
  <table align="center">
    <xsl:apply-templates/>
  </table>
</xsl:template>

<xsl:template match="row">
  <tr>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="thead/row/entry">
  <xsl:variable name="pos" select="count(preceding-sibling::entry)+1"/>
  <xsl:choose>
    <xsl:when test="@align">
      <th align="{@align}">
        <xsl:apply-templates/>
      </th>
    </xsl:when>
    <xsl:otherwise>
      <th align="{../../../colspec[$pos]/@align}">
        <xsl:apply-templates/>
      </th>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="entry">
  <xsl:variable name="pos" select="count(preceding-sibling::entry)+1"/>
  <xsl:choose>
    <xsl:when test="@align">
      <td align="{@align}">
        <xsl:apply-templates/>
      </td>
    </xsl:when>
    <xsl:otherwise>
      <td align="{../../../colspec[$pos]/@align}">
        <xsl:apply-templates/>
      </td>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- copyright -->
<xsl:template match="copyright">
  Copyright &#169; 
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
  <p class="center">
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="mrow">
  <xsl:choose>
    <xsl:when test="mtable">
      <table align="center"><tr>
        <xsl:for-each select="*">
          <td>
            <xsl:apply-templates select="."/>
          </td>
        </xsl:for-each>
      </tr></table>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="mtable">
  <table align="center">
    <xsl:apply-templates/>
  </table>
</xsl:template>

<xsl:template match="mtr">
  <tr>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="mtd">
  <td><xsl:apply-templates/></td>
</xsl:template>

<xsl:template match="mi">
  <xsl:choose>
    <xsl:when test="starts-with(text(), 'GL_')">
      <code><xsl:apply-templates/></code>
    </xsl:when>
    <xsl:otherwise>
      <em><xsl:apply-templates/></em>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="mo">
  <!-- spaces depend on op -->
  <xsl:if test="text()='&gt;'">
    <xsl:text> &gt; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&gt;='">
    <xsl:text> &#x2265; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&lt;'">
    <xsl:text> &lt; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&lt;='">
    <xsl:text> &#x2264; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&amp;='">
    <xsl:text> &amp; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='['">
    <xsl:text> [</xsl:text>
  </xsl:if>
  <xsl:if test="text()=']'">
    <xsl:text>] </xsl:text>
  </xsl:if>
  <xsl:if test="text()='('">
    <xsl:text>(</xsl:text>
  </xsl:if>
  <xsl:if test="text()=')'">
    <xsl:text>)</xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x2260;'">
    <xsl:text> &#x2260; </xsl:text>
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
    <xsl:choose>
      <xsl:when test="position()=1">
        <xsl:text> -</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> - </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:if test="text()='x'">
    <xsl:text> &#215; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='*'">
    <xsl:text> * </xsl:text>
  </xsl:if>
  <xsl:if test="text()=','">
    <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:if test="text()='max'">
    <xsl:text>max</xsl:text>
  </xsl:if>
  <xsl:if test="text()='min'">
    <xsl:text>min</xsl:text>
  </xsl:if>
  <xsl:if test="text()='cos'">
    <xsl:text>cos</xsl:text>
  </xsl:if>
  <xsl:if test="text()='sin'">
    <xsl:text>sin</xsl:text>
  </xsl:if>
  <xsl:if test="text()='log'">
    <xsl:text>log</xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x394;'">
    <xsl:text>&#x394;</xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x230a;'">
    <xsl:text>&#x230a;</xsl:text>
  </xsl:if>
  <xsl:if test="text()='&#x230b;'">
    <xsl:text>&#x230b;</xsl:text>
  </xsl:if>
  <xsl:if test="text()='|'">
    <xsl:text> | </xsl:text>
  </xsl:if>
  <xsl:if test="text()='||'">
    <xsl:text>||</xsl:text>
  </xsl:if>
  <xsl:if test="text()='~'">
    <xsl:text> ~ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='^'">
    <xsl:text> ^ </xsl:text>
  </xsl:if>
  <xsl:if test="text()='&amp;'">
    <xsl:text> &amp; </xsl:text>
  </xsl:if>
  <xsl:if test="text()='...'">
    <xsl:text> ... </xsl:text>
  </xsl:if>
  <xsl:if test="text()='M'">
    <xsl:text>M</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="msub">
  <xsl:apply-templates select="*[1]"/>
  <sub><xsl:apply-templates select="*[2]"/></sub>
</xsl:template>

<xsl:template match="msup">
  <xsl:apply-templates select="*[1]"/>
  <sup><xsl:apply-templates select="*[2]"/></sup>
</xsl:template>

<xsl:template match="mfrac">
  <sup>
    <xsl:choose>
      <xsl:when test="count(*[1]/mo) &gt; 0">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates select="*[1]"/>
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="*[1]"/>
      </xsl:otherwise>
    </xsl:choose>
  </sup>
  <xsl:text>/</xsl:text>
  <sub>
    <xsl:choose>
      <xsl:when test="count(*[2]/mo) &gt; 0">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates select="*[2]"/>
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="*[2]"/>
      </xsl:otherwise>
    </xsl:choose>
  </sub>
</xsl:template>

<xsl:template match="mfenced">
  <xsl:text> (</xsl:text>
  <xsl:for-each select="*">
    <xsl:if test="not(position()=1)">
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="."/>
  </xsl:for-each>
  <xsl:text>) </xsl:text>
</xsl:template>

<xsl:template match="replaceable">
  <em><xsl:apply-templates/></em>
</xsl:template>

</xsl:stylesheet>
