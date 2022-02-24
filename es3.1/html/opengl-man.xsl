<?xml version='1.0'?>
<xsl:stylesheet
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml5/onechunk.xsl"/>

    <!-- These two options generate a file named ID.xhtml, where ID is the value
         of the document xml:id attribute, when processed with the chunking
         spreadsheet onechunk.xsl. See
         http://www.sagehill.net/docbookxsl/OneChunk.html -->
    <xsl:param name="use.id.as.filename">1</xsl:param>
    <xsl:param name="root.filename"></xsl:param>

    <!-- Generate consistent id attribute values if document is unchanged -->
    <xsl:param name="generate.consistent.ids" select="1"></xsl:param>

    <!-- html.stylesheet adds the specified stylesheet to the page headers.
         docbook.css.link removes the default docbook.css.
    -->
    <xsl:param name="html.stylesheet">opengl-man.css</xsl:param>
    <xsl:param name="docbook.css.link">0</xsl:param>
    <xsl:param name="docbook.css.source"></xsl:param>

    <!-- Indent HTML, which requires using onechunk.xsl instead of docbook.xsl -->
    <xsl:param name="chunker.output.indent">yes</xsl:param>

    <!-- Style parameters -->
    <xsl:param name="funcsynopsis.style">ansi</xsl:param>
    <xsl:param name="citerefentry.link" select="'1'"></xsl:param>
    <!-- Generate links in href= attributes for <citerefentry>. Note that in
         the XSL-NS stylesheets, using the Docbook namespace prefix on the
         select expressions is *required*.  Declaring xmlns:db at
         xsl:stylesheet scope causes other problems.
     -->
    <xsl:template xmlns:db="http://docbook.org/ns/docbook"
        name="generate.citerefentry.link">
        <xsl:value-of select="db:refentrytitle"/>
        <xsl:text>.xhtml</xsl:text>
    </xsl:template>

    <!-- Reasonable defaults for tables -->
    <xsl:param name="default.table.frame">all</xsl:param>
    <xsl:param name="table.borders.with.css" select="1"></xsl:param>
    <xsl:param name="table.cell.border.thickness">2px</xsl:param>
    <xsl:param name="table.frame.border.thickness">2px</xsl:param>

    <!-- Add MathJax <script> tags  to document <head> -->
    <!-- Now that the xmlns:db is declared above, it gets emitted on the
         <script> elements for unknown reasons
     -->
    <xsl:template name="user.head.content">
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
                MathML: {
                    extensions: ["content-mathml.js"]
                },
                tex2jax: {
                    inlineMath: [['$','$'], ['\\(','\\)']]
                }
            });
        </script>
        <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
        </script>
    </xsl:template>

    <!-- Add boilerplate to XHTML page title element describing which set of man pages this is -->
    <!-- This should really be an XSL parameter which could be set on the command line -->
    <xsl:template name="user.head.title">
        <xsl:param name="node" select="."/>
        <xsl:param name="title"/>

        <title>
            <xsl:copy-of select="$title"/>
            <xsl:text> - OpenGL ES 3.1 Reference Pages</xsl:text>
        </title>
    </xsl:template>

    <xsl:template match="*" mode="process.root">
        <xsl:variable name="doc" select="self::*"/>

        <xsl:call-template name="user.preroot"/>
        <xsl:call-template name="root.messages"/>
        <xsl:apply-templates select="."/>
    </xsl:template>

</xsl:stylesheet>
