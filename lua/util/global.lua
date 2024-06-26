function _G.log(v)
	print(vim.inspect(v))
	return v
end

function _G.printTable(t, indent)
	indent = indent or 1

	for key, value in pairs(t) do
		local formatting = string.rep("  ", indent)

		if type(value) == "table" then
			print(formatting .. key .. " = {")
			printTable(value, indent + 1)
			print(formatting .. "}")
		else
			print(formatting .. key .. " = " .. tostring(value))
		end
	end
end

function _G.concatArray(...)
	local args = { ... }
	local outputArray = {}
	local outputArrayLength = 0
	for rIndex, array in ipairs(args) do
		local rowArrayLength = #array
		for cIndex, value in ipairs(array) do
			outputArray[outputArrayLength + cIndex] = value
		end
		outputArrayLength = outputArrayLength + rowArrayLength
	end
	return outputArray
end

function _G.mergeTable(...)
	local tabs = { ... }
	if not tabs then
		return {}
	end
	local origin = tabs[1]
	for i = 2, #tabs do
		if origin then
			if tabs[i] then
				for k, v in pairs(tabs[i]) do
					table.insert(origin, v)
				end
			end
		else
			origin = tabs[i]
		end
	end
	return origin
end
