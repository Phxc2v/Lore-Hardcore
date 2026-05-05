<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — возврат basic_troop к orc_boy (ваниль TOR).

    Причина: пользователь feedback "убрать обычных орков из города".
    Bannerlord `basic_troop` — per-culture, не per-settlement-type. Разделить
    найм "деревня=обычные, город=пацаны" через pure-XML нельзя (только Harmony).

    Решение: вернуть basic_troop и melee_militia_troop к `tor_gs_orc_boy` (ваниль).
    Обычный орк `tor_gs_orc` остаётся как:
      - villager NPC (ходящий персонаж в деревне)
      - в villager-party template (караваны villager-ов)
    Но не нанимается через notable / не в militia.

    Бонус: весь найм = сразу пацан → игрок получает сильного юнита (HP 120,
    skills 120, equipment tier 3 chain mail + battle axe). Баланс улучшается.

    Black Orc убран из elite_basic_troop (он должен быть гвардией).
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- ОТКАТ возвращаем tor_gs_orc как basic_troop
         по просьбе пользователя ("в деревнях должны быть обычные орки").
         Ограничение: basic_troop — per-culture, значит в городе тоже будут
         обычные орки. Разделить village/town recruit можно только через Harmony. -->
    <xsl:template match="Culture[@id='aserai']/@basic_troop">
        <xsl:attribute name="basic_troop">NPCCharacter.tor_gs_orc</xsl:attribute>
    </xsl:template>
    <xsl:template match="Culture[@id='aserai']/@melee_militia_troop">
        <xsl:attribute name="melee_militia_troop">NPCCharacter.tor_gs_orc</xsl:attribute>
    </xsl:template>

    <!-- Black Orc убран из elite_basic_troop (он должен быть гвардией). -->
    <xsl:template match="Culture[@id='aserai']/@elite_basic_troop">
        <xsl:attribute name="elite_basic_troop">NPCCharacter.tor_gs_orc_bigun</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
