-- "tuicrex install" wrote this file. To remove it, run "tuicrex uninstall".
--
-- These are your settings of tuicrex. To change a setting, edit it, then run
-- "rex config reload". tuicrex does not change this file. The action is in
-- tuicrex_toggle.lua.
local settings = {
  -- key = "shift+cmd+r", -- the key of the toggle, or false for none
  -- placement = "split", -- split, zoomed, tab, or overlay
  -- direction = "right", -- of the split: right or down
  -- args = { "-w" },     -- the arguments of tuicr; tuicrex adds --stdout
  -- since_review = true, -- after a review, show only what changed since it
  -- focus_agent = true,  -- focus the agent after tuicrex pastes the review
}

-- tuicrex_toggle.lua has the toggle action, and tuicrex writes it. If it
-- fails, the rest of Rex's config still loads, and the key shows why.
local ok, err = pcall(function() require("tuicrex_toggle")(settings) end)
if not ok then
  rex.action{ name = "tuicrex_toggle", title = "Toggle tuicrex",
    run = function() error("tuicrex: " .. tostring(err), 0) end }
  local key = type(settings) == "table" and settings.key
  if key == nil then key = "shift+cmd+r" end
  if key then rex.bind(key, "tuicrex_toggle") end
end
