local uConfig = require('uConfig');

vim.g.mapleader = uConfig.leader_key;
vim.g.maplocalleader = uConfig.leader_key;


local M = {};

M.cmp_keys = {
    cmp_complete = "<A-.>",
    cmp_abort = "<A-,>",
    cmp_confirm = "<CR>",
    cmp_scroll_doc_up = "<C-e>",
    cmp_scroll_doc_down = "<C-y>",
    cmp_select_prev_item = "<S-Tab>",
    cmp_select_next_item = "<Tab>",
}

M.lsp_keys = {
	rename = '<leader>lrn',
	code_action = '<leader>lca',
	go_definition = '<leader>lgd',
	go_diagnostic = '<leader>lgp',
	diagnostic_prev = '<leader>ldp',
	diagnostic_next = '<leader>ldn',
	format = '<leader>lff',
}

-- Ctrl-c Ctrl-v
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-x>", '"+x')
vim.keymap.set("v", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<Esc>"+pa')
vim.keymap.set("t", "<C-v>", '<C-\\><C-n>"+pa')
vim.keymap.set("c", "<C-v>", '<C-r>+')

-- windows control
vim.keymap.set("n","<C-h>","<C-w>h");
vim.keymap.set("n","<C-l>","<C-w>l");
vim.keymap.set("n","<C-j>","<C-w>j");
vim.keymap.set("n","<C-k>","<C-w>k");
vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>")
vim.keymap.set("n", "<leader>wnn", "<cmd>new<CR>")
vim.keymap.set("n", "<leader>wnv", "<cmd>vnew<CR>")
vim.keymap.set("n", "<leader>wss", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>wsv", "<cmd>vsplit<CR>")

-- window shortcut
vim.keymap.set('n', '<C-w>z', function() vim.cmd 'WindowsMaximize' end) 
vim.keymap.set('n', '<c-w>_', function() vim.cmd 'WindowsMaximizeVertically'end)
vim.keymap.set('n', '<c-w>|', function() vim.cmd 'WindowsMaximizeHorizontally' end)
vim.keymap.set('n', '<c-w>=', function() vim.cmd 'WindowsEqualize' end)

-- window-picker shortcut
vim.keymap.set("n", "<leader>wpp", function()
  require('plugin-config.window-picker').pick_window()
end, { desc = "Pick Window" })
vim.keymap.set("n", "<leader>wps", function()
  require('plugin-config.window-picker').swap_window()
end, { desc = "Swap Window" })

-- windows size control
vim.keymap.set("n", "<A-Up>", "<C-w>+")
vim.keymap.set("n", "<A-Down>", "<C-w>-")
vim.keymap.set("n", "<A-Left>", "<C-w><")
vim.keymap.set("n", "<A-Right>", "<C-w>>")

-- bufferline shortcut
vim.keymap.set("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>")
vim.keymap.set("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>")
vim.keymap.set("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>")
vim.keymap.set("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>")
vim.keymap.set("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>")
vim.keymap.set("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>")
vim.keymap.set("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>")
vim.keymap.set("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>")

vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>bcc", ":Bdelete!<CR>")
vim.keymap.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>")
vim.keymap.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>")
vim.keymap.set("n", "<leader>bco", ":BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<leader>bca", ":BufferLineCloseOthers<CR>:Bdelete!<CR>")
vim.keymap.set("n", "<leader>bcp", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>bsl", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader>bsr", ":BufferLineMovePrev<CR>")

-- nvim-tree shortcut
vim.keymap.set("n", '<leader>mf', function() vim.cmd('NvimTreeFindFile') end)
vim.keymap.set("n", '<leader>mc', function() vim.cmd('NvimTreeClose') end)
vim.keymap.set("n", '<leader>mo', function() vim.cmd('NvimTreeOpen') end)

-- telescope shortcut
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fn", function()
  require("telescope").extensions.notify.notify()
end)
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- ufo   
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
vim.keymap.set("n", "zp", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    return;
  end
end)

-- toggleterm shortcut
vim.keymap.set("n", "<leader>tf", ":TermSelect<CR>1<CR><CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tg", ":lua toggleterm_gituiToggle()<CR>", { noremap = true, silent = true })

-- lsp shortcut


return M;

