local M = {}

M.merge_tables = function(...)
	local merged = {}

	for _, t in ipairs({ ... }) do
		for k, v in pairs(t) do
			if type(k) == "number" then
				table.insert(merged, v)
			else
				merged[k] = v
			end
		end
	end

	return merged
end

M.print = function(t, indent)
	indent = indent or 0
	local indent_str = string.rep(" ", indent)

	if type(t) ~= "table" then
		print(indent_str .. tostring(t))
		return
	end

	for k, v in pairs(t) do
		local key_str = tostring(k)
		if type(v) == "table" then
			print(indent_str .. key_str .. ":")
			M.print(v, indent + 1)
		else
			local value_str = tostring(v)
			print(indent_str .. key_str .. ": " .. value_str)
		end
	end
end

M.is_table = function(t)
	return type(t) == "table"
end

return M
