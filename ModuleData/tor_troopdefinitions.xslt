<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — CASCADE BUFF +40% orc-tree.
    User feedback: "35 брет-ополченцев T2 вынесли 17 орков/гоблинов. Усилить орков на 40%."
    См. docs/Balance_Matrix.md (обновлено под curve).

    Orc curve после буфа:
        T0 orc (villager) = skills 120 (level21), level 26, Endurance 180
        T1 orc_boy/thug = skills 150 (level26), level 31, Endurance 280
        T2 expert_thug = skills 180 (level31), level 16, Endurance 240
        T3 choppa/arrer_boy/boar_boy = skills 180 (level31), level 36, Endurance 300
        T4 arrer_boss/bully/master_thug = skills 210 (level36), level 41, Endurance 360
        T5 bigun/boar_boy_bigun/bully_bigun = skills 240 (level41), level 46, Endurance 360
        T6 orc_boss = skills 280 (level46, max), level 46 (max), Endurance 380
        T6 black_orc = skills 240 (level41), level 41, Endurance 380
        T7 black_orc_brute = skills 280 (level46, max), level 46, Endurance 400
        T8 black_orc_boss/berzerka = skills 280 (level46, max), level 46, Endurance 400

    npcCost +40% на все рекрутируемые troops (компенсация усиления).

    Каскад: каждый upgrade >= родителя по skill и level.

    Goblin — не трогаем (они массовка-мясо по лору, буфится только через равновесие).
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- ============ level bump ( recruitment cost) ============ -->
    <!-- user feedback "17 бандитов разъебали 16 орков, в старой сборке
         было норм". Обычные орки слабые против человеческих bandits
         (у них кольчуги + топоры, у нашего орка тряпки + палка).
         Pure HP буф через level: 16 → 21 (HP ~85 → ~100). Gap к orc_boy(26)=5.
         Skills остаются 90 (пользовательское требование).

         skill_template level21 → level16 по просьбе "около 90".
         level 11→16, skill_template→level21 (откачено).
         level 6→11, skill_template→level16 (90), Endurance 100→130. -->
    <!-- level 21→26 (+5 HP), skill_template level16→level21 (90→120, +33%) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc']/@level">
        <xsl:attribute name="level">26</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level21</xsl:attribute>
    </xsl:template>

    <!-- CASCADE LEVEL BUMP +5 ПО ВСЕЙ ОРОЧЬЕЙ ВЕТКЕ (HP-буф, без трогания skills).
         Пользовательский feedback: "стало лучше но недостаточно, крестьяне мочат орков".
         Pure HP bump через level (не через Endurance-гипотезу) — гарантированный буф.
         Также вернули gap orc→orc_boy обратно к 10 (было 5) чтобы upgrade cost
         был ~150g как просил пользователь (формула: 7×gap + 0.036×npcCost_diff). (прежняя итерация): level cascade до max 46 у orc_boss. Сейчас
         сдвигаем всю ветку +5 (кроме orc_boss = уже max). Чёрные орки не трогаем. -->
    <!-- +5 level для всей ветки T1-T5 (HP-буф через level). T6 уже на max. -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boy']/@level">
        <xsl:attribute name="level">31</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_choppa']/@level">
        <xsl:attribute name="level">36</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boar_boy']/@level">
        <xsl:attribute name="level">36</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_arrer_boy']/@level">
        <xsl:attribute name="level">36</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_arrer_boy_boss']/@level">
        <xsl:attribute name="level">41</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully']/@level">
        <xsl:attribute name="level">41</xsl:attribute>
    </xsl:template>
    <!-- HOTFIX: bigun level 46→41, т.к. upgrade_target orc_boss level 46,
         gap=0 вызывал INT_DIVIDE_BY_ZERO при входе в деревню (повтор бага). -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bigun']/@level">
        <xsl:attribute name="level">41</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boar_boy_bigun']/@level">
        <xsl:attribute name="level">46</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully_bigun']/@level">
        <xsl:attribute name="level">46</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boss']/@level">
        <xsl:attribute name="level">46</xsl:attribute>
    </xsl:template>
    <!-- thug/expert_thug/master_thug level bump. Ваниль 6/11/21 → 16/21/41 -->
    <xsl:template match="NPCCharacter[@id='tor_gs_thug']/@level">
        <xsl:attribute name="level">16</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_expert_thug']/@level">
        <xsl:attribute name="level">21</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_master_thug']/@level">
        <xsl:attribute name="level">41</xsl:attribute>
    </xsl:template>
    <!-- FIX: gap=0 между black_orc(46) → brute(46) → boss/berzerka(46) вызвал INT_DIVIDE_BY_ZERO при апгрейд-XP-формуле.
         Делаем ступени: black_orc 36 → brute 41 → boss/berzerka 46 (gap 5). -->
    <!-- HOTFIX: black_orc (41→36) и brute (46→41) для gap 5 между
         black_orc→brute→boss/berzerka. В было brute(46)→boss/berzerka(46)
         gap=0 → INT_DIVIDE_BY_ZERO при входе в деревню (повтор бага). -->
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc']/@level">
        <xsl:attribute name="level">36</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc_brute']/@level">
        <xsl:attribute name="level">41</xsl:attribute>
    </xsl:template>
    <!-- black_orc_boss, berzerka уже level 46 в ванили, не трогаем -->

    <!-- +20%: цена найма обычного орка 300з→360з (npcCost 1200→1440). -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">1800</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="180" /></skills>
        </xsl:copy>
    </xsl:template>

    <!-- убираем is_basic_troop у black_orc (чтобы он не спавнился как волонтёр).
         Black Orc должен быть доступен только через ветку апгрейдов или особые события.
         XSLT удаляет атрибут через match + пустой template (не копирует). -->
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc']/@is_basic_troop"/>

    <!-- ОТКАТ level cut гоблинов.
         Гипотеза: level изменение могло сломать engine spawn pipeline
         (upgrade/tier resolve при spawn partyTemplates в дальней деревне).
         Правила удалены → идентичная ваниль TOR для level гоблинов.
         HP-фикс для гоблинов ждёт другого подхода (armor reduction, equipment nerf). -->
    <!-- (no level overrides for goblins — reverted to vanilla) -->

    <!-- ============ SKILL TEMPLATE CASCADE  ============ -->

    <!-- +1 ступень шкалы по всей ветке до T5. Элита (T6+) ограничена max-шкалой. -->
    <!-- T1 orc_boy/thug → level26 (skills 150) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boy']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level26</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_thug']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level26</xsl:attribute>
    </xsl:template>

    <!-- T2 expert_thug → level31 (180) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_expert_thug']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level31</xsl:attribute>
    </xsl:template>

    <!-- T3 line troopers → level31 (180) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_choppa']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level31</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_arrer_boy']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level31</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boar_boy']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level31</xsl:attribute>
    </xsl:template>
    <!-- bandit_raider skill_template ОТКАЧЕН — бандиты должны быть
         слабее клановых орков (по ТЗ: "бродяги, не клановая элита"). -->
    <!-- <xsl:template match="NPCCharacter[@id='tor_gs_bandit_raider']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level26</xsl:attribute>
    </xsl:template> -->


    <!-- T4 heavy → level36 (210) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_arrer_boy_boss']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level36</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level36</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_master_thug']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level36</xsl:attribute>
    </xsl:template>
    <!-- bandit_raider_arrer ОТКАЧЕН -->
    <!-- <xsl:template match="NPCCharacter[@id='tor_gs_bandit_raider_arrer']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level31</xsl:attribute>
    </xsl:template> -->


    <!-- T5 veteran → level41 (240) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bigun']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level41</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boar_boy_bigun']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level41</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully_bigun']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level41</xsl:attribute>
    </xsl:template>
    <!-- bandit_raider_boss ОТКАЧЕН -->
    <!-- <xsl:template match="NPCCharacter[@id='tor_gs_bandit_raider_boss']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level36</xsl:attribute>
    </xsl:template> -->


    <!-- T6 command → level46 (280, max) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boss']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level46</xsl:attribute>
    </xsl:template>
    <!-- black_orc skill level36→level41 (210→240), brute level41→level46 (240→280, max). -->
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level41</xsl:attribute>
    </xsl:template>

    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc_brute']/@skill_template">
        <xsl:attribute name="skill_template">SkillSet.tor_skills_level46</xsl:attribute>
    </xsl:template>

    <!-- T8 black_orc_boss/berzerka ваниль уже level46, не трогаем -->

    <!-- ============ ENDURANCE (HP-буф) — orcs, goblins ============ -->
    <!-- добавляем npcCost attribute всем орочьим троопам для удорожания
         найма и апгрейда. Ваниль orc_boy cost рассчитывается движком ~15-30g.
         Устанавливаем явно, чтобы апгрейды дорожали соразмерно tier-у.
         tor_gs_orc (villager) не трогаем — он должен оставаться дешёвым рекрутом. -->
    <!-- orc_boy npcCost 1200 → 3000. Восстанавливаем разумный upgrade
         cost. Формула: 7×gap(10) + 0.036×(3000-800=2200) = 70+79.2 = ~150g ✓
         Найм orc_boy напрямую: 3000 × 0.25 = ~750g. Цепочка orc+upgrade = 350g
         (~47% от прямого найма) — дешевле, чем хотел пользователь (30-35%),
         но улучшение vs. Полностью получить 30-35% скидку нельзя
         без изменения движка (Bannerlord upgrade formula favours cascade). -->
    <!-- Endurance +30-40%, npcCost +40% по всей ветке (рекрутируемые и апгрейды). -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boy']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">6300</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="280" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_choppa']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">525</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="300" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_arrer_boy']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">525</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="300" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boar_boy']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">630</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="300" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_arrer_boy_boss']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">1050</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="360" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boar_boy_bigun']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">10000</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="360" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bigun']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">10000</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="360" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boss']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">12500</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="380" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">11250</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="380" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc_brute']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">13750</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="400" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc_boss']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">16250</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="400" /></skills>
        </xsl:copy>
    </xsl:template>
    <!-- Berzerka — стеклянная пушка (бьёт больно, но живёт меньше обычного Black Orc).
         Endurance 400 → 500 (HP подрос), npcCost 16250 → 22000 (дорогая элита),
         +30% damage через Harmony special-case в OrcBattleDamagePatch.
         Armor −10: через отдельный XSLT на equipment_sets berzerka_template. -->
    <xsl:template match="NPCCharacter[@id='tor_gs_black_orc_berzerka']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">22000</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="500" /></skills>
        </xsl:copy>
    </xsl:template>

    <!-- Тролль — огромный живучий монстр. Endurance 800, npcCost высокий.
         Harmony patches (HP +40%, damage +35%/−30%, skill +30%) уже действуют на
         race="troll" через prefix tor_gs_ в IsOrc. Итог: ~750 HP, весомый DPS. -->
    <xsl:template match="NPCCharacter[@id='tor_gs_trolls']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:attribute name="npcCost">30000</xsl:attribute>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="800" /></skills>
        </xsl:copy>
    </xsl:template>
    <!-- bully/thug/master_thug получают Endurance (ранее были без). Скилы bully/master_thug обновлены выше. -->
    <xsl:template match="NPCCharacter[@id='tor_gs_thug']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="180" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_expert_thug']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="240" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_master_thug']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="360" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="360" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully_bigun']">
        <xsl:copy><xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="360" /></skills>
        </xsl:copy>
    </xsl:template>

    <!-- GOBLIN fragility ( сохранено) -->
    <!-- Skirmisher формация откачена по фидбеку 2026-04-27: пользователь хочет
         гоблинов В ОДНОЙ формации с орками, но быстрее. Решено через Athletics
         buff (+60%) и увеличенный MaxSpeedMultiplier 1.50 в GoblinSpeedPatch +
         GoblinAthleticsPatch. В одной формации скорость лимитирована, но Athletics
         даёт гоблину преимущество в моменты charge/Pursue/несформированного движения. -->
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="15" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_stikka']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="20" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_archer']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="20" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_wolf_rida']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="25" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_wolf_rida_archer']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="25" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_nasty_skulker']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="30" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_boss']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="50" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_wolf_rida_boss']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="50" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_beast_prodda']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="30" /></skills>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_goblin_stone_slugga']">
        <xsl:copy><xsl:apply-templates select="@*"/><xsl:apply-templates select="node()"/>
            <skills><skill id="Endurance" value="25" /></skills>
        </xsl:copy>
    </xsl:template>

    <!-- ============ CASCADE EQUIPMENT BUFF по всей orc-ветке ============
         Правило "меняешь ветку — меняй всю" применено к equipment.
         Переадресуем NPCCharacter's EquipmentSet id на более высокий-tier template.
         Каждый tier troop получает equipment тот, что у ваниль +1-2 tier выше.
         ВАЖНО: правило target — все <EquipmentSet> (battle + civilian), применяется
         ко всем `id` attributes через `//EquipmentSet/@id`.

         ORC INFANTRY LINE (buff +1-2 tier):
           orc_boy (t1 orc_boyz) → orc_choppa_template (t3)
           orc_choppa (t3 choppa) → orc_bigun_template (t5)
           orc_bigun (t5 bigun) → orc_boss_template (t6)
           orc_boss (t6 orc_boss) → black_orc_template (t7)
           black_orc (t7 black_orc) → black_orc_brute_template (t8)
           black_orc_brute (t8 brute) → black_orc_boss_template (max)
           black_orc_boss / berzerka → stay (max)

         CAVALRY:
           orc_boar_boy → orc_boar_boy_bigun_template (t3→t5)
           orc_boar_boy_bigun → vanilla (НЕ переадресуем — pseudo-upgrade на orc_boss
                                ломал визуал, кабанник терял кабана)

         RANGED:
           orc_arrer_boy → orc_arrer_boy_boss_template (t3→t4)
           orc_arrer_boy_boss → orc_bigun_template (t4→t5)

         CARAVAN/GANG:
           orc_bully → orc_bully_bigun_template (t4→t5)
           orc_bully_bigun → orc_boss_template (t5→t6)
           thug → orc_choppa_template (t1→t3)

         BANDIT:
           bandit_raider → orc_choppa_template (buff vs own bandit_raider template)
           bandit_raider_arrer → orc_arrer_boy_boss_template
           bandit_raider_boss → orc_bigun_template

         GOBLINS — НЕ трогаем (они должны остаться fragile по лору).
    -->

    <!-- orc infantry ветка -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boy']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_choppa_template</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_choppa']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_bigun_template</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bigun']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_boss_template</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boss']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_black_orc_template</xsl:attribute>
    </xsl:template>
    <!-- ОТКАТ переадресаций: ваниль TOR уже имеет визуальную прогрессию
         ветке чёрных орков: black_orc (black_2) → brute (black_3) → boss/berzerka (black_4).
         Наша переадресация ломала это: brute и boss оказывались в одном black_4.
         Оставляем эти 2 тропа на ванильных templates — апгрейд между рангами теперь виден. -->
    <!-- black_orc — ваниль tor_gs_black_orc_template (black_2 armor) -->
    <!-- brute — ваниль tor_gs_black_orc_brute_template (black_3 armor) -->
    <!-- boss — ваниль (black_4 armor) -->
    <!-- berzerka — ваниль (black_4 armor + 2h greataxe) -->

    <!-- cavalry (boar boys) -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_boar_boy']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_boar_boy_bigun_template</xsl:attribute>
    </xsl:template>
    <!-- ОТКАТ переадресации tor_gs_orc_boar_boy_bigun → tor_gs_orc_boss_template:
         она ломала визуал — кабанник-большой терял кабана и появлялся пешим в броне
         orc_boss. Жалоба: «кабанница апгрейдится на обычного пешего босса».
         Оставляем vanilla tor_gs_orc_boar_boy_bigun_template (кабан + орочья броня
         T4-T5). -->
    <!-- (бывший override на tor_gs_orc_boar_boy_bigun удалён) -->

    <!-- ranged (arrer boys).
         v0.1.0.34: ОТКАТ переадресации arrer_boy → boss_template.
         Жалоба пользователя: «Лучник орков апгрейдится в такого же лучника
         (шмотки такие же)». Причина — у arrer_boy и arrer_boy_boss был ОДИН
         и тот же EquipmentSet (boss_template), визуальная прогрессия терялась.
         Возвращаем оба на vanilla:
           arrer_boy       → vanilla tor_gs_orc_arrer_boy_template (bow_001 + лёгкая броня)
           arrer_boy_boss  → vanilla tor_gs_orc_arrer_boy_boss_template (bow_002 + капюшон/тяжёлая броня)
         Апгрейд теперь визуально виден. -->
    <!-- (бывший override arrer_boy → boss_template удалён) -->
    <!-- arrer_boy_boss → vanilla EquipmentSet (с луком). Не override. -->

    <!-- caravan guard / gang -->
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_bully_bigun_template</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_orc_bully_bigun']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_boss_template</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_thug']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_choppa_template</xsl:attribute>
    </xsl:template>

    <!-- bandit equipment CASCADE ОТКАЧЕН — бандиты = бродяги,
         не клановые элиты. Возвращаем к ванильным bandit templates. -->
    <!-- <xsl:template match="NPCCharacter[@id='tor_gs_bandit_raider']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_choppa_template</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_bandit_raider_arrer']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_arrer_boy_boss_template</xsl:attribute>
    </xsl:template>
    <xsl:template match="NPCCharacter[@id='tor_gs_bandit_raider_boss']/Equipments/EquipmentSet/@id">
        <xsl:attribute name="id">tor_gs_orc_bigun_template</xsl:attribute>
    </xsl:template> -->
</xsl:stylesheet>
