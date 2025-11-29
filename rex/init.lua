require("tuicrex")

rex.action{
  name = "new_floating_terminal",
  title = "New Floating Terminal",
  category = "Pane",
  run = function(ctx)
    local process = assert(rex.block.call("com.superlogical.terminal", "process", {
      block_id = ctx.block_id,
    }))
    -- Prefer the running command's directory, falling back to the terminal's shell.
    local cwd = (process.foreground or {}).cwd or (process.child or {}).cwd

    -- Server-created terminals do not inherit the Mac app's startup command.
    local setting = assert(rex.exec({
      "/usr/bin/defaults", "read", "com.superlogical.rex",
      "Workspace.terminalStartupCommand",
    }))
    assert(setting.ok, setting.stderr)
    local startup = setting.stdout:gsub("%s+$", "")

    return assert(rex.session.new_layer{
      bounds = { 0.1, 0.1, 0.8, 0.8 },
      layout = rex.layout.block{
        flavor = "com.superlogical.terminal.shell",
        -- Replace the login shell so exiting the startup command closes the block.
        options = {
          cwd = cwd,
          initial_input = startup ~= "" and ("exec " .. startup .. "\n") or "",
        },
      },
      focus = true,
    })
  end,
}

rex.bind("alt+cmd+f", "new_floating_terminal")
