# Fantasy Grounds Unity smoke test

Run with current Fantasy Grounds Unity and CoreRPG. Record the client version and CoreRPG version when reporting failures. This checklist has not been run in the development environment.

1. Install the PAK, start a new campaign, and verify there are no console errors.
2. Create a character from Characters. Enter a name, ability scores, level and HP. Close, reopen and restart the campaign; confirm persistence.
3. Open each character list. Right-click to create a record, name it, click Open, edit details, reopen, then delete a disposable entry.
4. Create an NPC and item through the CoreRPG sidebar. Confirm the WBC fields appear and persist.
5. As GM run `/wbcspells`, create a spell and edit its description. Confirm it survives a restart.
6. Enter save 15 and modifier +2. Double-click Saving throw. A die result of 13 or higher should succeed. Confirm attack rolls apply only the entered attack bonus.
7. Join as a player, assign a character, and verify the player can edit and roll their character without editing other characters or GM records. Confirm rolls appear once on both clients.
8. Check list overflow, close buttons, text readability and window dimensions. Confirm ordinary CoreRPG maps and chat still work.
9. Try a disposable combat tracker entry. WBC-specific tracker statistics and damage/target automation are not implemented; document any CoreRPG integration errors for the next milestone.
