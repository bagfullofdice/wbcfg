-- White Box Cyclopedia framework. No copyrighted compendium text is bundled.
function onInit()
  Comm.registerSlashHandler("wbcspells", openSpells);
  ActionsManager.registerResultHandler("wbcsave", onSave);
  ActionsManager.registerResultHandler("wbcattack", onAttack);
end
function openSpells()
  if Session.IsHost then
    Interface.openWindow("wbc_spell_library", "");
  else
    ChatManager.SystemMessage("The GM manages the spell library; use your character's Spells button.");
  end
end
function roll(node, kind)
  local actor = ActorManager.resolveActor(node);
  local r = { aDice = { "d20" }, nMod = 0 };
  if kind == "save" then
    r.sType = "wbcsave";
    r.nMod = DB.getValue(node, "savebonus", 0);
    r.nTarget = DB.getValue(node, "save", 15);
    r.sDesc = "[SAVE] Target " .. r.nTarget;
  else
    r.sType = "wbcattack";
    r.nMod = DB.getValue(node, "attackbonus", 0);
    r.sDesc = "[ATTACK] Compare total to ascending AC (19 - descending AC)";
  end
  ActionsManager.performAction(nil, actor, r);
end
function onSave(source, target, roll)
  local message = ActionsManager.createActionMessage(source, roll);
  local total = ActionsManager.total(roll);
  if total >= (tonumber(roll.nTarget) or 15) then
    message.text = message.text .. " [SUCCESS]";
  else
    message.text = message.text .. " [FAILURE]";
  end
  Comm.deliverChatMessage(message);
end
function onAttack(source, target, roll)
  -- No target or damage automation in the framework release.
  Comm.deliverChatMessage(ActionsManager.createActionMessage(source, roll));
end
