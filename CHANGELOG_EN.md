# Changelog

Each entry is a release day. Multiple small fixes within a day are bundled into a single entry.

---

## 2026-06-07 — v0.1.9.57: Dark Gods system, reworked Overlord fight, peace with beastmen + new-game crash fix

Large update since the last Steam release (v0.1.7.5). Target: Bannerlord 1.3.15, TOR "War in the Mountains" 1.16. Defaults: Orcs ON, Chaos OFF (BETA).

### ⭐ Dark Gods system (new Chaos feature)
- On joining Chaos you pledge to one of **four Dark Gods** — Khorne, Nurgle, Tzeentch, Slaanesh. **The choice is permanent** (saved).
- At a **personal kill threshold** (default 1000) your god grants their **full top-tier armour + weapon set** — each god has its own kit (Slaanesh uses its own gauntlet).
- At a higher threshold (default 2000) you unlock the **duel against the Chaos Overlord** for his throne.
- Two **configurable thresholds** (new "Dark Gods" settings tab, 500–2000 each), each with a "?" hover hint.

### ⚔️ Overthrow the Chaos King — reworked fight
- Full rework: "player + companions" vs "Overlord + 2 elite bodyguards".
- **Player magic works inside the fight** — spells, raising skeletons/undead.
- The Overlord is **invulnerable while a bodyguard lives** (red Khorne warriors); tougher once they fall.
- **Disintegration aura** crumbles summoned undead near him.
- Field battle is **mounted**; the castle fight is on foot.
- **Escort selection** via checkboxes; the Overlord brings an equal number of fighters.
- **Reliable exit** and correct win/loss detection (even after raising many skeletons); ~10 s pause after the outcome for the death animation.
- **Magic fully polished** (large fix batch): no more "fire on the hands" after casting, weapon usable immediately, LMB cast no longer triggers an extra weapon attack.

### 🩸 Chaos — peace with beastmen & cults
- After you join Chaos, **beastmen** (Brass Keep / Beastmen) and the dark cults **no longer war you** or re-declare war every day — they become allies. (Before joining, they stay hostile as before.)
- **War-spam fix:** Beastmen/Brass Keep no longer declare war every tick; players serving a NON-chaos faction (e.g. Serve As Soldier) no longer get an endless war↔peace toggle.

### ⚔️ Chaos recruiting
- **Chaos Portal:** 10 different soldiers per summon (5% Minotaur chance), weekly cooldown.
- **Beastmen lair:** up to 20 max-tier troops (Ungors/Gors/Minotaur) + a "who and how many were recruited" report.
- Minotaur removed from ordinary settlement recruiting; its party-size penalty eased (−7 → −2).

### 🪙 Orc economy
- **Elite teef upkeep:** orc elite (Tier 4+) costs teef per day. Configurable multiplier (0 = off, 1 = normal, 2–3 = hardcore). Out of teef → morale drops and elite gradually deserts. T1–T3 orcs and goblins stay free.

### 📖 In-game guide
- Opens with **Alt+H** (plain "H" used to fire while typing / in menus and **crashed the game** — fixed), map-only.
- Opening the guide **pauses the game**.
- Fixed **section order** (was reversed) — important topics first.

### 💛 Supporters wall
- Settings now have a separate **"♥ Supporters"** button — a list of people who backed the mod financially, ranked with stars by contribution. Thank you! ♥

### 💬 Text & terms
- "Chaos King" → **"Chaos Overlord"** across all dialogue and localization.
- Fixed literal `\n` in the **"Gift of Chaos accepted"** message; tidied the god-choice window.

### 🛠 Stability & crash fixes
- **Fixed a hard crash on starting a NEW game** (`NullReferenceException` in the name generator during minor-faction hero spawn). Cause: an old balance patch deleted 14 named orc-lord characters but left dangling hero references in TOR data, producing broken heroes that crashed name generation. Loading an existing save was unaffected, which is why it only showed up on **new games**. The lord-deletion patch was **removed entirely**; orc army size is still tamed by the existing clan-tier reduction.
- Fixed a **load-time freeze** when loading a save where the god set was already earned.
- **Guard** against a crash when a Chaos Lord (Mortkin) is captured by an ordinary lord.
- Misc orc career teef-quest fixes, hideout reactivation cooldowns and bandit density caps.

### 🌍 Localization & compatibility
- All new/changed strings translated across **13 languages** (EN + RU/DE/FR/SP/IT/PL/TR/BR/CNs/CNt/JP/KO), validated (no unescaped characters).
- **Compatible with TOR "War in the Mountains" 1.16.**

---

## 2026-05-31 — v0.1.7.5: Chaos troops can be upgraded again, market purchases no longer vanish, crash safety

Post-release fixes on top of v0.1.7.3, driven by player feedback.

### Chaos troops can be upgraded again
- **Bug (player reports):** the upgrade button for Chaos elite (T4+) was disabled — you could hire Chaos troops but not level them up.
- **Cause:** elite upgrades were gated behind Dark Energy, which is almost impossible to come by (only from executing captured lords) → the balance was nearly always zero, so the button stayed greyed out with no hint why.
- **Fix:** upgrading Chaos elite now costs **gold only** (a tier-scaled floor keeps it expensive: T4≈480, T6≈720). Dark Energy no longer blocks upgrades.

### Chaos market purchases no longer vanish
- **Bug:** god-gear bought in the capital disappeared after a save/load (the character ended up "naked").
- **Cause:** god-gear is flagged by the engine as "not merchandise" (`is_merchandise="false"`) — such items are not persisted in the save's reference table.
- **Fix:** god-gear is **removed from sale** (by design it is earned in blood, not bought). Wearable Chaos goods (weapons/armor/shields/saddles) are flagged as proper merchandise via XSLT, so purchases survive a save/load.

### Stability
- Added defensive `try/catch` to 5 entry points (arena and Chaos King duel battle callbacks, the orc-elite castle recruit menu, and the village goblin-hire menu) — an unhandled exception in a mission/menu callback no longer crashes the game; it's logged quietly instead.

---

## 2026-05-30 — v0.1.7.3: Overthrow the Chaos King, Chaos market, upgrade economy, crash fixes

First public release since **v0.1.5.73** (the intermediate v0.1.6.x builds were local only — never reached Workshop/GitHub; they are folded in here). Headlines — the **"Overthrow the Chaos King"** feature and the **Chaos market**: challenge the reigning Chaos King to mortal combat and seize his kingdom, and Chaos towns now trade in Chaos gear.

### Overthrow the Chaos King
- **Chaos Glory (personal kills).** Kills by your own hand build a "Chaos Glory", shown on a colored bar above the map clock (purple — building, green — ready to challenge, red — cooldown after a loss). The bar has a black border and is drawn with fill-widgets (the map font has no block glyphs, so it can't be text).
- **Right to challenge** — serve Chaos ≥ 30 days and raise your Chaos Glory above the King's threshold. When ready, a dialogue option with the King appears.
- **Where is the King** — ask any Chaos lord where his overlord holds court (court / on the march / captive).
- **The duel** on a duel scene. The King is buffed: five times as hardy (incoming damage ×0.2) + ×2 damage. The prep menu has a "withdraw" option — no penalty if you back out.
- **Victory = usurpation.** You become the ruler of the EXISTING Chaos kingdom (no new kingdom is created): it is not "destroyed", its wars and name persist, the Chaos lords become your vassals, the King's capital and god-gear pass to you, and your clan banner becomes the Chaos banner. Defeat — Chaos Glory −30% and a 30-day cooldown.

### Chaos market
- Chaos towns now stock **Chaos weapons and armor**; the four Gods' god-gear in the capital.
- **Cursed** Chaos items can only be sold in Chaos settlements (price 0 elsewhere).

### Chaos upgrade economy
- Gold cost of Chaos troop upgrades is no longer "pennies" — a tier-scaled floor (T4≈480, T6≈720), applied idempotently.
- Upgrading Chaos elite (T4+) also costs **Dark Energy**.

### Crash & stability fixes
- **Town consumption crash** (`KeyNotFound` in vanilla `ItemConsumptionBehavior`) after seizing the Chaos kingdom — Chaos god-gear with an unregistered item category broke the daily town tick. Added a guard that seeds zero demand.
- **Usurpation** wrapped in safety checks (kingdom membership before the ruler change, fief transfer); reentrancy guard on the daily lord-absorption.
- Removed the **out-of-save anti-cheat duel token** — it survived save rollbacks and permanently locked the challenge; all progress now lives in the save only.
- Centralized culture-change reflection (clan/settlement) — a single point that logs loudly instead of failing silently (more robust against TOR updates).
- The player Chaos King no longer gets the "find the King and challenge him" ping.
- The duel now starts from dialogue (narrative "meet me outside the walls"); a duplicate old "where is your overlord" line was removed from Chaos lords.

### Polish (UX)
- "Chaos has risen" notification no longer spams: removed the 40s repost (≈10 lines) + added a per-day dedup — at most **one** announcement per game day.
- The "The Throne Awaits" popup (you can challenge the King) now shows **exactly once**; the corner ping is **once every 4 days** (it used to re-fire whenever eligibility flickered).
- The King's Chaos Glory threshold is now **fixed** (removed the +5/day drift): hit 100% and it stays 100% instead of decaying to 98%.

### Localization
- All new/changed strings translated into **13 languages** (EN + 12). Fully in sync: 490 keys per language, no unescaped characters.

---

## 2026-05-23 — v0.1.5.73: Chaos — DarkEnergy resource, dialogue fixes, NRE crash fixes

Hotfixes on top of v0.1.5.70. Headline: Chaos players no longer crash with NRE across dozens of TOR scenarios (skill trainer, enchanter, custom settlements, rituals), plus Chaos lord encounter and tavern dialogues are repaired.

### DarkEnergy resource now works for Chaos race

In TOR `chaos_culture` was not bound to the DarkEnergy custom resource — `Hero.GetCultureSpecificCustomResource()` returned `null`. Any TOR code that touched the resource without a null check would NRE: skill training, enchanting, duels, custom settlements, rituals, the resource panel. We now add `chaos_culture` to DarkEnergy's culture array next to `vlandia` (vampire counts) — the icon, tooltip and counter appear for Chaos players.

The resource description is rewritten to a universal text covering both factions ("power of forbidden cults and dark rites") rather than the vanilla TOR text that only mentioned necromancers.

### Chaos lord encounter dialogues

- **Foreign Chaos lord no longer threatens you with death when you're at peace.** Vanilla TOR fired the hostile opener "You will die drowning in a pool of your own blood!" even with no war between sides. Our priority-220 dialogue on the same node now leads with "What brings you to our lands, mortal?" plus three player responses.
- **"Talk" option is no longer gated to clan leaders.** Removed the `lord.Clan.Leader != lord` check — Talk works with any Chaos lord. Non-leaders simply reply "Seek my master in his stronghold" and the dialogue closes cleanly.

### Chaos wanderer tavern dialogues

For hired wanderers with `chaos_culture`, vanilla TOR character-specific tokens `tor_hire_companion_tell_me_p.{characterId}`, `_a`, `_b` had no translation — player buttons were visible but empty. A Postfix on three TOR condition methods unconditionally swaps the empty MBTextManager text with Russian fallback strings. No regressions: the postfix is gated on `Hero.OneToOneConversationHero.Culture == chaos_culture` so Imperial/Bretonnia/other wanderers behave as before.

### Things to verify after updating

- Main menu shows `v0.1.5.73`.
- A Chaos hero has the DarkEnergy icon in the resource panel; the tooltip mentions the Dark Gods.
- Encounter with an independent Chaos lord (peace) — no threats, Talk option is available.
- Wanderer with `chaos_culture` in a tavern — both player buttons have meaningful text.
- No regressions: Imperial/Bretonnia/other tavern wanderers work as before.

---

## 2026-05-21 — v0.1.5.70: Chaos faction playable + per-race master toggle + critical crash fixes

Big update. Headline: Chaos faction is now playable through in-game mechanics (vassalage, Dark Pact, captive tempting), each race has a master toggle (turn our overhaul on/off for orcs or chaos independently), and two crash classes that were killing client save-files are fixed.

### Per-race master toggles

The mod settings now have a "Main" tab for each race with a single big switch "ENABLE overhaul". When turned off, all our patches and behaviours for that race are **not registered** — pure vanilla TOR for greenskins/chaos. Takes effect on the next game load.

- **Defaults: Orcs ON, Chaos OFF.**
- When a race is off, the other tabs and parameters for it are dimmed and locked — visually clear that the mod is inactive for it.

### Chaos faction (new)

After a Chaos Uprising (vanilla TOR — once per 30 days by default, was 126) the chaos kingdom appears on the map with 4 lords. What the player can now do:

- **Become a Chaos vassal** — talk to any Chaos lord → option "I want to serve the Dark Gods" → pay 50,000g tribute → join the chaos kingdom + 15 equipment items from the 4 gods (Khorne / Nurgle / Slaanesh / Tzeentch + Undivided + Chaos horse).
- **"Talk peacefully"** in map encounters — if you're an independent clan, encountering a Chaos lord gives you a negotiation option instead of just Attack/Leave.
- **Accept the Dark Pact** — after vassalage, dialogue "Make me one of you" → ritual → character culture changes to `chaos_culture`, +XP to combat skills. Solves the culture-mismatch problem when you eventually want to make your own Chaos Kingdom (vassal cities lose loyalty if owner culture doesn't match).
- **Captive tempting** — every enemy lord in your captivity accrues a "tempting progress" (1.5/day, +50% if you're already chaos culture). At 100% → dialogue option "Accept the Dark Pact" → the lord defects to your side.
- **Diplomacy with dark factions** — peace and alliances possible between Chaos, Orcs, Vampire Counts, Mousillon, Beastmen. Vanilla TOR blocked any peace involving chaos.

### Chaos troops

- **Norscan** +30% HP, **Beastmen Gor** +25% HP, **Minotaur** +50% HP — lore "bigger and stronger than humans".
- **Cultists / Ungor** — cannon fodder, no HP buff, but **+1 to party size limit** per 2 cultist/ungor in roster (mechanic mirroring undead).
- **Recruit Cultist / Ungor / Gor / Minotaur** in dark-culture settlements (chaos / forest_bandits / steppe_bandits / aserai / khuzait / mousillon) if you're chaos-aligned. Injects into notable volunteer slots — slot 0 = fodder, slot 2-3 = Gor (castle area), slot 5 = Minotaur (20% chance in castle/town).
- **Cultist and Beastmen hideouts** — friendly menu option "Pass peacefully" for chaos-aligned players.

### Balance sliders (UI)

All Chaos parameters are now adjustable via Settings → Chaos (7 tabs: Main / Vassalage / Dark Pact / Tempting / Troops / Recruiting / Systems). 15 parameters including:

- Vassalage tribute (default 50,000g, range 1k–500k)
- Min Clan Tier for Dark Pact (default 3)
- Tempting progress per day (default 1.5)
- HP buff for Norscan / Gor / Minotaur
- Chaos Uprising cooldown (**default 30 days**, vanilla was 126)

### Console commands for testing

To test without waiting for an uprising:

- `lh.chaos_status` — current state (clans, kingdoms, player culture)
- `lh.chaos_uprising_now` — force a Chaos Uprising
- `lh.chaos_join` — become vassal of chaos kingdom
- `lh.chaos_pact` — apply Dark Pact (culture switch)
- `lh.chaos_equipment` — grant chaos equipment
- `lh.chaos_start` — all of the above in one go

### Critical crash fixes

**1. Native crash after 20–79 minutes (Goblin-changer leak).** Several players reported a 0xC0000005 (Access Violation) on campaign tick. Root cause: the goblin moneychanger spawned when entering an orc village/town was only "disabled" on exit via DisableHeroAction. That didn't remove it from the Hero collection — it persisted in the save and accumulated into hundreds across save-load cycles. Now it's fully removed via `KillCharacterAction.ApplyByRemove` + `MBObjectManager.UnregisterObject(CharacterObject)`. Existing saves auto-clean on first load (log: `removed N goblin(s)` + `roster-scan removed N goblin element(s)`).

**2. NRE crashes on AI hourly tick (wage / food / ai_tick).** Client saves crashed with NRE inside `TORPartyWageModel`, `DefaultMobilePartyFoodConsumptionModel`, `AiPatrollingBehavior` etc. Root cause: dangling CharacterObject references in AI party rosters (Culture==null after unregister). Baseline fix: at campaign load we scan specifically for goblin-template references and remove them. **Generic crash safety** (any dangling characters) moved to the companion mod **CrashDoctor** — install it alongside Lore-Hardcore for maximum stability on problematic saves from other mods.

### Other (minor, accumulated)

- Settings persist fix — master toggles now correctly save to `user_settings.xml` via UI Save (was a bug — the setting changed in memory but wasn't written to file).
- Village militia overhaul rollback — `tor_gs_orc_boy` (boyz) returned to village militia (we used to replace them with regular orcs; turned out this broke vanilla TOR design).
- UI design fix — tabs no longer overflow to the right after adding the master tab, design is now consistent.

---

## 2026-05-19 — Hotfix: day 100-200 crashes, AI balance, cannibalism

## 2026-05-19 — Hotfix: day 100-200 crashes, AI balance, cannibalism

Multiple players reported native 0xC0000005 crashes after 100–200 in-game days (corrupted shader cache). Root cause: three of our patches accumulated unique elite orc units and oversized goblin caravans in AI rosters, overloading GPU memory by day 100+. Cannibalism morale, food consumption and AI recruit speed also tuned based on feedback.

### Highlights

- **100–200 day crashes should stop.** Root cause fixed by returning AI to vanilla TOR flow.
- **Orc player loses nothing.** All your mechanics (tooth economy, goblin moneychanger, castle duel, extorsion, kill-teef) work exactly as before.
- **Human player:** same number of orc fights, but for the first ~2 months after defeating an orc lord his army is weaker (rebuilds through standard TOR upgrade tree, no instant elite spawn).

### AI changes

Back to standard TOR behaviour for AI orc lords:

- **Direct elite hire in castles disabled** (Big'Un / Black Orc / Berzerka no longer appear in rosters every hour). Instead AI upgrades regular orcs to elite through the standard TOR upgrade tree — naturally, as they gain XP and gold.
- **Direct goblin hire in villages disabled.** Goblins are now added automatically by TOR's own mechanic when an orc is recruited (0–2 goblins each), same as for the player.
- **Goblin caravans** return to vanilla size (14 troops). Previously by day 300+ each caravan grew to 300 goblins and became a mini-army. Caravans are now an easy mark, much safer to attack early-game.
- **Volunteer production rate** in orc settlements = vanilla (×1.0). A defeated AI orc lord rebuilds to a full army in about 2 months — same as human lords back home.

### Goblin cannibalism

Previously eating goblins dropped party morale to zero — 1 meat per goblin wasn't enough to cover an hour of party consumption, and vanilla's hunger morale tick chewed through morale in the gaps. Now each eaten goblin gives **+3 morale** to your party — for an orc army it's "WAAAGH! tasty snack", not the loss of a comrade-in-arms.

Eating a human prisoner still gives no morale bonus (lore-wise, a grim deed).

### Greenskin appetite disabled

The extra food drain of +0.15/day per orc/goblin in the player's party is removed — in late-game with a large army this turned into +12 food/day and choked the campaign. Orcs and goblins now eat as standard TOR configures them.

### If your game is already crashing on an old save — what to do

The corrupted shader cache **stays** on disk even after updating — an old campaign may keep crashing. One-time fix:

1. Close the game.
2. Delete `C:\Users\<your_user>\AppData\Roaming\Mount and Blade II Bannerlord\Shaders\`.
3. Launch the game — it will rebuild the cache (30–60 minutes, one-time only).

New campaigns start clean without this step.

---

## 2026-05-17 — Release: goblin moneychanger + tooth economy polish + AI fixes

Bundled patch since the previous Steam Workshop release (2026-05-13). Headline feature is the goblin moneychanger — a new NPC in every native orc village and town. Plus a series of important tooth economy fixes, AI behaviour fixes, and career quest fixes based on player feedback.

### Goblin moneychanger — new NPC

A shifty goblin with proper Warhammer Orc-speak now lives in every **native** orc village and town. Trades gold for teef:

- **In villages:** 1000 gold → 9 teef. The goblin "counts out" 11 and quietly pockets 2 for himself — lore-fitting "greedy little git". Three-day cooldown per village (one trade every three days).
- **In towns:** 1000 gold → 11 teef, a fair count in front of the boyz. Daily stock of 111 teef, refills every day. The trade can be repeated in a single conversation as long as you have gold and the goblin still has teef.

Goblin names are randomly generated — every village and every town has its own ("Wazog", "Snikrit", "Aggok", "Kurfang" and similar). The goblin is a full NPC visible in the settlement Notables list, clickable, with a proper conversation.

In **captured** orc towns (taken by an orc clan from humans/dwarves/vampires) the vanilla Kwartamasta now gives a rate of **1:200 instead of 1:100** — lore-fitting "new in someone else's town, prices bite". In native orc cities the Kwartamasta rate stays at the standard 1:100, plus our goblin moneychanger gives an alternative.

### Shaman career quest — spell counter finally counts

The loudest complaint since the last release: "I learn enchantments but the quest counter sits at zero". Root cause was how the mod previously hooked the TOR quest setup: it blocked not just the requirement numbers but also the registration of in-game event listeners. The same problem silently broke battle/tournament/brawl/cities-captured/lord-duel counters for the Boss career.

Now the setup call runs unobstructed (TOR subscribes to all needed events), and our patch simply overwrites the requirement numbers down to our balance after the fact. All counters work.

### Tooth economy at upgrade and upkeep — no more lying UI

Used to show a "Spend N teef" popup when upgrading an orc, but the teef didn't actually deduct (by design — orcs and trolls don't pay upkeep). The mismatch between text and reality confused players. Now:

- "Spend N teef" pop-up on upgrade has been removed — no phantom transaction.
- "Requires N teef upkeep" line under the troop portrait is also hidden.
- In captured orc towns the TOR gold→teef exchange now operates at 1:200 (see above).

### Shrine looting reward text — gold only

Used to claim "looted 400 gold, 40 meat, 100 teef" but neither the meat nor the teef ever arrived. Phantom text. Now only the actual gold reward is shown.

### Extorsion — taking teef from your own orcs

The teef icon next to a T4+ orc in your party (Big'Un, Black Orc Brute/Boss/Berzerka, Warboss) now actually grants you teef each daily tick. Before, the flag was set, but the daily tick refused to grant the teef because the mod was blocking TOR's gain calculation. Now the calculation runs, the teef arrive.

### AI strength estimation — orcs read correctly

Imperial AI used to attack 600-vs-200 orc parties and melt (the AI didn't account for the orc HP buff). Now an orc troop's power is rated ×2.5 in AI "should I attack?" estimation and ×1.6 in real combat calculation. AI lords see orc parties as a real threat and avoid unwinnable fights. Goblins on the other hand are rated ×0.8 — weak on their own, so the AI is less afraid of pure-goblin warbands.

### Greenskin appetite

Your own party with orcs and goblins now eats noticeably more food: **+0.15 food per day per greenskin** in your roster. Lore-fitting "orcs are gluttons". AI orc lords are not affected — otherwise they starved and lost troops as wounded in castles.

### Localization

All new texts (goblin dialogue, popups, hints, post-trade messages) translated into 11 languages: EN, RU, DE, FR, ES, IT, PL, TR, BR, CNs, CNt. The goblin moneychanger's orc-speak is preserved in every language — he sounds equally silly in every version.

### Not changed

- In-game settings menu (Ctrl+O / button in the main menu) — works as in the previous release.
- All balance parameters left as-is (orc HP, army caps, troll cave etc.).
- In-game guide — unchanged.

---

## 2026-05-13 — Release: in-game settings menu + balance fixes from player feedback

Bundled patch since the previous Steam Workshop release (2026-05-07). Headline feature is the in-game settings menu — no more waiting for mod updates to tweak balance to taste. Plus a series of targeted nerfs to orcs, trolls, and the troll cave based on player feedback.

### In-game settings menu

Main feature of this release. Two entry points:

- **Bannerlord main menu** — new `Lore-Hardcore Settings` button next to «Mods». Shows everything including system toggles (require game restart to take effect).
- **Ctrl+O during campaign** — on the map screen, any time. Only shows parameters that can change live.

What's there:

- **Left — race selector:** Orcs (active), Chaos (1 toggle — Chaos recruiting), Empire / Dwarves / Bretonnia (placeholders for future phases).
- **Top — tabs:** Battle / Armies / AI hiring / Economy / Caves / Systems.
- **Each row:** category icon + name + `−` `+` buttons (5% step of range) + value + `R` (per-parameter reset) + hint showing when change applies (immediate / next tick / new spawns / game restart).
- **Footer:** `Reset race` / `Reset ALL` (with confirmation dialog) / `Save` / `Close`.

What's configurable (50+ parameters): orc/goblin/ogre HP and damage (separate values for battles with the player vs AI-vs-AI), party and army caps, AI hire chances, upgrade costs and AI discounts, meat per prisoner, brawl/shrine rewards, hideout cooldown, troll cave limits, goblin speed, stun durations, etc.

Settings persist in `Documents\Mount and Blade II Bannerlord\Configs\LoreHardcore\user_settings.xml` — survive mod updates via Steam Workshop. If the file is corrupt or missing — defaults kick in, mod doesn't crash.

Settings UI localized in 11 languages: EN/RU/DE/FR/SP/IT/PL/TR/BR/CNs/CNt (all through TextObject keys). JP/KO fall back to English.

### Orc army cap — ~700 (was over 1000)

Multiple player complaints in a row: «orcs capture half the map again», «10 lords = 1 army of 2980 trolls, smashes a castle of 700». Series of targeted nerfs brings the overall army ceiling down to a sensible number:

- **AI lord party cap: 140** (was a soft cap of 150 since v0.1.4.80; before that 180+ via the clan-tier × Leadership formula). A single lord still feels dangerous — not the "80 too small" complaint level from earlier.
- **WAAAGH! army size: 4 joined + leader = 5 parties** (was 6+1 = 7, before that 4+1).
- **Army ceiling: 5 × 140 = 700** troops (down from 1050+). In practice the map shows ~450-630 (recruitment ×0.25 prevents lords from filling the cap).
- Player is not touched — they have their own formula with goblin companion bonuses.

### Orc HP cut by 10%

After the hard army cap landed, orcs still felt too dense. HP multipliers trimmed:

- **Orc HP in live battles with the player:** ×1.40 → **×1.26** (-10%).
- **Orc HP in AI vs AI battles:** ×1.20 → **×1.08** (-10%).
- Goblins and trolls handled separately (see below).

This doesn't make an orc weaker than a human (×1.26 = +26% HP), just removes the excess durability that was letting orc armies outlast numerical disadvantages too easily.

### Ogres in AI-vs-AI battles — 35% HP nerf

Main complaint after the previous release: «Empire wins, only 3 trolls left on the orc side, those 3 wipe out 50 humans in a row». Root cause — in observed-from-map battles (no player in the Mission) the engine has no surround mechanic: 50 humans can attack a troll but path-finding and animation slots prevent them from all hitting at once. In live battles with the player this resolves tactically (the troll is genuinely encircled), but in AI vs AI — it doesn't.

Fix — a separate HP multiplier for ogre-sized units in AI vs AI:

- **Ogres (trolls, Big Uns, Black Orc Brute/Boss/Berzerka, warbosses) in AI vs AI:** HP × **0.70** (instead of the regular ×1.08).
- A vanilla 750 HP troll → 525 HP in observed battles (was 810). 50 Imperials now finish the troll in 0.7 seconds, not 1.1 — they bring him down before he butchers the line.
- **In live battles with the player ogres are not touched** — tactical surround works.

### Troll cave

Two fixes from feedback:

- **Luring trolls with meat — off by default.** Vanilla TOR let you buy a T6 troll (~4500g recruit-equivalent) for 10 meat. A day or two of prisoner farming and a death machine joins the party. That's a broken trade. Option hidden from the cave menu. Can be re-enabled in Settings if you want vanilla.
- **You can take 40 troops into the cave clear-out** (was 20). 7 trolls in the cave one-on-one tear through 20 humans even without grouping — now there's an actual numerical advantage for the assault.

### What did NOT change

- Tooth economy, orc sieges, prisoner cannibalism, castle duels, orc career quests, orc morale/WAAAGH! — all working as in the 2026-05-07 release.
- In-game guide (hotkey H) — unchanged.

### Localization

Settings menu translated into 11 languages. ~160 keys per language (label + tooltip + category). Glossary frozen: «Orc → Орк/Ork/Orco/Orque/兽人/獸人», «Goblin → Гоблин/Goblin/哥布林», «Troll → Тролль/Troll/巨魔», «Ogre → Огр/Oger/Ogre/Ogro/食人魔», «Lord → Лорд/Lord/领主/領主». «WAAAGH! / TeefEconomy / Big Un / Mousillon / Bretonnia» left untranslated as proper nouns.

---

## 2026-05-07 — Release: orcs reworked into a lore-accurate Warhammer front-end

Bundled patch covering everything since the previous Steam Workshop release. Several major systems redone end-to-end: tooth economy, cannibalism, AI orc balance on the campaign map, trolls, goblin hordes, orc sieges, career quests. Plus an in-game guide in 13 languages.

### Tooth economy — always on for orcs

The start-of-game choice dialog ("gold or teef?") is **gone**. Orcs/goblins (aserai culture) always use teef. It's a rule, not a setting.

- In orc settlements you pay teef for everything. In human/dwarf/elf cities — gold as before.
- Starting +10 teef bonus reliably credited on a new game (fixed wait-for-Hero edge case on slow machines).
- Orc parties no longer drain the clan's gold budget. The "unpaid wage morale" popup is suppressed for orc-led parties.
- Teef are earned ONLY in real combat: T4+ kill, lord kill, brawl win, castle challenge, daily tribute from your orc fiefs.

### Orc sieges

- **Orcs no longer build trebuchets.** By lore: a counterweight machine with parabolic trajectory math is too engineered for an orc. Ballistas, onagers, catapults (including fire variants) remain.
- **Battering ram buffed 5×.** In a real castle siege gates fall in 5–10 hits instead of 30+, ram holds out 3.5× longer. By lore: a log with a "tooth-grinder" skull, iron-clad, shoved by eight burly orcs. Same buff in auto-resolve.

### Prisoner cannibalism — march hunger only

Orcs used to be able to "slaughter prisoners" in the loot screen or at the Quartermaster and got bags of meat automatically. This turned meat into the clan's main commodity.

- **Auto-slaughter in the loot screen: 0 meat.**
- **"Slaughter" button at the Quartermaster: 0 meat.**
- **Battle-kill meat for orc-player victories: 0** (TOR auto-formula disabled for player victories). AI orcs keep the formula or they'd starve.
- **Meat now comes ONLY from march hunger.** Each in-game hour with empty larder: eats one prisoner first (1 meat), then a goblin (1 meat). Lords and companions are never eaten (lord = ransom, companion = quest line).

Lore: orcs eat captives alive on the road, not at a butcher's block.

### AI orc balance on the campaign map

Players reported "10 orc lords = 3000 stack", "orc armies are unkillable even by a strong human kingdom", "AI-vs-AI battles wipe everyone".

- **AI orc party size: soft cap 80 troops** (was 180–250 per vanilla clan-tier × Leadership formula). Player has a separate formula — not affected. Cap is soft: if an AI lord already had 150, his limit is set to 150 (no forced desertion).
- **Orc marshals collect at most 5 parties into an Army** (1 leader + 4 called clans). Previously 8–12 parties = a 2000+ stack. Now orc Armies are 400–500-strong mini-stacks.
- **AI strength estimation.** Imperial AI rates orcs as ×1.8, goblins ×0.8, trolls/Big'Uns/warbosses ×3.0. Previously rated as plain humans — AI walked 500 vs 500 into 500 orcs and lost. Now correctly sees ~900 effective power and prefers defending or rallying more troops.
- **Auto-resolve buff for orcs removed.** Orcs no longer get +15% to damage in the auto-resolve formula.
- **AI lords' goblin hire in orc villages** cut to a third.
- **Daily teef income for AI clan leaders** cut from 10 to 3.
- **Major orc factions trimmed:** Massif Choppas: 22 → 14 lords; Crooked Eye, Red Eye: 19 → 17 each. Massif Choppas capital prosperity (town_MC1): 2800 → 2200.

Personal combat against orcs is unchanged — orcs in a real battle are as scary as ever (HP +40%, morale ×1.5, elite never panics). Only AI strategic dominance got trimmed.

### Trolls — no more 170-strong herds

Three independent sources of "troll armies" found in TOR. Clamped all three:

- **TOR behavior adding trolls to AI lords:** every time an AI orc lord enters an orc settlement, a troll is added with 15% chance (vanilla cap = 20 per party). An army of 8-9 lords accumulated 160-180 trolls in one stack. **Cap reduced from 20 to 1.** Chance from 15% to **2%**. An AI lord needs ~50 settlement visits to get a troll. Player unaffected.
- **Troll Cave hideout:** BattlePartySize lowered from 200 to **50** → ~2-3 trolls in the first wave (was 7-10). Cave is clearable by a small squad but still a serious fight.
- **Troll Cave raid parties:** each capped at **10 trolls** (was 7-15). Maximum concurrent raid parties per cave: **2** (was 5). Daily spawn chance: **5%** (was 10%).

Result: max per cave = 2 × 10 = 20 trolls. Even 4 caves nearby give 80, not 170+.

### Goblin hordes scale over time

Previously **goblin caravans** (`greenskins_caravan_template`) were a fixed roster — 8 beast_prodda + 6 stone_slugga = 14 goblins flat. Now they **scale by campaign day**:

- Day 0–30 — caravans of 10–30 goblins.
- Day 100 — 100+ goblins.
- Day 300+ — up to **300 goblins in a single caravan**.

Existing parties aren't recalculated — they die off naturally; new spawns are larger. Lore: the longer the campaign runs, the more chaos in the Old World — goblin hordes swell, raids get serious.

### Orc career quests reworked

Player complaint: "no idea how to level the career". The career unlocks through 4 quests (Orc Boss 1/2 and Shaman 1/2). Vanilla requirements are tuned for vanilla TOR teef income. Our mod cut teef income for AI balance reasons — quest gates became near-impossible.

Cut all requirements via Harmony patch on `InitializeQuest`:

- **Orc Boss 1** (Tier 2): One-Handed 125 → **80**, Two-Handed 125 → **80**, Polearm 125 → **30**, 50 battles → **30**, 15 tournaments → **5**, 25 brawls → **10**, 150 000 teef → **2 000**.
- **Orc Boss 2** (Tier 3): One-Handed 200 → **150**, Two-Handed 200 → **120**, Polearm 200 → **60**, 250 battles → **70**, 35 tournaments → **15**, 75 brawls → **20**, 12 lord duels → **5**, 5 cities, 500 000 teef → **10 000**.
- **Shaman 1** (Tier 2): Spellcraft 150 → **50**, Faith 100 → **50**, 5 enchantments → **3**, 125 000 teef → **2 000**, 15 shrines looted → **5**.
- **Shaman 2** (Tier 3): Spellcraft 225 → **120**, Faith 150 → **100**, 10 enchantments → **8**, 250 000 teef → **10 000**, 5 cities, 30 shrines.

Career is now achievable in a single normal campaign — Tier 2 in ~15-25 hours instead of ~80, Tier 3 in ~40-60 instead of ~120.

### Chaos vassal can now hire chaos troops

Vanilla Bannerlord blocks culture-recruit hire when the player is a vassal of a kingdom of "wrong" culture. This broke the RP of a chaos orc / human under Archaon — couldn't hire a chaos warrior. The patch lets vassals of a chaos kingdom bypass the vanilla check.

### Brawl arena

- **In conquered non-orc cities** (Bretonnian, Imperial taverns) entering the brawl produced a "cannot find entry point" shader error on older GPUs. The atmosphere shader is suppressed in those scenes — the arena now works without errors.
- **Runaway enemies no longer freeze the match.** On some arenas FFA goblins/orcs fell off balconies into out-of-bounds and hovered as "unreachable" — arena never ended. Now we check every second and finish off the fallen one.
- **Goblins no longer spawn on the roof.** With the enlarged 18-enemy roster vanilla TOR used spawn points on the upper levels of the arena. If a goblin spawns higher than 1.5 m above the floor — teleport to floor.

### Castle warboss duel

In the castle 1v1 challenge the "you get N teef" line was shown but the counter didn't move — our own guard against TOR-side teef spam was accidentally catching our own legitimate calls. Rewritten to a direct path that bypasses the guard. Teef for a duel win — now guaranteed.

### In-game guide

Player report: "too many mechanics nobody understands". We built our own encyclopedia **inside the game** — no need to dig through README or forum threads.

- **Hotkey H** on the campaign map opens "Lore-Hardcore — In-Game Guide" with 8 topics: Tooth Economy, Career from Bully to Boss (or Shaman), Orc Morale and WAAAGH!, Castle Duel Challenge, Orc Sieges and the Ram, Prisoner Cannibalism, Greenskin Brawl Arena, Executing Racial Enemies.
- Pick a topic → detailed description with mechanics, numbers, lore context.
- **Translated to all 13 languages:** English, Русский, Deutsch, Français, Español, Italiano, Polski, Türkçe, Português (BR), 简体中文, 繁體中文, 日本語, 한국어. Asian translations (CN/JP/KO) are best-effort machine; native review welcome via GitHub issues.

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
