-- NERDTree
vim.keymap.set("n", "<leader>t", vim.cmd.NERDTreeToggle)

-- Telescope
local builtin = require("telescope.builtin")

-- Search all project files
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
-- Search files tracked by git
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function ()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Theme
require("rose-pine").setup {
  variant = "auto",
	sync_install =  false,
	auto_install = true,
  disable_background = true,
  disable_float_background = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}

vim.cmd("colorscheme rose-pine")

require("presence").setup({
	auto_update = true,
	main_image = "file",
  workspace_text = "Working on a project",
  blacklist = {"Notebook/*"}
})

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- GitHub Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {
	silent = true,
	expr = true
})

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-h", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s", function() ui.nav_file(4) end)

-- LSP Zero
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp_ensure_installed({
	"tsserver",
	"rust_analyzer"
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y"] = cmp.mapping.confirm({ select = true }),
	["<C-Space"] = cmp.mapping.complete()
})

lsp.setup()
