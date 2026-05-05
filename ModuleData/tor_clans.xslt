<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — XSLT-patch: понижение clan tier у greenskin lord clans.

    ПРОБЛЕМА: AI orc-лорды ходят с 200+ войск в первый же день кампании. Это не от
    template (мы срезали), а от Clan.Tier → Party Size Cap формулы Bannerlord.
    Все 22 greenskin noble clans в TOR имеют tier="6" (максимум), дающий огромный cap.

    ФИКС: tier 6 → 4 для всех clans с default_party_template=greenskins_lordparty_template.
    Tier 4 даёт party size cap ~100-130 вместо 200-300. Также чуть уменьшает clan
    influence/renown — приемлемо для орочьих дикарей (tier 6 лорно странно для племён).

    Pattern ловит ВСЕ 22 greenskin faction-ы через их default_party_template — не
    зависит от naming convention, устойчиво к будущим добавлениям новых clans в TOR.

    Файл применяется к TOR-овскому tor_clans.xml по совпадению имени (Bannerlord XSLT
    convention). Рядом лежит пустой стаб tor_clans.xml.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- identity transform: копируем всё как есть -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- greenskin noble clans (все 22): tier 6 → 4, party size cap -30-40% -->
    <xsl:template match="Faction[@default_party_template='PartyTemplate.greenskins_lordparty_template']/@tier">
        <xsl:attribute name="tier">4</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
