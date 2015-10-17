require("grid")
require("compound")

local gridHeight = 20
local gridWidth = 10
local activeBlock = {}

width, height = love.window.getDimensions()

function love.load()
	love.graphics.setBackgroundColor(190, 190, 190)
	initializeGrid(gridHeight, gridWidth)
end


function love.draw()
	fillGrid()
	drawGridLines()
	local c = makeFunkyLeft(gridHeight, gridWidth)
	drawCompound(c)
end


function love.update()

end

