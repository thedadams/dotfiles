-- tuicrex writes this file. Do not edit it. Your settings are in tuicrex.lua.
local BIN = "/Users/thedadams/.local/bin/tuicrex"
-- This is the code of the "Toggle tuicrex" action. "tuicrex install" writes
-- it to tuicrex_toggle.lua, under the line that sets BIN, the path of
-- tuicrex. tuicrex.lua calls the function at the end with the settings.

local PLACEMENTS = { split = true, zoomed = true, tab = true, overlay = true }
local DIRECTIONS = { right = "horizontal", down = "vertical" }
local TERM = "com.superlogical.terminal"
local LABEL = "tuicrex"

-- must returns res, or fails the action with err. A Rex call returns nil
-- and an error message when it fails.
local function must(res, err)
  if err ~= nil then error(err, 0) end
  return res
end

-- call calls method on the terminal block with the ID id.
local function call(method, id)
  return must(rex.block.call(TERM, method, { block_id = id }))
end

-- reviewers returns the IDs of the blocks in the session that run tuicrex.
-- The action labels each block it opens, and the block closes when tuicrex
-- exits.
local function reviewers()
  local ids = {}
  for _, b in ipairs(must(rex.session.list_blocks{}).blocks or {}) do
    if b.creator_name == TERM and b.label == LABEL then
      table.insert(ids, b.block_id)
    end
  end
  return ids
end

-- command returns the command line of tuicrex for the agent in ctx.
local function command(ctx, opts)
  local argv = { BIN, "--agent", ctx.block_id }
  if opts.since_review ~= false then table.insert(argv, "--since-review") end
  if opts.focus_agent == false then table.insert(argv, "--no-focus") end
  table.insert(argv, "--")
  for _, a in ipairs(opts.args) do table.insert(argv, a) end
  return argv
end

-- open_tuicrex opens tuicrex at placement, beside the agent in ctx. A split
-- opens in direction, right or down. tuicrex starts in the current
-- directory of the agent, through the login shell of the user, so that it
-- finds tuicr and rex in PATH.
local function open_tuicrex(ctx, placement, direction, opts)
  local p = call("process", ctx.block_id)
  local cwd = (p.foreground or {}).cwd or (p.child or {}).cwd
  local node = rex.layout.block{
    flavor = TERM .. ".shell",
    label = LABEL,
    options = { command = command(ctx, opts), cwd = cwd },
  }
  if placement == "tab" then
    return must(rex.session.new_window{ window_label = LABEL, layout = node })
  elseif placement == "overlay" then
    return must(rex.session.new_layer{
      bounds = { 0.04, 0.04, 0.92, 0.92 },
      layout = node,
      focus = true,
    })
  end
  local s = must(rex.session.new_split{
    anchor_id = ctx.block_id,
    direction = DIRECTIONS[direction],
    side = "after",
    ratio = 0.5,
    focus = true,
    layout = node,
  })
  if placement == "zoomed" then
    must(rex.session.zoom_block{ block_id = s.block_ids[1], zoom = true })
  end
  return s
end

-- The function gets the settings of tuicrex.lua, and adds the action and
-- its key.
return function(settings)
  if type(settings) ~= "table" then
    error("config: settings must be a table, as in: local settings = { }", 0)
  end
  local key = settings.key
  if key == nil then key = "shift+cmd+r" end
  local default_placement = settings.placement or "split"
  local direction = settings.direction or "right"
  if not DIRECTIONS[direction] then
    error("config: unknown direction " .. tostring(direction) .. "; use right or down", 0)
  end
  local opts = {
    args = settings.args or { "-w" },
    since_review = settings.since_review,
    focus_agent = settings.focus_agent,
  }
  if type(opts.args) ~= "table" then
    error("config: args must be a list of strings, as in: args = { \"-w\" }", 0)
  end
  for _, a in ipairs(opts.args) do
    if type(a) ~= "string" then
      error("config: args must be a list of strings, as in: args = { \"-w\" }", 0)
    end
  end

  rex.action{
    name = "tuicrex_toggle",
    title = "Toggle tuicrex",
    description = "Review the agent's changes in tuicr and paste the review into the agent",
    category = "tuicrex",
    keywords = "tuicr diff review comments agent",
    args = { placement = "string?" }, -- split, zoomed, tab, or overlay
    run = function(ctx, args)
      local placement = args.placement or default_placement
      if not PLACEMENTS[placement] then
        error("unknown placement " .. tostring(placement)
          .. "; use split, zoomed, tab, or overlay", 0)
      end
      local open = reviewers()
      if #open == 0 then
        return open_tuicrex(ctx, placement, direction, opts)
      end
      for _, id in ipairs(open) do
        must(rex.call("block.close", { session_id = ctx.session_id, block_id = id }))
      end
      return { closed = open }
    end,
  }
  if key then rex.bind(key, "tuicrex_toggle") end
end
