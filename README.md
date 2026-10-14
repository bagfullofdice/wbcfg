# White Box Cyclopedia for Fantasy Grounds

Unofficial version 0.1.0 ruleset framework layered on CoreRPG. Separate from the Foundry `wbc` system; no shared save format.

## Installation

Run `python tools/build.py` (Python 3.10+) and copy `dist/WhiteBoxCyclopedia.pak` into your Fantasy Grounds data folder's `rulesets` directory. Restart Fantasy Grounds and create a new WhiteBoxCyclopedia campaign. Alternatively, download and extract the GitHub Actions artifact after the source is pushed.

Fantasy Grounds uses a PAK file, not a Foundry manifest URL.

## Features

Character sheets contain six abilities, ancestry, class, level, XP, alignment, HP, descending AC, attack bonus, save target/modifier, movement, gold and biography. Buttons open local inventory, spells and abilities. Right-click a list to add/delete entries; click Open to edit details.

NPC records include HD, HP, AC, attacks, saves, movement, morale, XP and notes. Item records include type, cost, weight, damage expression, armor AC, range and source/page. Spell records include level, class/tradition, range, duration, prepared uses, description and source/page. As GM, use `/wbcspells` for the campaign spell library.

Double-click Attack bonus for d20 plus the entered bonus. Adjudicate hits manually; the ascending AC comparison (19 minus descending AC) is a convenience. Double-click Saving throw for d20 plus Save modifier against the entered target; equality succeeds. Progression and situational modifiers are manual. Damage and spell consumption are not automated. Lists currently require manual entry, without library drag-and-drop.

## Validation and next steps

Build checks XML, include paths and archive integrity. Lua syntax and save boundary/attack modifier logic were checked using a mocked FG API. Fantasy Grounds is unavailable in the development environment: loading, layout, CoreRPG integration and multiplayer permissions still require in-app testing. This is a starting framework, not a verified production ruleset.

Smoke test in a new disposable campaign: create and reopen a character, NPC and item; create/edit/delete inventory, spell and ability entries; run `/wbcspells`; test save success at equality and failure one below; test attack modifiers; restart to verify persistence; join as player to check ownership and chat delivery. Capture console errors with client/CoreRPG versions.

Next: in-app compatibility fixes, tabs/portraits, drag-and-drop, progression helpers, optional rules, and combat tracker/target/damage automation.

## Development

`base.xml` imports CoreRPG. `campaign/records.xml` defines records and lists. `scripts/manager_wbc.lua` handles rolls and commands. `tools/build.py` builds the PAK. GitHub Actions packages source on pushes and pull requests.

Reference: James M. Spahn's White Box Cyclopedia (2023). Quarterly 1–4 and Dungeon Adventures Special Edition are planned expansion sources. No source PDF text, illustrations, spell descriptions, advancement tables or adventure content is bundled or committed. Entries have source/page fields for personal campaign data.

Independent fan software, not endorsed by Barrel Rider Games, Gallant Knight Games, Mythmere Games or SmiteWorks. Fantasy Grounds/CoreRPG are required separately. Review publication licenses before distributing future content modules.

Official developer guide: https://fantasygroundsunity.atlassian.net/wiki/spaces/FGCP/pages/996644412/Creating+a+Ruleset+-+Overview
