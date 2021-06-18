local grid = require('grid')
local state = require('state')

local start = grid(5, 5)

start[2][3].active = true
start[3][3].active = true
start[4][3].active = true

local e = state(start)

print()
start:render()
print()
e:render()
print()

assert(start[3][2].active == true, '2,3 must be alive')
assert(start[3][3].active == true, '3,3 must be alive')
assert(start[3][4].active == true, '4,3 must be alive')
