<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — рынок Хаоса: фикс пропажи купленной брони после сейв/лоада.

    ПРИЧИНА БАГА (2026-05-31): TOR помечает топовую броню Хаоса is_merchandise="false".
    Bannerlord сохраняет ссылки на предметы в сейве через таблицу объектов кампании,
    куда попадают ТОЛЬКО is_merchandise="true". Предмет с "false" существует лишь как
    шаблон экипировки войск (ре-деривируется из XML трупа при загрузке — поэтому войска
    гир не теряют). Если игрок купил/надел такой предмет — после загрузки ссылку
    восстановить не из чего → слот пустеет → «персонаж голый», из инвентаря пропадает.

    ФИКС: помечаем носибельную броню Воина Хаоса (money-sink из ChaosMarketCatalog.BaseGoods)
    как is_merchandise="true" → она становится настоящим товаром и переживает сейв/лоад.

    God-гир Меченых Богами (Кхорн/Нургл/Тзинч/Слаанеш/Chosen) НЕ трогаем — он остаётся
    "false" и убран из продажи (зарабатывается, не покупается). См. ChaosMarketStockingBehavior.

    Прецедент рабочего XSLT-патча атрибутов чужих (TOR_Armory) предметов: tor_rangedweapons.xslt.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Броня Воина Хаоса (не-god элита) — носибельный money-sink, продаётся в городах Хаоса -->
    <xsl:template match="Item[@id='tor_chaos_head_helm_warrior_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_body_armor_chaos_warrior_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_arm_bracer_chaos_warrior_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_leg_boots_chaos_warrior_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_chaos_shoulder_cape_chaos_warrior_001']/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
