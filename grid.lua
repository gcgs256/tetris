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

function drawGridLines()
	love.graphics.setColor(60, 60, 60)
	for i = 1, gridWidth do
		love.graphics.line((height/(2*gridWidth))*i, 0, (height/(2*gridWidth))*i, height)
	end
	for i = 1, gridHeight do
		love.graphics.line(0, (height/gridHeight)*i, height/2, (height/gridHeight)*i)
	end
end

function fillGrid()
	for i = 1, gridHeight do
		for j = 1, gridWidth do
			local block = gameGrid[i][j]
			love.graphics.setColor(block.color.red, block.color.green, block.color.blue)
			love.graphics.rectangle("fill", (j-1)*(height/(2*gridWidth)), (i-1)*(height/gridHeight), height/(2*gridWidth), height/gridHeight)
		end
	end
end

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

function placeBlock(x, y, c)
	gameGrid[y][x] = {
		empty = false,
		color = c
	}
end


function destroyBlock(x, y)
	gameGrid[y][x] = emptyBlock
end

function checkRows()
	for i = 1, gridHeight do
		local full = true
		for j = 1, gridWidth do
			if gameGrid[i][j].empty then
				full = false
				break
			end
		end
		if full then
			destroyRow(i)
		end
	end
end

function destroyRow(rowNum)
	for i = 1, gridWidth do
		gameGrid[rowNum][i] = emptyBlock
	end

	for i = rowNum, 2, -1 do
		for j = 1, gridWidth do
			gameGrid[i][j] = gameGrid[i - 1][j]
		end
	end
end

function hasBlock(colNum, rowNum)
	return not gameGrid[rowNum][colNum].empty
end

function getGridHeight()
	return gridHeight
end

function getGridWidth()
	return gridWidth
end