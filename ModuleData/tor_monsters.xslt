<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — Monster speed overrides.

    Корень бага «гоблины не быстрее орков в одной формации»: Formation.CacheMovementSpeedOfUnits
    использует agent.WalkSpeedCached = Monster.WalkingSpeedLimit (НЕ AgentDrivenProperties).
    У TOR orc и goblin одинаковый base_monster="human" → walking_speed_limit=1.8 у обоих
    → формация min(walkSpeed) даёт одинаковую скорость.

    Решение: переопределить walking_speed_limit раздельно:
      - orc       → 1.6  (тяжёлый, мощный, но не самый быстрый)
      - goblin    → 2.5  (мелкий, шустрый — заметно быстрее орка)

    Эффект:
      - При формации в строю (Move/Hold/ShieldWall с MovementSpeedRestriction):
          формация = min(WalkSpeedCached) = 1.6 → строй идёт со скоростью орка, гоблины не выбегают
          (они держат строй, лорно). Но всё равно строй медленнее ванили (1.8).
      - При Charge (avg path без restriction):
          формация = avg(MaximumForwardUnlimitedSpeed). Гоблины с большим walking_speed_limit
          поднимают avg → формация быстрее, и индивидуально гоблины опережают орков на свалке.
      - Индивидуально (выпавший из строя агент): гоблин 2.5, орк 1.6 → ~56% разница.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- copy-by-default -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Orc battle monster: оставляем 1.6 (медленнее ванили human=1.8). -->
    <xsl:template match="Monster[@id='orc']/@walking_speed_limit">
        <xsl:attribute name="walking_speed_limit">1.6</xsl:attribute>
    </xsl:template>
    <!-- Если у orc нет walking_speed_limit (наследует human) — добавляем атрибут. -->
    <xsl:template match="Monster[@id='orc'][not(@walking_speed_limit)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="walking_speed_limit">1.6</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Goblin battle monster: 2.5 (заметно быстрее ванили human=1.8). -->
    <xsl:template match="Monster[@id='goblin']/@walking_speed_limit">
        <xsl:attribute name="walking_speed_limit">2.5</xsl:attribute>
    </xsl:template>
    <xsl:template match="Monster[@id='goblin'][not(@walking_speed_limit)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="walking_speed_limit">2.5</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
