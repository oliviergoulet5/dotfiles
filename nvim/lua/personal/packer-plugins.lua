vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {{"nvim-lua/plenary.nvim"}}
	})

	use({
		"nvim-treesitter/nvim-treesitter",
    tag = "v0.8.5.2",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"rose-pine/nvim", 
		as = "rose-pine"
	})
  
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use "ThePrimeagen/harpoon"
	use "mbbill/undotree"
	use "tpope/vim-fugitive"
	use "ryanoasis/vim-devicons"
	use "preservim/nerdtree"
	use "andweeb/presence.nvim"
	use "tiagofumo/vim-nerdtree-syntax-highlight"
	use "dhruvasagar/vim-table-mode"
	use "github/copilot.vim"
  use "APZelos/blamer.nvim"

  use({
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Notes",
              }
            },
          }
        }
      })
    end,
  })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{"neovim/nvim-lspconfig"},
			{"williamboman/mason.nvim", run = function() pcall(vim.cmd, "MasonUpdate") end },
			{"williamboman/mason-lspconfig.nvim"},
			-- Autocompletion
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-nvim-lsp"},
			{"L3MON4D3/LuaSnip"},
		}
	})
end)
