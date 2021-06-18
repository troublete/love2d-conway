local grid = require('grid')

return function(of)
	local new = grid(of.nx, of.ny)

	for y, row in ipairs(of) do
		for x, cell in ipairs(row) do
			local alive = 0

			local neighbors = {
				of:fetch(y, x+1),
				of:fetch(y, x-1),
				of:fetch(y+1, x),
				of:fetch(y-1, x),
				of:fetch(y+1, x+1),
				of:fetch(y-1, x-1),
				of:fetch(y-1, x+1),
				of:fetch(y+1, x-1)
			}

			for _, val in ipairs(neighbors) do
				if val == true then
					alive = alive + 1
				end
			end

			if alive < 2 or alive > 3 then
				new[y][x].active = false
			else
				new[y][x].active = true
			end
		end
	end

	return new
end

