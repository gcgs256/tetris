local gameGrid = {}
local gridHeight = 20
local gridWidth = 10
local width, height = love.window.getDimensions()

function love.load()
	love.graphics.setBackgroundColor(190, 190, 190)
	initializeGrid()
	
end


function love.draw()
	fillGrid()
	drawGridLines()
end


function love.update()

end

function drawGridLines()
	love.graphics.setColor(60, 60, 60)
	for i = 1, gridWidth do
		love.graphics.line((width/gridWidth)*i, 0, (width/gridWidth)*i, height)
	end
	for i = 1, gridHeight do
		love.graphics.line(0, (height/gridHeight)*i, width, (height/gridHeight)*i)
	end
end

function fillGrid()
	for i = 1, gridHeight do
		for j = 1, gridWidth do
			local block = gameGrid[i][j]
			love.graphics.setColor(block.color.red, block.color.green, block.color.blue)
			love.graphics.rectangle("fill", (j-1)*(width/gridWidth), (i-1)*(height/gridHeight), width/gridWidth, height/gridHeight)
		end
	end
end

function initializeGrid()
	gameGrid = {}
	for i = 1, gridHeight do
		row = {}
		for j = 1, gridWidth do
			table.insert(row, createEmptyBlock())
		end
		table.insert(gameGrid, row)
	end
end

function createEmptyBlock()
	return {
		empty = true,
		color = {
			red = 190,
			green = 190,
			blue = 190
		}
	}
end