local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  vim.notify("Plugin Error: can't find dashboard plugin")
  return
end
local path = vim.fn.stdpath("data") .. "\\sessions"

local sessionDictTable = {}
local cnt = 0
for file in vim.fs.dir(path) do
  local folderPath = file
  folderPath = string.sub(folderPath, 0, -4)
  folderPath = string.gsub(folderPath, "++", ":")
  folderPath = string.gsub(folderPath, "-", "//")
  sessionDictTable[cnt] = {
    name = file,
    sessionPath = path .. "\\" .. file,
    folderPath = folderPath,
  }
  cnt = cnt + 1
end

local sessionQuickStartItemTable = {}
for i = 0, #sessionDictTable, 1 do
  local item = sessionDictTable[i]
  sessionQuickStartItemTable[i] = {
    desc = "Session:       " .. item.name,
    action = function()
      vim.cmd("cd " .. sessionDictTable[i].folderPath)
      vim.cmd("SessionRestore")
    end,
  }
end

local configCenterBaseTable = {
  {
    icon = "  ",
    desc = "List Sessions                            ",
    action = function(e)
      local path = vim.fn.stdpath("data") .. "/sessions"
      local cmd = "Telescope find_files cwd=" .. path
      vim.cmd(cmd)
    end,
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Find file                           ",
    action = "Telescope find_files",
  },
}

local configCenterTable = _G.mergeTable(configCenterBaseTable, sessionQuickStartItemTable)

dashboard.setup({
  theme = "doom",
  config = {
    header = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[          ▀████▀▄▄              ▄█ ]],
      [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
      [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
      [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
      [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
      [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
      [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
      [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
      [[   █   █  █      ▄▄           ▄▀   ]],
      [[]],
      [[]],
    },
    center = configCenterTable,
    footer = {},
  },
})

-- dashboard.custom_footer = {"", "", "https://github.com/nshen/learn-neovim-lua"}
-- dashboard.custom_center = {
--     {
--         icon = "  ",
--         desc = "Projects                            ",
--         action = "Telescope projects"
--     }, {
--         icon = "  ",
--         desc = "Recently files                      ",
--         action = "Telescope oldfiles"
--     }, {
--         icon = "  ",
--         desc = "Edit keybindings                    ",
--         action = "edit ~/.config/nvim/lua/keybindings.lua"
--     }, {
--         icon = "  ",
--         desc = "Edit Projects                       ",
--         action = "edit ~/.local/share/nvim/project_nvim/project_history"
--     }
--     -- {
--     --   icon = "  ",
--     --   desc = "Edit .bashrc                        ",
--     --   action = "edit ~/.bashrc",
--     -- },
--     -- {
--     --   icon = "  ",
--     --   desc = "Change colorscheme                  ",
--     --   action = "ChangeColorScheme",
--     -- },
--     -- {
--     --   icon = "  ",
--     --   desc = "Edit init.lua                       ",
--     --   action = "edit ~/.config/nvim/init.lua",
--     -- },
--     -- {
--     --   icon = "  ",
--     --   desc = "Find file                           ",
--     --   action = "Telescope find_files",
--     -- },
--     -- {
--     --   icon = "  ",
--     --   desc = "Find text                           ",
--     --   action = "Telescopecope live_grep",
--     -- },
-- }
-- dashboard.custom_header = {
--     [[]], [[          ▀████▀▄▄              ▄█ ]],
--     [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
--     [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
--     [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
--     [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
--     [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
--     [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
--     [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
--     [[   █   █  █      ▄▄           ▄▀   ]]
-- }

-- dashboard.setup({
--     theme = 'hyper',
--     config = {
--         week_header = {enable = true},
--         shortcut = {
--             {
--                 desc = '󰊳 Update',
--                 group = '@property',
--                 action = 'Lazy update',
--                 key = 'u'
--             }, {
--                 icon = ' ',
--                 icon_hl = '@variable',
--                 desc = 'Files',
--                 group = 'Label',
--                 action = 'Telescope find_files',
--                 key = 'f'
--             }, {
--                 desc = ' Apps',
--                 group = 'DiagnosticHint',
--                 action = 'Telescope app',
--                 key = 'a'
--             }, {
--                 desc = ' dotfiles',
--                 group = 'Number',
--                 action = 'Telescope dotfiles',
--                 key = 'd'
--             }
--         },
--         project = {
--             enable = false,
--             limit = 8,
--             icon = 'your icon',
--             label = '',
--             action = 'Telescope find_files cwd=~/AppData/Local/nvim-data/sessions'
--         },
--         mrc = {enable = false},
--         footer = {}
--     }
-- })
