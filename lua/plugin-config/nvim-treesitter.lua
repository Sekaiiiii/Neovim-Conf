local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("Plugin Error: can't find nvim-treesitter plugin")
    return
end

local formattedTextCorrlation = {"json", "yaml"}
local gitCorrlation = {"gitignore", "gitcommit", "git_config", "git_rebase"}
local frontEndCorrlation = {
    "html", "css", 'scss', 'vue', 'javascript', 'tsx', 'jsdoc'
}
local backEndCorrlation = {"sql"}
local luaCorrlation = {"lua"}
local markdownCorrlation = {"markdown"}

local ensure_install_array = _G.concatArray(formattedTextCorrlation,
                                            gitCorrlation, frontEndCorrlation,
                                            backEndCorrlation, luaCorrlation,
                                            markdownCorrlation);

treesitter.setup({
    ensure_installed = ensure_install_array,
    auto_install = true,
    highlight = {enable = true},
    indent = {enable = true},
    incremental_selection = {enable = true}
})
