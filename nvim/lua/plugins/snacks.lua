return {
  "folke/snacks.nvim",

  -- The `init` function runs before the plugin is loaded.
  -- It's the only place where you can reliably set up things like autocommands
  -- that must be in place *before* LazyVim emits events like "VeryLazy".
  init = function()
    -- Register an autocommand on the custom User event "VeryLazy".
    --
    -- LazyVim fires `User VeryLazy` *after* all plugins are fully initialized and loaded.
    -- This is the safest point to:
    -- - Access plugin APIs (like copilot, which-key, etc.)
    -- - Set up visual toggles or keymaps
    -- - Avoid breaking lazy-loading by accessing plugins too early
    --
    -- ❗ If we don't wait for `VeryLazy`:
    -- - `require("copilot")` might fail (because Copilot hasn't been loaded yet)
    -- - `which-key` might not be ready for integration
    -- - You lose the benefit of lazy-loading (slower startup)
    -- - Your toggle may silently not work or error
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Safely try to load the Copilot plugin.
        -- Using `pcall` avoids crashing if Copilot is not installed.
        local copilot_exists = pcall(require, "copilot")
        if copilot_exists then
          -- Register a toggle using snacks.nvim for Copilot Completion
          Snacks.toggle({
            name = "Copilot Completion", -- Display name shown in notifications or which-key

            -- Optional colors for enabled/disabled state in the toggle UI
            color = {
              enabled = "azure",
              disabled = "orange",
            },

            -- `get()` determines whether the toggle is currently ON or OFF
            -- Here, we check if Copilot is *not* disabled, meaning it's enabled
            get = function()
              return not require("copilot.client").is_disabled()
            end,

            -- `set(state)` flips the state — enables or disables Copilot
            -- `state` is true when enabling, false when disabling
            set = function(state)
              if state then
                require("copilot.command").enable()
              else
                require("copilot.command").disable()
              end
            end,

            -- The `:map()` method binds the toggle to a key — here `<leader>at`
            -- This:
            -- - Calls `get()` to check current state
            -- - Inverts it and passes to `set()`
            -- - Shows a notification
            -- - Integrates with which-key (if enabled in Snacks config)
          }):map("<leader>at")
        end
      end,
    })
  end,
}
