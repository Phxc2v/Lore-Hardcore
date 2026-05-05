<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — XSLT point-patches для greenskin_bandit_template 
    + greenskins_lordparty_template ( NEW).

    Почему XSLT, а не entry replace:
    Оба template — C#-активные (TOR_Core.dll инжектит troops через AssimilationCampaignBehavior,
    Career читает lordparty при level-up Orc Boss). Full entry replace/ клал
    игру. XSLT меняет ТОЛЬКО атрибут max_value у существующих stacks — структура template
    (кол-во stacks, troop IDs, порядок, flags) остаётся 1:1 как у TOR, C#-инжекции работают.

    Политика тюнинга (консервативная):
    — Только уменьшаем max_value (никогда не увеличиваем в этой фазе).
    — Не трогаем min_value (отдельный XML-подузел, выше риск).
    — Не трогаем troop=, flags, порядок stacks.

    Оригинал TOR greenskin_bandit_template: raider 35, boss 10, arrer 20.
    Наши raider 14, boss 3, arrer 8.

    Оригинал TOR greenskins_lordparty_template (Warboss):
        orc_boy 20..36, orc_choppa 25..40, orc_arrer_boy 15..20, orc_arrer_boy_boss 20..30,
        orc_boss 4..10, orc_bigun 12..16, black_orc 8..20, black_orc_brute 8..20,
        black_orc_boss 2..4, black_orc_berzerka 2..15, orc_boar_boy 2..4,
        orc_boar_boy_bigun 2..4, goblin_wolf_rida 2..4, goblin_wolf_rida_archer 2..4
    Наши (уменьшаем макс. элитных/дальнобойных/охраны; массовка нетронута):
        arrer_boy_boss max 30 →15, orc_boss max 10 →5,
        black_orc max 20 →6, black_orc_brute max 20 →4, black_orc_berzerka max 15 →4.
    Эффект: Warboss-пати перестаёт быть "стеной Black Orc-ов" и становится
    массой рядовых орков с тонким ядром элиты. Баланс для player-середины.

    Файл применяется автоматически к TOR-овскому tor_partytemplates.xml по совпадению
    имени (Bannerlord XSLT convention). Рядом пустой стаб tor_partytemplates.xml.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- identity transform: копируем всё как есть -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- greenskin_bandit_template: уменьшить макс. численность шаек -->
    <xsl:template match="MBPartyTemplate[@id='greenskin_bandit_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_bandit_raider']/@max_value">
        <xsl:attribute name="max_value">14</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskin_bandit_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_bandit_raider_boss']/@max_value">
        <xsl:attribute name="max_value">3</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskin_bandit_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_bandit_raider_arrer']/@max_value">
        <xsl:attribute name="max_value">8</xsl:attribute>
    </xsl:template>

    <!-- greenskins_lordparty_template (Warboss): уменьшаем max элитных/дальнобойных -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_arrer_boy_boss']/@max_value">
        <xsl:attribute name="max_value">15</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_boss']/@max_value">
        <xsl:attribute name="max_value">5</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_black_orc']/@max_value">
        <xsl:attribute name="max_value">6</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_black_orc_brute']/@max_value">
        <xsl:attribute name="max_value">4</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_black_orc_berzerka']/@max_value">
        <xsl:attribute name="max_value">4</xsl:attribute>
    </xsl:template>

    <!--
        greenskins_lordparty_template: УМЕНЬШАЕМ массовку рядовых орков (пользователь жаловался
        на пати 200-250 на старте игры). Template total max был 188 → ~250 в реальном спавне;
        после этих правок total max = 124 → ~160-180 в спавне. Элита/кавалерия — уже срезаны/усилены.
        Все stacks ниже УЖЕ ЕСТЬ в оригинале TOR, только снижаем max_value.
    -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_boy']/@max_value">
        <xsl:attribute name="max_value">16</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_choppa']/@max_value">
        <xsl:attribute name="max_value">16</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_arrer_boy']/@max_value">
        <xsl:attribute name="max_value">10</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_bigun']/@max_value">
        <xsl:attribute name="max_value">6</xsl:attribute>
    </xsl:template>

    <!--
        greenskins_lordparty_template: УВЕЛИЧИВАЕМ кавалерию (гоблины на волках, орки на кабанах).
        Все stacks ниже УЖЕ ЕСТЬ в оригинале TOR (строки 394-397), мы только поднимаем max.
        Эффект: Warboss-пати перестаёт быть блоком пехоты + стеной Black Orc-ов, становится
        ордой рядовых орков + большой стаей гоблинов на волках и орков на кабанах.
        Лорно-правильно: "мусорная" кавалерия — классика орочьих орд.
    -->
    <!-- goblin mass x3 — хрупкие fodder, по лору Warhammer (гоблины — толпы мусора) -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_goblin_wolf_rida']/@max_value">
        <xsl:attribute name="max_value">25</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_goblin_wolf_rida_archer']/@max_value">
        <xsl:attribute name="max_value">25</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_boar_boy']/@max_value">
        <xsl:attribute name="max_value">8</xsl:attribute>
    </xsl:template>

    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_boar_boy_bigun']/@max_value">
        <xsl:attribute name="max_value">6</xsl:attribute>
    </xsl:template>

    <!--
        greenskins_militia_template: уменьшаем абсолютный размер защиты (при стат-бусте орков даже рядовые будут сильнее; 19-25 орков в деревне будут непосильны).
        Original: orc_boy min=8 max=8, goblin_archer min=6 max=6 (sum=14 → spawn ~20-30).
        Наш orc_boy max=4 (было 8), goblin_archer max=8 (было 6 в ваниле, потом 15).
        New sum: 4+8=12 → spawn ~15-20 (вместо 40). Ratio: orc 33% / goblin 67% — гоблины
        по-прежнему в большинстве (лорно правильно), но абсолютное кол-во адекватно раннему
        challenge. min_value не трогаем.
    -->
    <!-- в защите орочьих деревень обычные орки-жители, не пацаны-воины.
         Заменяем troop-ID у существующего stack — это НЕ добавление нового stack (правило
         feedback_no_new_troops_in_existing_templates соблюдено). Меняется @troop у уже
         существующего stack orc_boy. -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_militia_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_boy']/@troop">
        <xsl:attribute name="troop">NPCCharacter.tor_gs_orc</xsl:attribute>
    </xsl:template>

    <!-- max_value для этого stack поднимаем до 6 (больше обычных орков в защите деревни) -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_militia_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_boy']/@max_value">
        <xsl:attribute name="max_value">6</xsl:attribute>
    </xsl:template>

    <!-- Меньше гоблин-стрелков в деревнях: было 24, стало 12 (баланс vs орки) -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_militia_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_goblin_archer']/@max_value">
        <xsl:attribute name="max_value">12</xsl:attribute>
    </xsl:template>

    <!-- ОТКАТ эксперимента с добавлением goblin_stikka stack в militia.
         Подтверждено user test: игра вылетает. Правило "не добавлять новые stack в
         existing TOR partyTemplate" теперь подтверждено и для militia-template, не только
         для lordparty. Обновлено в memory feedback_no_new_troops_in_existing_templates. -->
    <!-- (goblin_stikka stack removed — вернули ваниль militia structure: orc_boy + goblin_archer only) -->

    <!--
        ========================================================================
        Пропорции партии Варбосса приведены к цели ТЗ §3.8.8.
        Цель: 40% гоблины-на-волках / 25% орки-пацаны / 15% здоровяки /
              10% чоппы+кабанники / 5% чёрные орки / остальное — элита.
        НЕ добавляем новых troop_id (prevent crash), только правим max у существующих.
        Оставшиеся шаманы/тролли в шаблоне отсутствуют — добавить нельзя,
        без краша. Суммарно всё равно получится «орда с ядром».
        ========================================================================
    -->

    <!-- Гоблины-на-волках: 40% доля → max 40 (суммарно до 80 на партию с 2 stacks) -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_goblin_wolf_rida']/@min_value">
        <xsl:attribute name="min_value">10</xsl:attribute>
    </xsl:template>
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_goblin_wolf_rida_archer']/@min_value">
        <xsl:attribute name="min_value">10</xsl:attribute>
    </xsl:template>

    <!-- Орки-пацаны: массовка пехоты, 25% → max 30 -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_boy']/@max_value" priority="2">
        <xsl:attribute name="max_value">30</xsl:attribute>
    </xsl:template>

    <!-- Здоровяки (Big'Un): 15% → max 15 (было 6) -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_orc_bigun']/@max_value" priority="2">
        <xsl:attribute name="max_value">15</xsl:attribute>
    </xsl:template>

    <!-- Чоппы + кабанники: 10% → оставляем 16 + 8 (итого max ~24) -->
    <!-- уже задано выше, не трогаем -->

    <!-- Чёрные орки всех типов: 5% суммарно — уменьшаем, было суммарно 18 -->
    <!-- black_orc max=6, black_orc_brute max=4, black_orc_boss max=4, berzerka max=4 → итого 18 -->
    <!-- Хотим ~10 суммарно. Понизим все кроме berzerka (берсерк — зрелищная элита). -->
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_black_orc']/@max_value" priority="2">
        <xsl:attribute name="max_value">4</xsl:attribute>
    </xsl:template>
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_black_orc_brute']/@max_value" priority="2">
        <xsl:attribute name="max_value">3</xsl:attribute>
    </xsl:template>
    <xsl:template match="MBPartyTemplate[@id='greenskins_lordparty_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_black_orc_boss']/@max_value" priority="2">
        <xsl:attribute name="max_value">2</xsl:attribute>
    </xsl:template>
    <!-- berzerka 4 оставляем -->

    <!-- тролли очень сильные, ограничиваем троль-партии до 1-2 штук
         (было 1..4). Меньше встреч с "армия из 4 троллей". -->
    <xsl:template match="MBPartyTemplate[@id='troll_party_template']/stacks/PartyTemplateStack[@troop='NPCCharacter.tor_gs_trolls']/@max_value">
        <xsl:attribute name="max_value">2</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
