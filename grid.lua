local emptyBlock = {
		empty = true,
		color = {
			red = 190,
			green = 190,
			blue = 190
		}
}

function initializeGrid(h, w)
	local gridHeight = h
	local gridWidth = w
	local gameGrid = {}
	for i = 1, gridHeight do
		row = {}
		for j = 1, gridWidth do
			table.insert(row, emptyBlock)
		end
		table.insert(gameGrid, row)
	end
	return {gridHeight = gridHeight, gridWidth = gridWidth, gameGrid = gameGrid}
end

-- function drawGridLines()
-- 	love.graphics.setColor(60, 60, 60)
-- 	for i = 1, gridWidth do
-- 		love.graphics.line((height/(2*gridWidth))*i, 0, (height/(2*gridWidth))*i, height)
-- 	end
-- 	for i = 1, gridHeight do
-- 		love.graphics.line(0, (height/gridHeight)*i, height/2, (height/gridHeight)*i)
-- 	end
-- end

function drawGridLines(grid, startX, startY, endX, endY)
	love.graphics.setColor(60, 60, 60)
	for i = 0, grid.gridWidth do
		love.graphics.line(startX + i*(endX-startX)/grid.gridWidth, startY, startX + i*(endX-startX)/grid.gridWidth, endY)
	end
	for i = 0, grid.gridHeight do
		love.graphics.line(startX, startY + i*(endY - startY)/grid.gridHeight, endX, startY + i*(endY - startY)/grid.gridHeight)
	end
end

-- function paintGrid()
-- 	for i = 1, gridHeight do
-- 		for j = 1, gridWidth do
-- 			local block = getSlot(j, i)
-- 			love.graphics.setColor(block.color.red, block.color.green, block.color.blue)
-- 			love.graphics.rectangle("fill", (j-1)*(height/(2*gridWidth)), (i-1)*(height/gridHeight), height/(2*gridWidth), height/gridHeight)
-- 		end
-- 	end
-- end

function paintGrid(grid, startX, startY, endX, endY)
	for i = 0, grid.gridHeight - 1 do
		for j = 0, grid.gridWidth - 1 do
			local block = getSlot(grid, j + 1, i + 1)
			love.graphics.setColor(block.color.red, block.color.green, block.color.blue)
			love.graphics.rectangle("fill", startX + j*((endX - startX)/grid.gridWidth), startY + i*((endY - startY)/grid.gridHeight), (endX - startX)/grid.gridWidth, (endY - startY)/grid.gridHeight)
		end
	end
end

function fillSlot(grid, x, y, c)
	grid.gameGrid[y][x] = {
		empty = false,
		color = c
	}
end


function clearSlot(grid, x, y)
	grid.gameGrid[y][x] = emptyBlock
end

function destroyRow(grid, y)
	for i = 1, grid.gridWidth do
		clearSlot(grid, i, y)
	end
end

function getGridDimensions(grid)
	return grid.gridWidth, grid.gridHeight
end

function getSlot(grid, x, y)
	return grid.gameGrid[y][x]
end


function isSlotEmpty(grid, x, y)
	return getSlot(grid, x,y).empty
end


function isRowFull(grid, y)
	for i = 1, grid.gridWidth do
		if isSlotEmpty(grid, i, y) then
			return false
		end
	end

	return true
end

function moveRowDown(grid, y)

	for i = 1, grid.gridWidth do
		if not isSlotEmpty(grid, i, y) then
			local temp = getSlot(grid, i, y)
			fillSlot(grid, i, y + 1, temp.color)
		end
		clearSlot(grid, i, y)
	end


end

