# Changelog

Each entry is a release day. Multiple small fixes within a day are bundled into a single entry.

---

## 2026-05-05 — Release: orc sieges, prisoner cannibalism, AI balance trimmed, duel fixes

Bundled entry covering all changes since the May 1 release. Big new content + a stack of fixes from player reports.

### Orc sieges

- **Orcs no longer build trebuchets.** By lore: a counterweight machine with parabolic trajectory math is too engineered for an orc. Ballistas, onagers, catapults (including fire variants) remain — simple "bonk!"-machines that an orc gets. Removed both for attacking orcs and for defending orc towns.
- **Battering ram beefed up.** In a real castle siege the ram hits 5× harder (gates fall in 5–10 hits instead of 30+) and holds out 3.5× longer. By lore: a log with a "tooth-grinder" skull, iron-clad, shoved by eight burly orcs. Same buff in auto-resolve.

### Prisoner cannibalism

- **When an orc party runs out of food, prisoners come first**, then goblins. Lords and companions are spared (a lord is worth a ransom). One prisoner = 12 meat (≈24 hours of marching for a mid-sized party), one goblin = 8 (≈16 hours). Previously the eaten ones gave grain — now meat, which is, you know, lore-accurate.

### AI orc balance on the campaign map

Players reported: "10 orc lords = one 2000-strong army that deletes everything", "orcs sweep the map in two months", "AI-vs-AI battles wipe everyone". A few targeted nerfs — **player is untouched**:

- **AI orc army size capped at 120** (was 180–250 per vanilla clan-tier × Leadership formula). Trimmed in line with human lords. Player has a separate formula and is not affected.
- **The cap is soft.** If an AI lord already had 150 troops, his limit is set to 150 — no forced desertion from our nerf. He just can't grow above it, but won't lose troops either.
- **AI lords' goblin hire in orc villages** cut to a third: previously up to 14 goblins/day per lord (instant numeric flood in auto-resolve), now ≈5.
- **Daily teef income for AI clan leaders** cut from 10 to 3. Without it AI infinitely stockpiled teef and recruited elite every single day.

In personal combat orcs are exactly as scary: HP +40%, skills +30%, ×1.5 morale, elite never panics. Only **AI strategic dominance** got trimmed.

### Fixes

- **Teef from a warboss duel now arrive.** In the castle 1v1 challenge the "you get N teef" line was shown but the counter didn't move — our own guard against TOR-side teef spam was accidentally catching our own legitimate calls. Rewritten to a direct path that bypasses the guard. Teef for a duel win — now guaranteed.
- **Runaway orcs in the brawl arena no longer freeze.** On some arenas FFA goblins/orcs fell off balconies into out-of-bounds and hovered as "unreachable" — arena never ended, instant defeat for the player. Now we check every second and finish off the fallen one (counts toward kills); the arena ends correctly.
- **Goblins in the brawl no longer spawn on the roof.** With our enlarged 18-enemy roster vanilla TOR used spawn points on the upper levels of the arena (for NPC decoration). If a goblin spawns higher than 1.5 m above the floor — teleport to floor.

---

## 2026-05-01 — Localization hotfix

Immediately after the April 30 release, players on non-Latin locales (Chinese, Korean, Japanese) sent screenshots showing untranslated bits in the recruit menu and the castle duel. All four leak points are closed, plus one missing key was added.

### Localization

- **"Teef" in the recruit price column now translates.** In the orc castle elite recruit table, every price line read "X teef" — an English hardcode independent of locale. Now the per-language key is substituted: 牙齿 / 牙齒 / 이빨 / 牙 / жубов / Zähne / dents / dientes / denti / zębów / diş / dentes / teef.
- **"Challenge to a duel" prefix in the castle duel menu now translates.** Each duel line was prefixed by the English "Challenge to a duel:" instead of the localized verb. Cause: the text was resolved before the player's language pick had loaded. Moved to render-time resolution.
- **Orc / goblin names in system messages now come from this mod.** "Recruited: <name>", "Not enough teef for <name>", the WHF brawl post-battle popup — these read through a third-party TOR translation. If that translation was off or stale, names fell back to English. Now they ship inside our 13-language set.
- **"Can't leave the tournament" message** — previously English-only (the `lh_tournament_cannot_leave` key was missing from XML). Now in all 13 languages.
- **Full token audit.** Verified that all 27 keys with `{NAME}` / `{COUNT}` placeholders preserve every token in all 12 translations — 0 mismatches.

Total: 13 languages × 78 strings = 1014 verified strings.

---

## 2026-04-30 — Release: economy fixes, AI orc balance, UI polish

Bundled entry covering a long day of follow-up patches. Players sent in several bug reports — all of them are addressed in this release.

### AI orc balance on the campaign map

Players reported: "orcs sweep the map in two days", "auto-resolve makes orc cavalry an instant-win button", "orc warbands run at 280-320 troops".

- **Auto-resolve buff for orcs removed.** In the auto-resolve formula (vanilla Bannerlord hotkey — usually `Send Troops`) orcs no longer get +15% damage. Pure unit-power calculation applies. Orcs are still scary in real battle (HP +200..+300, ×1.5 morale, elite never panics), but in auto-resolve they fight as their `troopPower` says.
- **Orc faction no longer steamrolls the world.** AI-vs-AI battles now resolve fairly — orcs hold their own territories but don't sweep neighbors in a week.
- Player-vs-orc real combat is unchanged. When you fight in person, orcs are as dangerous as before.

### Tooth economy — pinpoint fixes

- **Gold no longer drains for "garrison" / wages in tooth economy.** Players noticed that even with tooth economy selected, the daily clan finance report still showed "−183 for garrison". Now any negative net daily gold change for a player orc clan is clamped to zero — incomes (caravans, villages) still come through.
- **Goblins don't draw a wage.** By lore, goblins are servants, not mercenaries. Previously every goblin in the party piled onto the unpaid-wages counter, and vanilla applied a morale penalty for it. Now goblins are excluded — you no longer get punished by morale for your own retinue.
- **Post-battle popup no longer lies about teef.** Previously the loot screen could show a phantom "you can spend N teef" line, but pressing OK didn't actually deduct anything (a guard blocked it). Now that line just doesn't appear. Real teef sources work as before (Tier 4+ kills, lord kills, brawls, castle challenges, daily fief tribute).
- **Orc → Orc Boy upgrade now deducts teef correctly.** A bug had the first upgrade go through but the visible teef counter staying the same. Hitting + on a second upgrade then said "not enough teef". Now teef are deducted after each upgrade and the budget tracks correctly.

### Morale and cannibalism

- **No longer crashes to zero in two days.** Players showed a morale breakdown screenshot: 6.9 out of 100 after two minutes of play. Root cause was the vanilla "Unpaid wages −17.48" penalty triggered by goblins in the party. With goblins now excluded from wages (above), the penalty is gone.
- **Goblin cannibalism is more filling.** When an orc party runs out of food, eating one goblin now yields 8 units of grain (was 1, and the single grain got consumed instantly — the hunger-morale tick still fired). One goblin now covers ~16 hours of marching for an average party — the hunger penalty no longer triggers in between.
- **"Internal Fightin'" −40 morale stays.** That's an intentional TOR mechanic for early game — level your WAAAGH attribute through the orc career, and the penalty drops to −20 on the next tier.

### Map UI

- **The ×16 ultra speed button no longer shows a wrong tooltip.** Previously hovering it displayed "Fast Forward (3)" — inherited from the vanilla 3rd button. Now no tooltip pops on the ultra button. The button itself works as before.

### Combat polish

- **Brawl arena: correct enemy count.** The internal note said "6 boyz + 4 orcs + 8 goblins = 18 enemies", but a typo spawned 12 goblins (22 total). The reward ladder is calibrated for 18 — the extra goblins skewed the balance. Now exactly 18 enemies, reward calculated as designed.

### Localization

- **Two Chinese languages added** — Simplified (简体中文) and Traditional (繁體中文). All 76 mod strings translated. Players on PCs with a Chinese Bannerlord locale now see the mod in their native language instead of English fallback. Translation quality is workable but machine-assisted; native speakers can suggest spot fixes.
- **New "Not enough teef" key in all languages** — previously the cart-trimming message displayed only in English on every locale (fallback to literal key on the others).
- **Base orc unit names now ship inside the mod itself** — Goblin, Orc, Orc Boy, Choppa, Arrer Boy, Boar Boy. Previously these names came from a separate TOR translation mod — if it was missing or out of date, our messages slipped to literal IDs. Now self-contained across all 11 languages.
- **Brazilian Portuguese: text processor fixed** — some characters (em-dashes, apostrophes) were rendering as glitched glyphs.
- Total supported: 11 languages — English, Русский, Deutsch, Français, Español, Italiano, Polski, Türkçe, Português (BR), 简体中文, 繁體中文.

### Technical fixes

- **WAAAGH! tournament in orc castle removed.** That feature was experimental and crashed due to a clash with vanilla tournament bracket builder (Bannerlord doesn't support custom team sizes). Town arena is now plain vanilla — no override. The castle 1v1 challenge (a different feature, not the tournament) stays as it was.
- **Protection against the whole patch set falling apart on a future Bannerlord update** — added explicit signatures in two patches where vanilla might introduce an overload and break Harmony registration in one shot.
- **Protection against accidental double teef deduction during recruitment** — order of operations on cart trim reordered so a teef shortage can't accidentally hand a troop out for free.

---

## 2026-04-29 — Release: tooth economy, castle challenges, map ultra speed, combat polish

Bundled entry covering 28-29 April. A big feature wave on top of the 27 April release.

### Tooth Economy — separate currency mode for orcs

When you start a new campaign as an orc or goblin hero, a setup choice appears: **Classic mode** (gold for everything, like before) or **Tooth Economy**. In tooth economy, orc business runs on teef while everything else stays on gold.

- In orc towns and villages, troop recruitment is paid in teef (1/2/4 by tier), not gold. In human/dwarf/elf settlements — vanilla gold for everyone.
- The price icon in the recruit menu switches automatically: tooth only when you play as orc/goblin, tooth economy is selected, and you're in an orc town/village. Any other combination — regular coins.
- Starter bonus +10 teef the moment you pick the mode.
- Teef are only granted from real sources: killing a trained enemy (Tier 3 and above), killing a lord (+5), winning a fistfight at the arena, orc castle challenges, daily +5 per orc fief you own.
- Killing peasants and militia no longer yields teef. Previously the teef vault overflowed by mid-game — 100 Black Orcs would mow down a village and bring 1000+ teef in a single battle. Now only trained enemies are worth teef.
- Taxes, extortion, peasant loot, career passives — all of those automatic teef sources are switched off in tooth economy. The point is to keep teef a meaningful currency, not inflation noise.
- The post-battle loot screen no longer shows the fake "You will get N teef" line. Previously it appeared but pressing OK gave nothing (a guard blocked it) — now the line just isn't shown. Meat and regular loot in that screen work as before.

### Orc castle challenges — duels with elite orcs

In an orc castle you can **"Challenge to a duel"** one of the available elite orcs:
- Pay an entry fee in teef up front (entry fee = stake).
- Win — the orc joins your party as a trophy.
- Lose — the stake is gone. That's it. No double penalty in gold (previously losing burned both the stake and 100 gold extra — that's removed).

### Map ultra speed + hotkeys

- A new **4th speed button** on the campaign map — ×16, for long cross-map treks.
- Hotkeys: **D3** = ×4, **D4** = ×8 + automatic FastForward, **Ctrl+Space** = ×16 boost (release the keys to return to baseline).
- Bug fix: after double-clicking the ultra button, the game no longer gets stuck at speed 1×. Previously the next click on regular FastForward made the map crawl like during pause. Old saves auto-repair on the first click of any vanilla speed button.

### Combat polish

- **Axe vs wooden shield damage ×6** (the 27 April release shipped with ×2.5). Live testing showed the TOR-side hook only fired in a subset of swings — moved to a lower-level engine path. While we were at it, raised the multiplier: a standard wooden round shield breaks in 3-4 hits (was 5-7).
- **Orcish iron shields are now correctly recognized as metal** and don't shatter under axes like wooden ones. A material-check error used to make the orc iron shield burst in 2 hits.
- **Goblins are even faster on foot** — they clearly outpace orcs and humans during charge / pursuit / formation breakdown. In a formed line everyone marches at orcish speed — formation holds (as it should). On the 27 April release goblins got +20% — now we add the base walking-speed difference on top (orc 1.6, goblin 2.5).
- **Orcs are stronger in Athletics** — longer sprint, more endurance.
- **Orc kicks now also fire on agent spawn** (previously they only triggered if stats got recalculated mid-battle — partially missed). Stun ×2.5 from kick, ×1.8 from shield-bash — numbers unchanged.

### Recruitment in tooth economy

- The "Recruit" button is now active when you have enough teef. Previously the vanilla logic checked gold, and with teef + zero gold the button silently did nothing.
- Walking into an orc tavern resets the recruit cart — no leftovers from the previous settlement.

### Localization

- **English fallback fixed.** A technical oversight made English players see Russian default text for several keys. Now English displays correctly.
- **Orcish elite names** in the castle recruit menu (Black Orc, Big'Un Orc, Berzerka, Orc Boss, etc.) are now translated inside the mod itself — no longer depend on a separate TOR translation mod. Even with `TOR_RU_Translation` disabled or out of date, the names still appear in your language.
- 9 languages: English, Русский, Deutsch, Français, Español, Italiano, Polski, Türkçe, Português (BR).

### Fixes

- **Hot-fix for the auto-resolve battle crash** when detecting orc party type. The game no longer falls during simulation.
- **Orc Arrer Boy T3 → T4 upgrades now properly change equipment.** They used to look identical due to an EquipmentSet redirect — Arrer Boy after upgrade looked like Arrer Boy.
- **Arrer Boy Boss got his bow back** (an earlier balancing pass had assigned him a melee template).
- **Starter +10 teef** on tooth-economy mode is correctly granted now (a bug had our chokepoint blocking our own starter grant).

---

## 2026-04-27 — Release: settlement-aware orc recruitment, AI lord rebalance, first wave of combat fixes

A big gameplay release. Each orc fief type got a distinct role, orc-lord race detection in AI rewritten, first wave of combat fixes (axe vs shield, goblin speed, orc kick, Bully shield).

### Settlement-aware orc recruitment

Previously orc troops came from the same vanilla recruit screen everywhere. Now each settlement type plays its own role and the gameplay loop feels different.

**In a village** — basic orcs and goblins:
- Village orc recruits: only the regular orc (T0). Vanilla used to upgrade them to orc boys and beyond over days — now capped at T0.
- New village menu option: **"Recruit goblins (100g for 2)"**. Direct purchase of a pair of goblins for 100 gold.
- Goblins in your party are limited to 4 per orc (without an orc master they don't follow — lore-accurate).

**In a town** — orc boys and occasional T2:
- Town orc recruits: orc boy (T1). Over time notables get T2 (choppa, arrer boy, boar boy) — about 10% chance per day.
- Hard cap at T2. No elite in towns.

**In a castle** — orcish elite via custom menu:
- Orc castle menu has a new button **"Recruit orcish elite"** → submenu with 8 troop types:
  - T3 Arrer Boy Boss — 4500g
  - T4 Big'Un / Boar Boy Big'Un — 5000-6000g
  - T5 Orc Boss / Black Orc — 5000-7500g
  - T6 Black Orc Brute — 7500g
  - T7 Black Orc Boss / Berzerka — 7500g
- Elite is sold for gold with progressive pricing:
  - 0-4 elites in party: ×1 (base)
  - 5-9 elites: ×2
  - 10+ elites: ×4 (prohibitive)
- **"1 elite per 5 regular orcs" cap** — you can't field a black-orcs-only army; you need boyz and grunts to support them.
- Each elite hire automatically gives **3-4 goblin attendants** (same as regular recruit flow).

### AI lords use the same systems
- Orcish AI lords buy elite in castles at 40% discount (helps their armies refill).
- Orcish AI lords buy goblins in villages at 50g for 2 (50% discount).
- Same caps apply — AI can't stack «100 Berzerkas» either.

### Player party limit
- Each goblin in your party adds +1 slot (cap +200 from goblins). Goblins are «free» on the slot system — lore canon.

### Status messages
- Every hire/purchase via the new menus prints in the corner: «Hired: Black Orc (+4 goblin attendants)» or «Hired: 2 goblins (for 100 gold)».

### AI lord and battle rebalance
- **Orcish AI lords now actually get the orc buffs.** Previously our HP +40%, skills +30%, morale buffs only recognized recruits, while campaign lords fought like regular humans. Now race detection goes by the Race field — all orc warlords get the proper buffs.
- **Removed hard cap of "50 orcs" for AI lords.** The old «to prevent insane hordes» cap was clipping AI lords' starting parties down to 50-80 → mass desertion → AI losing villages → clan collapse. Now AI receives the normal party limit based on clan tier and Leadership.
- **Player vs orc-AI combat rebalanced.** Previously enemy orcs hit at −15% and took vanilla damage → with HP+40%/skill+30% buffs effective orc strength against player ≈ ×1.8. Now enemy orcs hit at −30% and take +15% damage → effective strength ≈ ×1.1. The «900 humans attack 200 orcs and lose» situation no longer happens — your numerical advantage works.
- **AI orc vs AI human (no player) — unchanged.** Universal +15% attack / −8% defense bonus remains: orcs hold their territories without sweeping the map.

### First wave of combat fixes
- **Axes split wooden shields** — wood-shield damage ×2.5. Any axe (one- or two-handed, any race or culture). Lore: axe is the classic shield-cleaver. Metal shields untouched.
- **Goblins on foot are 20% faster** — combined with vanilla TOR difference of +10% for goblins, makes the goblin noticeably (but not radically) quicker than the orc.
- **Orc kick stuns longer** — kick ×2.5 stun, shield-bash ×1.8. Solves the case where a small enemy wedges itself against an orc with a two-hander.
- **"Bully" career** in character creation now ships with a shield. Previously the shield only appeared in the preview (lingering from a previous career choice) — but didn't exist in actual gameplay.

### Technical fixes
- **Fixed campaign load crash** caused by an ambiguous Harmony patch registration — the full patch set now wires up as it should.
- **Arrer Boy Boss got his bow back** — earlier balancing cascade had been assigning him a melee template instead of ranged.
- **Localization of all new strings** for 9 languages: English, Русский, Deutsch, Français, Español, Italiano, Polski, Türkçe, Português (BR).
- Mod version displayed in main menu corner for easier diagnostics.

---

## 2026-04-26

### Lore fix: only orc elite stays stubborn
- Previously all orcs never panicked — that contradicts Warhammer Fantasy lore.
- Now stubborn only: Black Orcs (all variants), Big'Uns, Orc Boss, Master Thug.
- Regular orcs (boyz, choppa, arrer boy, boar boy, bully, thug) can panic like normal troops.

### Damage now depends on side
- Orcs on the player's side: hit harder (+20%) and take less (−8% incoming).
- Enemy orcs: hit weaker (−15%), your strikes against them go through as normal.
- Player feels their progression: orcs on your side are scary, orcs against you are beatable.
- Works in both real battles and auto-resolve.

### AI vs AI auto-battles
- When two AI armies fight on the map (without the player), orcs get a universal buff so they hold borders and don't lose territory.

### Localization for 9 languages
- All mod messages translated: English, Russian, German, French, Spanish, Italian, Polish, Turkish, Brazilian Portuguese.
- Chinese, Korean, Japanese players see English (standard fallback).

---

## 2026-04-25

### WAAAGH! — kill cheer
- When an orc kills an enemy, his side's morale grows by half-again. Each kill makes nearby orcs angrier — cascading rage.

### Orcs don't run
- Orcs no longer panic from fear in battle. They fight to the death.

### Orcish cannibalism — goblins as marching rations
- When an orc party runs out of food, the party eats one goblin per hour and gains one unit of grain.
- On the player's main party a log message appears: "Out of food — the party ate a goblin (name). Goblins left: N."
- If no goblins are in the roster — normal starvation penalty (vanilla).

### Orc upgrade prices (rebalance)
- Previously buying a base orc and upgrading him to a higher tier was more expensive than buying the higher tier directly — upgrades made no economic sense.
- Now the upgrade chain is always cheaper than direct purchase. Savings 17-37% per tier.

### "Greenskin Brawl" arena
- Enemy count raised from 12 to 18: 6 boyz + 4 regular orcs + 8 goblins.
- Reward ladder extended from 0..12+ to 0..18+ kills.
- Player now spawns at a random arena point — sometimes right in the middle of the chaos.

### Main menu
- Top-right corner — current mod version.
- Bottom-right — author's Telegram channel: @CodeRickTg.

---

## 2026-04-24

### Orcs
- +40% HP, +30% to all combat skills, +35% outgoing damage, −30% incoming damage.
- Recruit and upgrade cost × 2.5, minimum 150 gold per upgrade.
- Recruits in orc settlements show up twice as slowly.
- Orc AI parties eat 50-150% more food.
- Black Orc Berzerka: +30% damage on top of base (final × 1.755 vs humans), recruit cost 22000 gold.
- Big'Uns (Orc Big'Un, Boar Boy Big'Un, Bully Big'Un): +20% damage on top (crush-through proxy).
- Black Orc removed from basic recruitment — only via upgrade or arena reward.
- Character creation equipment: distinct style per archetype (boss in heavy armor, bully in big'un set, boar boy with spear and boar).
- Bandit orcs left at vanilla (starting difficulty).

### Goblins
- −60% HP.
- When recruiting an orc, goblin companions auto-join: 1 for regular orc, 2 for boy, 3 for mid-tier, 4 for elite.
- Party limit weight: 0.5 per goblin (every 2 goblins = +1 slot, cap +30).

### Trolls
- Endurance 800 → ~750 HP.
- Recruit cost 30000 gold.
- Max 2 per raider party (was 4).

### Troll cave
- Defenders cut by two-thirds (was 7-10, now 4-6).

### "Greenskin Brawl" arena
- Fixed roster: 4 boyz + 2 regular orcs + 6 goblins = 12 enemies.
- Free-for-all: every fighter on their own team, orc boyz no longer gang up on the player.
- Reward depends on the player's PERSONAL kills (ladder from 0 to 12+).
- Diversity bonuses: 2 enemy types killed → +1 goblin; all 3 types → +1 orc.
- Gold × 0.5 from vanilla.
- The victory menu shows "You personally defeated X out of Y".

### AI limits
- Orc lords: max 50 orcs + up to 200 goblins = 250 per party.
- Warboss party: more goblin wolf riders, thinner Black Orc core.
- Bandit party sizes reduced.

### Weapons
- Orc bows: lower accuracy, slower arrow speed, +20% damage on hit.

### Fixes
- Upgrade cost in encyclopedia now matches the actually charged amount.
- Arena kill tracker no longer drops events.
- Party limit grows correctly (every 2 goblins = +1 slot, not +1.5).
- Goblin companions are now given by a fixed formula (not random RandomInt(0, 3)).

### Requirements
- Mount & Blade II: Bannerlord 1.3.15
- The Old Realms 0.6.0
- Bannerlord.Harmony 2.4.2
- TOR_Armory
