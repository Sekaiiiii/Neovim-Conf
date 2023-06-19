function _G.log(v)
    print(vim.inspect(v))
    return v
end

function _G.keymap(mode, lhs, rhs, opts)
    if not (type(lhs) == "string") then return end
    if not (type(rhs) == "string") then return end
    opts = opts or {}
    local default_opts = {remap = false, silent = true}
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, opts))
end

function _G.concatArray(...)
    local args = {...}
    local outputArray = {}
    local outputArrayLength = 0;
    for rIndex, array in ipairs(args) do
        local rowArrayLength = #array
        for cIndex, value in ipairs(array) do
            outputArray[outputArrayLength + cIndex] = value
        end
        outputArrayLength = outputArrayLength + rowArrayLength;
    end
    return outputArray;
end