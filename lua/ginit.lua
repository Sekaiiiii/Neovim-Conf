if vim.fn.has("GuiFont") then
	vim.cmd("GuiFont " .. "ComicShannsMono Nerd Font:h12")
end

if vim.fn.has("GuiLinespace") then
	vim.cmd("GuiLinespace " .. "1")
end

if vim.fn.has("GuiWindowOpacity") then
	vim.cmd("GuiWindowOpacity " .. "0.8")
end
