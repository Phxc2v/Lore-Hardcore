<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — рынок Хаоса: фикс пропажи купленного оружия после сейв/лоада.
    См. подробное объяснение причины в tor_armors.xslt (is_merchandise="false" → не сейвится).

    ФИКС: оружие Хаоса из ChaosMarketCatalog.BaseGoods → is_merchandise="true",
    чтобы переживало сейв/лоад. god-оружие из продажи убрано (не трогаем тут).
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Item[@id='tor_chaos_weapon_sword_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_2h_weapon_warrior_greataxe_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_weapon_thaxe_nurgle_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_weapon_mace_flail_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_weapon_mace_nurgle_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_weapon_metal_ud_lance_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
