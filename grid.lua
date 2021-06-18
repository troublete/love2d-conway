local grid = function(nx, ny)
	local g = {nx=nx,ny=ny}

	for y=1,ny do
		local row = {}
		for x=1,nx do
			table.insert(row, {active=false})
		end
		table.insert(g, row)
	end

	function g:fetch(y, x)
		if self[y] == nil then
			return nil
		end

		if self[y][x] == nil then
			return nil
		end

		return self[y][x].active == true
	end

	function g:render()
		for y, row in ipairs(g) do
			local r = {}
			for x, cell in ipairs(row) do
				if cell.active == true then
					table.insert(r, 'a')
				else
					table.insert(r, 'd')
				end
			end
			print(table.unpack(r))
		end
	end

	return g
end

return grid
