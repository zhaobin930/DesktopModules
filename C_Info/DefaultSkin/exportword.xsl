<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="no"/>
	<xsl:template match="Content">
		<html>
			<head>
				<meta content="text/html" http-equiv="Content-Type"></meta>				
			</head>
			<body>
				<xsl:apply-templates select="article" />					
			</body>
		</html>
	</xsl:template>
	<xsl:template match="article">		
			<h1 style="font-family: 楷体; font-size: large; font-weight: bold;text-align:center;">
					<xsl:value-of select="Title"/>				
			</h1>
			<div align="right" style="font-family: 楷体;font-size: small;">
				作者:<xsl:value-of select="Author"/>				
			</div>			
			<div>
				<xsl:value-of disable-output-escaping="yes" select="Content"/>
				<xsl:apply-templates select="pages/page" />
			</div>		
	</xsl:template>
	<xsl:template match="page">
			<p>
				<xsl:value-of disable-output-escaping="yes" select="Content"/>				
			</p>
	</xsl:template>		
</xsl:stylesheet>