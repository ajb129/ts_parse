<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" omit-xml-declaration="yes" indent="no" encoding="UTF-8"/>

  <xsl:template match="@* | node()">
    <xsl:apply-templates select="@* | node()"/>
  </xsl:template>

  <xsl:template match="s">
    <xsl:apply-templates select="node()"/>
    <xsl:text>EOS&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="word">
    <xsl:value-of select="."/>
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="../lemma/."/>
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="../NER/."/>
    <xsl:variable name="id">
      <xsl:value-of select="../@id"/>
    </xsl:variable>

    <xsl:for-each select="../../../dependencies[@type='basic-dependencies']/dep/dependent[@idx=$id]">
      <xsl:text>&#x9;</xsl:text>
      <xsl:value-of select="../@type"/>
    </xsl:for-each>

    <xsl:for-each select="../../../dependencies[@type='basic-dependencies']/dep[@type='cop']/governor[@idx=$id]">
      <xsl:text>&#x9;prd</xsl:text>
    </xsl:for-each>

    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="parse">
    <xsl:text>-------------------&#xa;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&#xa;&#xa;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
