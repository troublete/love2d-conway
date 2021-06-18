local grid = require('grid')
local state = require('state')
local init =  nil
local last = 0
local size = 0

function love.load()
	local ntiles = 100 
	init = grid(ntiles, ntiles)
	init[2][3].active = true
	init[3][3].active = true
	init[4][3].active = true
	local w, h = love.graphics.getPixelDimensions()
	size = h/ntiles
end

function love.update(dt)
	last = last + dt
	if last >= .5 then
		last = 0
		init = state(init)
	end
end

function love.draw()
	love.graphics.clear(0, 0, 0, 0)

	for x, row in ipairs(init) do
		for y, cell in ipairs(row) do
			if cell.active == true then
				love.graphics.setColor(1, 1, 1)
			else
				love.graphics.setColor(0, 0, 0)
			end
			love.graphics.rectangle('fill', x*size, y*size, size, size)
		end
	end
end