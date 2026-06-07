<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — рынок Хаоса: фикс пропажи купленных щитов после сейв/лоада.
    См. подробное объяснение в tor_armors.xslt. Щиты Хаоса (BaseGoods) → is_merchandise="true".
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Item[@id='tor_chaos_weapon_shield_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_weapon_shield_nurgle_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
