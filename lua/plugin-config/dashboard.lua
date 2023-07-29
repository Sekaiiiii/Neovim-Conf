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
if cnt > 0 then
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
end

local configCenterBaseTable = {
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

local configCenterTable = configCenterBaseTable
if cnt > 0 then
  configCenterTable = _G.mergeTable(configCenterBaseTable, sessionQuickStartItemTable)
end

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
