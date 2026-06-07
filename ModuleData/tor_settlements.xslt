<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — XSLT-patch: нерф prosperity капитала Massif Choppas.

    ПРОБЛЕМА: town_MC1 (Massif Orcal, столица Massif Choppas) имеет
    prosperity=2800 — самый высокий среди orc-городов TOR. Это даёт +33%
    к экономике клана vs соседние orc-кингдомы (которые имеют 2100-2300).
    Большая экономика → больше gold/recruit → быстрая экспансия с самого
    старта → orc-snowball на которое жалуются игроки.

    ФИКС: prosperity 2800 → 2200 (на уровень среднего orc-города).

    Лорно: «недавние внутренние раздоры разорили Massif Orcal».
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- town_MC1 prosperity 2800 → 2200 -->
    <xsl:template match="Settlement[@id='town_MC1']/Components/Town/@prosperity">
        <xsl:attribute name="prosperity">2200</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
