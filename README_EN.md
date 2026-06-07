# Lore-Hardcore

A balance mod for **The Old Realms** — Warhammer flavor instead of medieval Europe.

## What it's about

Straight to the point: in vanilla TOR a fight of 100 orcs vs 100 Imperials almost always plays out 50/50. Factions feel like "orcs have a bit more HP". This mod rebuilds things so orcs are scary, goblins are swarm fodder, trolls are lone monsters, and battle outcomes depend on terrain, gear and skill — not just numbers.

---

## What changed

### Orcs

A regular orc no longer folds against peasants. It's tougher, hits harder, takes punishment longer. The bigger the orc the scarier it gets: black orcs tear through formations, berserkers shatter shields in one swing. In return everything costs more — recruiting and upgrades alike. Orc villages make you wait for recruits. You can't just pick up a Black Orc at a village anymore — it only comes through a long upgrade chain or arena victory.

**Orcs don't run.** Where vanilla orcs would panic and rout like militia, our orcs fight to the death. Low morale doesn't break them.

**WAAAGH! on kill.** Whenever an orc kills an enemy, his side's morale gain is multiplied by 1.5. One good kill makes the orcs nearby angrier. The more you kill, the scarier the mob becomes.

**Orcish cannibalism.** When an orc party runs out of food, prisoners are eaten first, then goblins from its own roster. Lords and companions are spared (a lord is worth a ransom). Each in-game hour with empty larder = one prisoner or one goblin = 1 meat. Auto-slaughter after a battle gives nothing — orc food only comes from a hunger march. Log message: "Out of food — the orcs ate a prisoner (Imperial Recruit). Prisoners left: N".

**Upgrade prices fixed.** It used to be cheaper to buy a high-tier orc directly than to buy a base orc and upgrade. Now the upgrade chain is always cheaper than direct purchase at every tier — savings from 17% (orc → boy) up to 37% (choppa → big'un).

Orc parties also eat a lot more: campaigning with them is expensive, occupying the map with them hurts your wallet.

**Tooth economy.** Orcs and goblins pay in teef, not gold. Tribute from your orc fiefs, rewards for lord/elite kills, castle duel stakes, a daily trickle from each orc holding you own. In human/dwarf/elf cities — regular gold as before. It's a rule, not a setting — no choice dialog at game start.

**Castle duel challenge.** Visit an orc castle and an option appears: "Challenge to a duel" — stake teef, fight a real 1v1 on a castle scene. Win — the elite orc joins your party as a trophy unit, plus +15 teef. Lose — the stake is gone, castle reputation drops temporarily. Stakes scale by elite rank: Big'Un ~50 teef, Black Orc ~150, Boss ~250.

### Orc sieges

Orcs **can't build trebuchets.** By lore: a counterweight machine with parabolic trajectory math is too engineered for an orc. Available siege engines: ballistas, onagers, catapults (including fire variants) — simple "bonk!"-machines an orc gets. Removed both for attacking orcs and for defending orc towns.

**Battering ram beefed up.** In a real castle siege the ram hits 5× harder (gates fall in 5–10 hits instead of 30+) and holds out 3.5× longer. By lore: a log with a "tooth-grinder" skull, iron-clad, shoved by eight burly orcs. Auto-resolve gets the same buff.

### Goblins

They stay what the lore says — cheap, fragile, a crowd. But there's a perk: when you recruit an orc, a small band of goblin companions tags along for free. The bigger the orc, the more goblins. In party-limit math they weigh half as much as regular troops, so your green horde is actually a horde, not a dozen.

### Trolls

Now they're real tanks. Huge HP, terrifying damage. Price matches — a troll is expensive to keep, and you can't have more than two in a party. Facing one used to be annoying. Now it makes you want to run.

### Troll cave

Used to be a grinder — a dozen trolls against your small party, clearing it was almost impossible. Now there are three times fewer defenders, and it's actually doable — still a serious fight.

### Arena in the orc town ("Greenskin Brawl")

Used to be empty and boring: four fighters, random loot, that's it. Now there are **18 opponents** in a free-for-all (6 boys + 4 orcs + 8 goblins), and it's a proper brawl — every fighter on their own team, even the orc boys fight each other. The reward is finally honest: it **scales with how many enemies you personally kill**, not with a dice roll.

- Killed just a few — goblins as a participation gift.
- Killed half the arena — a solid mix of different orcs.
- Won the whole thing solo — a Black Orc, two Big'Uns, plus a diversity bonus for killing different types.

After the fight the menu tells you: "you personally defeated 12 out of 18" — so you know exactly where the loot came from.

**Random spawn.** Before, the player always spawned at the same fixed point — and by the time you reached the enemies, half the brawl had already finished itself off. Now spawn is random: sometimes you start at the edge, sometimes right in the middle of the chaos.

### Orc bows

"Aim like crap, hit like a truck". Arrows fly in a visible arc, most of them miss — but a hit really hurts. Not a generic green-icon bow anymore, something with character.

### Equipment and lord parties

The four orc character-creation paths each start with distinct gear — you can tell at a glance who the boss is, who the brawler, who the boar rider, and who's the shaman. Orc lord parties now look like a proper horde: lots of goblin wolf riders, a solid mid-tier orc core, and a thin elite of Black Orcs — instead of the old wall of elites you couldn't break through.

### In-game guide

Player feedback: "I can't tell how to use half the mechanics." We built our own encyclopedia **inside the game**, no need to dig through forums or this README.

- **Hotkey H** on the campaign map opens the "Lore-Hardcore — Guide" with 8 topics: Tooth Economy, Career path (Bully → Boss / Shaman), Orc Morale & WAAAGH!, Castle Duel Challenge, Orc Sieges & Ram, Prisoner Cannibalism, Greenskin Brawl Arena, Executing Racial Enemies.
- Pick a topic — full description with mechanics, numbers, and lore context.
- Translated to all 13 supported languages. Asian translations (CN/JP/KO) are best-effort machine; native review welcome via GitHub issues.

### Chaos — playable faction (beta, new in 2026-05-21 release)

Chaos used to be background flavour: every 126 days vanilla TOR would spawn a 4-lord uprising that got crushed in a week. Now uprisings happen **every 30 days** (tunable in settings), and the player can join the Dark Gods themselves.

- **Chaos vassalage.** Any Chaos lord on the map → dialogue → option "I want to serve the Dark Gods". Pay 50,000 gold tribute, join the Chaos kingdom, and receive 15 pieces of equipment for the four gods (Khorne / Nurgle / Slaanesh / Tzeentch + Undivided + Chaos horse).
- **Dark Pact.** After vassalage you can perform a ritual with a Chaos lord → your culture changes to `chaos_culture`, +XP to combat skills. This fixes the culture mismatch that hurts loyalty when you eventually carve out your own Chaos kingdom — vassal towns lose loyalty if the lord's culture doesn't match.
- **Captive tempting.** Every enemy lord you take prisoner accumulates "recruitment progress" (1.5/day, +50% if you're already chaos culture). At 100% → dialogue option "Take the Pact" → the lord defects to you. Chaos grows without needing to expand by war alone.
- **Peace talks on the map.** Before there was only "Attack / Leave" with foreign Chaos lords. Now an independent-clan player gets a "Talk (we're both watched by the Gods)" option — no threats, can open the way to vassalage or just walk away.
- **Dark diplomacy.** Vanilla TOR blocked any peace between Chaos, greenskins, vampires, Mousillon and Beastmen — peace and alliances between these "dark" factions are now possible.
- **DarkEnergy for the Chaos player (v0.1.5.73).** Dark energy now works for Chaos race too, not just undead: icon, tooltip, battlefield accrual, rituals and enchanting no longer NRE-crash.

**Chaos troops:**
- Norscans +30% HP, Beastmen Gor +25%, Minotaurs +50% — lore-wise "bigger and stronger than a man".
- Cultists / Ungors — fodder with no HP buff, but **+1 to party cap** per two of them (mirroring the undead prisoner mechanic).
- Cultist / Ungor / Gor / Minotaur recruitment — in dark-aligned settlements (chaos / forest_bandits / steppe_bandits / aserai / khuzait / mousillon) if the player is chaos-aligned.
- Cultist and Beastmen hideouts now offer a "Pass peacefully" option to chaos players.

**Master toggle.** Settings has a "Main → Chaos" tab with a single big "ENABLE overhaul" switch. **Off by default** (the mod starts with vanilla TOR balance for Chaos). Flip it on — all our Chaos patches activate on the next game load. Orcs have the same toggle (default ON for them).

> **Beta faction.** The Chaos overhaul is written and tested, but it's a large new system — expect edge cases. Report them as GitHub issues with the rgl_log attached. We'll drop the beta tag after 2-3 weeks of clean reports.

### Settings menu (new in 2026-05-13 release)

Any numeric balance parameter can now be tweaked right inside the game — no config-file editing, no waiting for mod updates.

- **Bannerlord main menu:** new `Lore-Hardcore Settings` button next to «Mods». Everything including system toggles (require game restart).
- **Ctrl+O in campaign:** on the map screen, any time. Only parameters that apply live.
- **50+ settings:** orc/goblin/ogre HP and damage (separate for player battles vs AI-vs-AI), party and army caps, AI hire chances, upgrade costs, brawl/shrine rewards, hideout cooldown, troll cave limits, goblin speed, and more.
- **Left — race selector** (Orcs active, Chaos with a single toggle, the rest placeholders for future phases). **Top — tabs** (Battle / Armies / AI hiring / Economy / Caves / Systems).
- Each setting shows when it applies: ⚡ immediate, 🕐 within a second, 🌍 to new spawns, 🔄 after game restart.
- **Stored in `Documents/Mount and Blade II Bannerlord/Configs/LoreHardcore/`** — survives mod updates via Workshop.

---

## Installation

1. Extract the `LoreHardcore` folder into `Mount & Blade II Bannerlord/Modules/`.
2. Enable **LoreHardcore — TOR Balance Overhaul** in the launcher.
3. Launch the game.

Load order is set automatically, but for reference: Harmony → Native → SandBoxCore → Sandbox → CustomBattle → StoryMode → TOR_Core → TOR_Armory → **LoreHardcore**.

## Requirements

- Mount & Blade II: Bannerlord (1.3.15)
- The Old Realms (Steam Workshop)
- Bannerlord.Harmony (Steam Workshop)
- TOR_Armory (comes with TOR)

## If something breaks

File an issue on GitHub. Attach any recent `rgl_log_*.txt` from:
`C:\ProgramData\Mount and Blade II Bannerlord\logs\`

## Author's Telegram channel

<https://t.me/CodeRickTg>

## License

MIT. Use, modify, fork freely — credit appreciated.
