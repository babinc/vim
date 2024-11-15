-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  -- COLORS
	use({ 'rose-pine/neovim', as = 'rose-pine' })
  use ({ 'projekt0n/github-nvim-theme' })

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'nvim-treesitter/playground'

	use 'theprimeagen/harpoon'

	use('mbbill/undotree')

	use('tpope/vim-fugitive')

	use {
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	}

  use "folke/which-key.nvim"

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }

  use {
    'kevinhwang91/nvim-ufo',
      requires = 'kevinhwang91/promise-async'
  }

  use "echasnovski/mini.icons"
  use 'nvim-tree/nvim-web-devicons'

  use {"akinsho/toggleterm.nvim", tag = '*'}

	--LSP
	use {'neovim/nvim-lspconfig'}
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})

  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {'stevearc/dressing.nvim'}

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'simrat39/inlay-hints.nvim'

  use 'simrat39/rust-tools.nvim'

  use {
    'christoomey/vim-tmux-navigator'
  }

  use {
    'echasnovski/mini.align',
    config = function()
      require('mini.align').setup()
    end
  }
end)
