<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — tor_npccharacters: identity-transform (НИЧЕГО не удаляем).

    ⚠ ИСТОРИЯ / ПОЧЕМУ ПУСТО:
    Раньше этот XSLT удалял 14 именованных orc-лордов (Massif Choppas / Crooked Eye /
    Red Eye) — попытка срезать размер орочьих орд по жалобе клиента 2026-05-06
    («22 лорда = одна Army ~3700 орков»).

    Это вызывало КРАШ на старте новой игры (CrashDoctor a839bc6a, 2026-06-07):
    мы удаляли NPCCharacter, но в TOR `tor_heroes.xml` оставались <Hero id="...">
    на те же ID → шаблон=null → битые герои с null Culture/FirstName →
    NullReferenceException в NameGenerator.CalculateNameScore при генерации имён
    на OnNewGameCreated (HeroSpawnCampaignBehavior.SpawnMinorFactionHeroes).
    На загрузке сейва не воспроизводилось (OnNewGameCreated не зовётся), потому
    вылезло только когда начали тестить НОВУЮ игру.

    РЕШЕНИЕ: удаление лордов убрано полностью. Размер орочьих армий и так режется
    чистым способом — понижением tier 6→4 в tor_clans.xslt (party size cap -30-40%).
    Если орды снова будут великоваты — делать рантайм-лимит на число лордов в Army,
    а НЕ удалять предопределённых героев из данных TOR (хрупко, dangling <Hero>).

    Файл оставлен как identity-transform: нужен одноимённый стаб-XML
    (tor_npccharacters.xml) + регистрация в SubModule.xml, удалять конвейер не стали.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- identity transform: копируем всё как есть, ничего не трогаем -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
