<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — ОРОЧЬИ ЛУКИ "криво стреляют, больно бьют".

    Философия: орки плохо целятся, стрелы летят низко/далеко падают,
    но если попадут — наносят большой урон (конец стрелы как копьё).

    Исходные значения (ваниль TOR):
      Orc Shoota (bow_001): missile_speed 70, accuracy 69, thrust_damage 60
      Orc Scrap Shoota (bow_002): missile_speed 77, accuracy 72, thrust_damage 70
      Orc Boss Shoota (bow_003): missile_speed 85, accuracy 75, thrust_damage 80

    Наши новые значения:
      Orc Shoota: missile_speed 45 (-35%), accuracy 50 (-28%), thrust_damage 75 (+25%)
      Orc Scrap Shoota: missile_speed 50 (-35%), accuracy 55 (-24%), thrust_damage 85 (+21%)
      Orc Boss Shoota: missile_speed 60 (-30%), accuracy 65 (-13%), thrust_damage 95 (+19%)

    Для сравнения — эльфийские/имперские луки ваниль: missile_speed 75-92,
    accuracy 85-100. Орки теперь ощутимо хуже целятся и стреляют дальше но слабее.

    Визуальный эффект для игрока:
    - стрелы летят заметной дугой (parabolic trajectory due to low speed)
    - большая часть стрел мажет (низкий accuracy + низкий Bow skill троопа)
    - попадания реально опасны (+20-25% damage сверху)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- ============ Orc Shoota (базовый лук орков) ============ -->
    <xsl:template match="Item[@id='tor_greenskin_bow_001']/ItemComponent/Weapon/@missile_speed">
        <xsl:attribute name="missile_speed">45</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_greenskin_bow_001']/ItemComponent/Weapon/@accuracy">
        <xsl:attribute name="accuracy">50</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_greenskin_bow_001']/ItemComponent/Weapon/@thrust_damage">
        <xsl:attribute name="thrust_damage">75</xsl:attribute>
    </xsl:template>

    <!-- ============ Orc Scrap Shoota (средний) ============ -->
    <xsl:template match="Item[@id='tor_greenskin_bow_002']/ItemComponent/Weapon/@missile_speed">
        <xsl:attribute name="missile_speed">50</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_greenskin_bow_002']/ItemComponent/Weapon/@accuracy">
        <xsl:attribute name="accuracy">55</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_greenskin_bow_002']/ItemComponent/Weapon/@thrust_damage">
        <xsl:attribute name="thrust_damage">85</xsl:attribute>
    </xsl:template>

    <!-- ============ Orc Boss Shoota (элитный, у arrer_boy_boss) ============ -->
    <xsl:template match="Item[@id='tor_greenskin_bow_003']/ItemComponent/Weapon/@missile_speed">
        <xsl:attribute name="missile_speed">60</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_greenskin_bow_003']/ItemComponent/Weapon/@accuracy">
        <xsl:attribute name="accuracy">65</xsl:attribute>
    </xsl:template>
    <xsl:template match="Item[@id='tor_greenskin_bow_003']/ItemComponent/Weapon/@thrust_damage">
        <xsl:attribute name="thrust_damage">95</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
