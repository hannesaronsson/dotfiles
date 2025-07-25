return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			-- wipe the default Tab / S-Tab
			opts.mapping["<Tab>"] = nil
			opts.mapping["<S-Tab>"] = nil
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			-- label = {rainbow = {enabled = true}}
		},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use default_site
				keymaps = {
					insert = "<C-g>z",
					insert_line = "<C-g>Z",
					normal = "yz",
					normal_cur = "yzz",
					normal_line = "yZ",
					normal_cur_line = "yZZ",
					visual = "z",
					visual_line = "gZ",
					delete = "dz",
					change = "cz",
					change_line = "cZ",
				},
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		ft = { "markdown", "norg", "rmd", "org", "codecompanion", "text" },
		opts = {
			pipe_table = { style = "normal" },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
		end,
	},
	{
		"github/copilot.vim",
		event = "InsertEnter", -- lazy load on first insert
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.textobjects = opts.textobjects or {}

			opts.textobjects.select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
				},
			}

			opts.textobjects.move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = "@function.outer",
					["]l"] = "@loop.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[l"] = "@loop.outer",
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter" },
		event = "VeryLazy",
	},
}
