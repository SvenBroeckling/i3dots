vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)


-- empty setup using defaults
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        git = true,
        file = false,
        folder = false,
        folder_arrow = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
})
