return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.g.vimtex_view_method = "sioyek"
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex" },
  },
}
