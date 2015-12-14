local gameGrid = {}
local gridHeight = 0
local gridWidth = 0
local emptyBlock = {
		empty = true,
		color = {
			red = 190,
			green = 190,
			blue = 190
		}
}

function initializeGrid(h, w)
	gridHeight = h
	gridWidth = w
	gameGrid = {}
	for i = 1, gridHeight do
		row = {}
		for j = 1, gridWidth do
			table.insert(row, emptyBlock)
		end
		table.insert(gameGrid, row)
	end
end

function drawGridLines()
	love.graphics.setColor(60, 60, 60)
	for i = 1, gridWidth do
		love.graphics.line((height/(2*gridWidth))*i, 0, (height/(2*gridWidth))*i, height)
	end
	for i = 1, gridHeight do
		love.graphics.line(0, (height/gridHeight)*i, height/2, (height/gridHeight)*i)
	end
end

function paintGrid()
	for i = 1, gridHeight do
		for j = 1, gridWidth do
			local block = getSlot(j, i)
			love.graphics.setColor(block.color.red, block.color.green, block.color.blue)
			love.graphics.rectangle("fill", (j-1)*(height/(2*gridWidth)), (i-1)*(height/gridHeight), height/(2*gridWidth), height/gridHeight)
		end
	end
end

function fillSlot(x, y, c)
	gameGrid[y][x] = {
		empty = false,
		color = c
	}
end


function clearSlot(x, y)
	gameGrid[y][x] = emptyBlock
end

function destroyRow(y)
	for i = 1, gridWidth do
		clearSlot(i, y)
	end
end

function getGridDimensions()
	return gridWidth, gridHeight
end

function getSlot(x, y)
	return gameGrid[y][x]
end


function isSlotEmpty(x, y)
	return getSlot(x,y).empty
end


function isRowFull(y)
	for i = 1, gridWidth do
		if isSlotEmpty(i, y) then
			return false
		end
	end

	return true
end

