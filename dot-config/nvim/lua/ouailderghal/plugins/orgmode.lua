return {
  'nvim-orgmode/orgmode',
  dependencies = { "akinsho/org-bullets.nvim" },
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    --

    vim.cmd([[ au FileType org lua require('ufo').detach() ]])
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })

    require('org-bullets').setup()

    -- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
    -- add `org` to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
