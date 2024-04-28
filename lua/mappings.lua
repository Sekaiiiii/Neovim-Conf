local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap
local opt = { noremap = true, silent = true }

-- Ctrl-c Ctrl-v
map("v", "<C-c>", '"+y')
map("v", "<C-x>", '"+x')
map("v", "<C-v>", '"+p')
map("i", "<C-v>", '<Esc>"+pa')
map("t", "<C-v>", '<C-\\><C-n>"+pa')
map("c", "<C-v>", '<C-r>"')

-- command quick
map("n", ";", ":", { desc = "Command Quick" })

-- insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- arrow move
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })

-- global lsp mappings
map("n", "<A-f>", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Lsp formatting" })

map("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>ldf", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map("n", "<leader>ldp", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
map("n", "<leader>ldn", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })
map("n", "<leader>ldl", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })

-- tabufline
map("n", "<C-n>", "<cmd>enew<CR>", { desc = "Buffer New" })

for i = 1, 9, 1 do
	vim.keymap.set("n", string.format("<A-%s>", i), function()
		vim.api.nvim_set_current_buf(vim.t.bufs[i])
	end)
end

map("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<leader>cc", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

map("n", "<leader>ca", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "Buffer Close All" })

map("n", "<leader>co", function()
	require("nvchad.tabufline").closeOtherBufs()
end, { desc = "Buffer Close Others" })

map("n", "<leader>cw", function()
	vim.cmd("close")
end, { desc = "Close Winodws" })

-- nvimtree
map("n", "<leader>mf", function()
	vim.cmd("NvimTreeFindFile")
end, { desc = "Nvimtree Find File" })
map("n", "<leader>mc", function()
	vim.cmd("NvimTreeClose")
end, { desc = "Nvimtree Close" })
map("n", "<leader>mo", function()
	vim.cmd("NvimTreeOpen")
end, { desc = "Nvimtree Open" })

-- telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>fgs", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>ftm", "<cmd>Telescope terms<CR>", { desc = "Telescope Pick hidden term" })
map("n", "<leader>fth", "<cmd>Telescope themes<CR>", { desc = "Telescope Nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Telescope Find all files" }
)

-- terminal
map("n", "<leader>tnh", function()
	require("nvchad.term").new({ pos = "sp", size = 0.3 })
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "terminal" then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win].number = true
	end
end, { desc = "Terminal New horizontal term" })

map("n", "<leader>tnv", function()
	require("nvchad.term").new({ pos = "vsp", size = 0.3 })
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "terminal" then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win].number = true
	end
end, { desc = "Terminal New vertical window" })

map({ "n", "t" }, "<leader>ttv", function()
	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm", size = 0.3 })
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "terminal" then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win].number = true
	end
end, { desc = "Terminal Toggleable vertical term" })

map({ "n", "t" }, "<leader>tth", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm", size = 0.3 })
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "terminal" then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win].number = true
	end
end, { desc = "Terminal New horizontal term" })

map({ "n", "t" }, "<leader>ttf", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "terminal" then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win].number = true
	end
end, { desc = "Terminal Toggle Floating term" })

map({ "n", "t" }, "<leader>ttg", function()
	require("nvchad.term").toggle({
		pos = "float",
		id = "gitTerm",
		float_opts = { width = 0.8, height = 0.8, row = 0.1, col = 0.1 },
	})
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "terminal" then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win].number = true
	end
end, { desc = "Terminal Toggle Git Term" })

map("t", "<leader>cw", function()
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "Whichkey query lookup" })

-- blankline
map("n", "<leader>bc", function()
	local config = { scope = {} }
	config.scope.exclude = { language = {}, node_type = {} }
	config.scope.include = { node_type = {} }
	local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

	if node then
		local start_row, _, end_row, _ = node:range()
		if start_row ~= end_row then
			vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
			vim.api.nvim_feedkeys("_", "n", true)
		end
	end
end, { desc = "Blankline Jump to current context" })

-- plugins shortcut define
local pluginKeys = {}

pluginKeys.lsp = {}

pluginKeys.lsp.onAttach = function(mapbuf)
	-- rename
	mapbuf("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
	mapbuf("n", "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go xx
	mapbuf("n", "<leader>lgd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "<leader>lgh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	mapbuf("n", "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
end

return pluginKeys
