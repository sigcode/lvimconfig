-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
--lvim.colorscheme = "spacegray"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<Tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprevious<cr>"
lvim.keys.normal_mode["<C-j>"] = ":+15<cr>"
lvim.keys.normal_mode["<C-k>"] = ":-15<cr>"
vim.opt.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.tabnine = { active = true}
lvim.builtin.compe.source.tabnine = { kind = " ", priority = 200, max_reslts = 6 }
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.bufferline.active = true
lvim.builtin.compe.autocomplete = true
-- Javascript/Typescript CSS/SCSS Formatter Settings
lvim.lang.javascript.formatters = {
  {
    exe = "prettier",
  --  args = lvim.lang.javascript.formatters[1].args,
  },
}
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters
lvim.lang.css.formatters = lvim.lang.javascript.formatters
vim.api.nvim_set_keymap("n", "<ESC>", ":nohls | :setlocal nospell<ESC>", { noremap = true, silent = true })

local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)

lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
-- Additional Plugins
lvim.plugins = {
	{ "godlygeek/tabular" },
	{ "lunarvim/colorschemes" },
	{ "sainnhe/gruvbox-material" },
	{ "folke/tokyonight.nvim" },
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
		event = "InsertEnter",
	},
 {
  "Pocco81/AutoSave.nvim",
},
    {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
      "tzachar/compe-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-compe",
      event = "InsertEnter",
      disable = not lvim.builtin.tabnine.active,
    },
    {
      "norcalli/nvim-colorizer.lua",
        config = function()
      require("user.colorizer").config()
        end,
    },
    {
      "nvim-lua/lsp-status.nvim",
    }
}
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
