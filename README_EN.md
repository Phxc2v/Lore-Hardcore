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

**Orcish cannibalism.** When an orc party runs out of food, it eats one goblin per hour from its own roster. If it's your party — you'll see a log message: "Out of food — the party ate a goblin (name). Goblins left: N". Orcs don't starve while goblins are around.

**Upgrade prices fixed.** It used to be cheaper to buy a high-tier orc directly than to buy a base orc and upgrade. Now the upgrade chain is always cheaper than direct purchase at every tier — savings from 17% (orc → boy) up to 37% (choppa → big'un).

Orc parties also eat a lot more: campaigning with them is expensive, occupying the map with them hurts your wallet.

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
