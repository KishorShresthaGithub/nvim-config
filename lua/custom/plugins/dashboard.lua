return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local logo = [[

          ███████╗███████╗ █████╗ ██████╗ ██╗     ███████╗███████╗███████╗
          ██╔════╝██╔════╝██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝██╔════╝
          █████╗  █████╗  ███████║██████╔╝██║     █████╗  ███████╗███████╗
          ██╔══╝  ██╔══╝  ██╔══██║██╔══██╗██║     ██╔══╝  ╚════██║╚════██║
          ██║     ███████╗██║  ██║██║  ██║███████╗███████╗███████║███████║
          ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝
          ]]

    logo = string.rep('\n', 8) .. logo .. '\n'

    require('dashboard').setup {
      -- config
      theme = 'doom',
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'), --your header
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(2)',
          },

          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Grep File           ',
            desc_hl = 'String',
            key = 'g',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua require("telescope.builtin").live_grep()',
          },
          {
            icon = '󰒲  ',
            icon_hl = 'Title',
            desc = 'Open Last Session           ',
            desc_hl = 'String',
            key = 's',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua  require("persistence").load({last = true})',
          },

          {
            icon = '󰒲  ',
            icon_hl = 'Title',
            desc = 'Lazy           ',
            desc_hl = 'String',
            key = 'l',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Lazy',
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
