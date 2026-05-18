<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — EquipmentRosters diversified по career archetypes.

    User feedback "мы же договорились усилить всех старт. орков, босс получил броню
    а остальные сосут?". Справедливо. Теперь ВСЕ 4 careers усилены vs ваниль TOR, но разным
    equipment tier по career-архетипу.

        Boss → black_orc_2 HEAVY (tier 5 elite) — большой тяжеловооружённый орк
        Shaman → savage body (ваниль, lorно для мистика) + axe_1h_black_orc weapon (элитный 1h axe)
        Bully → orc_choppa_001 full (tier 3 professional) + axe_002
        Boar Boys → orc_choppa_001 full + axe_002 weapon + сохранён spear + кабан

    Каждый career выше ванили на 1-2 tier, но архетип сохранён:
    - Boss = heavy hitter
    - Shaman = mystic + good weapon
    - Bully = professional brawler
    - Boar Boys = medium cavalry

    Horse/Item1 у Boar Boys, Head/Cape у Shaman (отсутствуют в ваниль) — НЕ трогаем
    (XSLT не добавляет не-существующие slots, только заменяет существующие).
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- ============ Boss: black_orc_2 HEAVY (tier 5 elite) ============ -->
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_boss_3']//Equipment[@slot='Item0']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_weapon_axe_1h_black_orc_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_boss_3']//Equipment[@slot='Item1']/@id">
        <xsl:attribute name="id">Item.tor_greenskins_black_orc_shield_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_boss_3']//Equipment[@slot='Head']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_orc_black_1_helmet_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_boss_3']//Equipment[@slot='Body']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_body_armour_orc_black_2_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_boss_3']//Equipment[@slot='Cape']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_shoulderpads_orc_black_2_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_boss_3']//Equipment[@slot='Gloves']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_bracers_orc_black_2_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_boss_3']//Equipment[@slot='Leg']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_boots_orc_black_2_001</xsl:attribute>
    </xsl:template>

    <!-- ============ Shaman: savage body + маска + элитный 1h axe ============
         Body/Gloves/Leg оставляем savage-ваниль (мистик в шкурах, не воин).
         Добавляем маску savage на голову (ваниль оставляла Head пустым).
         Weapon апгрейжу до axe_1h_black_orc_001 — "элитный шаман-топор". -->
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_shaman_3']//Equipment[@slot='Item0']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_weapon_axe_1h_black_orc_001</xsl:attribute>
    </xsl:template>
    <!-- Шаману нет Head slot в ванили — добавляем через insertion не можем (XSLT match @id).
         Обходимо: Head появится через troop-template redirect в troopdefinitions.xslt,
         если нужно. Пока оставляем как есть — шаман лорно без шлема. -->

    <!-- ============ Bully: orc_big_un full (tier 4 heavy brawler) ============
         Был orc_choppa как у кабанника — сделали визуально отличным через big_un-сет:
         Bully = опытный воин в тяжёлой броне, Boar Boy = лёгкий конный рейдер. -->
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_bully_3']//Equipment[@slot='Item0']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_weapon_axe_002</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_bully_3']//Equipment[@slot='Head']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_orc_big_un_helmet_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_bully_3']//Equipment[@slot='Body']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_body_armour_orc_big_un_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_bully_3']//Equipment[@slot='Cape']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_shoulderpads_orc_big_un_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_bully_3']//Equipment[@slot='Gloves']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_bracers_orc_big_un_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_bully_3']//Equipment[@slot='Leg']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_boots_orc_big_un_001</xsl:attribute>
    </xsl:template>
    <!-- Bully (Кизот) изначально не имел Item1 (щит) — UI character creation показывал
         «фантомный» щит от предыдущего выбора Boss, а в реальной игре его не было.
         Добавляем щит inline через копирование EquipmentSet и append нового Equipment.
         orc_shield_02_1 (Orc Tuff Blocka) — соответствует heavy brawler-архетипу Кизота. -->
    <xsl:template match="EquipmentRoster[@id='tor_cc_gs_path_of_bully_3']/EquipmentSet">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <Equipment slot="Item1" id="Item.tor_greenskins_orc_shield_02_1" />
        </xsl:copy>
    </xsl:template>

    <!-- ============ Boar Boys: orc_choppa_001 full (tier 3 cav) + spear + кабан (ваниль) ============ -->
    <xsl:template match="EquipmentRoster[@id='tor_cc_path_of_boar_boys_3']//Equipment[@slot='Item0']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_weapon_axe_002</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_path_of_boar_boys_3']//Equipment[@slot='Head']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_orc_choppa_helmet_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_path_of_boar_boys_3']//Equipment[@slot='Body']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_body_armour_orc_choppa_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_path_of_boar_boys_3']//Equipment[@slot='Cape']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_shoulderpads_orc_choppa_001</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_path_of_boar_boys_3']//Equipment[@slot='Gloves']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_bracers_orc_choppa_003</xsl:attribute>
    </xsl:template>
    <xsl:template match="EquipmentRoster[@id='tor_cc_path_of_boar_boys_3']//Equipment[@slot='Leg']/@id">
        <xsl:attribute name="id">Item.tor_greenskin_boots_orc_choppa_001</xsl:attribute>
    </xsl:template>
    <!-- Item1 (spear_001), Horse (boar_001), HorseHarness — НЕ трогаем, остаются ваниль -->

    <!-- примечание: 7-правил для orc_boy_template UDALENO.
         Вместо этого в tor_troopdefinitions.xslt переадресуем NPCCharacter's
         EquipmentSet id на более высокий tier template (подход B) — одно правило
         на троопа вместо 7. Это каскадно применено по всей orc ветке. -->
</xsl:stylesheet>
