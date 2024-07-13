local M = {}

M.merge_tables = function(...)
	local mergedTable = {}
	local tables = { ... }

	for _, t in ipairs(tables) do
		for k, v in pairs(t) do
			mergedTable[k] = v
		end
	end

	return mergedTable
end

return M
