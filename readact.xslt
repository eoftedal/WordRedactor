<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" mc:Ignorable="w14 wp14"
xmlns:str="http://exslt.org/strings"
                extension-element-prefixes="str">
  <xsl:output method="xml" indent="no"/>
  <xsl:strip-space elements="*"/>



 <xsl:template match="node()|@*">
     <xsl:copy>
       <xsl:apply-templates select="node()|@*"/>
     </xsl:copy>
 </xsl:template>

 <xsl:template match="w:t[preceding-sibling::node()[name()='w:rPr'][child::node()[name()='w:highlight' and @w:val='magenta']]]/text()">
 	<xsl:variable name="valueLength" select="string-length()"/>
    <xsl:value-of select="str:padding($valueLength, '*=* ')"/>
 </xsl:template>

 <xsl:template match="w:instrText[preceding-sibling::node()[name()='w:rPr'][child::node()[name()='w:highlight' and @w:val='magenta']]]/text()">
 </xsl:template>


 <xsl:template match="w:rStyle[@w:val='Hyperlink'][following-sibling::node()[name()='w:highlight' and @w:val='magenta']]">
 	<!-- delete -->
 </xsl:template>

<xsl:template match="@w:val[. = 'magenta'][parent::node()[name()='w:highlight']]">
	<xsl:attribute name="w:val">
		<xsl:text>black</xsl:text>
	</xsl:attribute>
 </xsl:template>

 <xsl:template match="w:rPrChange|w:commentRangeStart|w:commentRangeEnd|w:commentReference">
 	<!-- delete -->
 </xsl:template>




</xsl:stylesheet>