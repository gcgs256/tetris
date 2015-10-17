function makeColumn(gridHeight, gridWidth)
	local startX = (gridWidth / 2) - 1
	return {
		color = {red = 240, green = 240, blue = 0},
		subBlocks = {
			{
				x = startX,
				y = 1
			},
			{
				x = startX + 1,
				y = 1
			},
			{
				x = startX + 2,
				y = 1
			},
			{
				x = startX + 3,
				y = 1
			}
		}
	}
end

function makeLeftL(gridHeight, gridWidth)
	local startX = (gridWidth / 2) - 1
	return {
		color = {red = 0, green = 175, blue = 0},
		subBlocks = {
			{
				x = startX,
				y = 1
			},
			{
				x = startX + 1,
				y = 1
			},
			{
				x = startX + 2,
				y = 1
			},
			{
				x = startX + 2,
				y = 2
			}
		}
	}
end

function makeRightL(gridHeight, gridWidth)
	local startX = (gridWidth / 2) - 1
	return {
		color = {red = 0, green = 100, blue = 220},
		subBlocks = {
			{
				x = startX,
				y = 1
			},
			{
				x = startX + 1,
				y = 1
			},
			{
				x = startX + 2,
				y = 1
			},
			{
				x = startX,
				y = 2
			}
		}
	}
end

function makeT(gridHeight, gridWidth)
	local startX = (gridWidth / 2) - 1
	return {
		color = {red = 255, green = 51, blue = 152},
		subBlocks = {
			{
				x = startX,
				y = 1
			},
			{
				x = startX + 1,
				y = 1
			},
			{
				x = startX + 2,
				y = 1
			},
			{
				x = startX + 1,
				y = 2
			}
		}
	}
end

function makeBox(gridHeight, gridWidth)
	local startX = (gridWidth / 2)
	return {
		color = {red = 255, green = 128, blue = 0},
		subBlocks = {
			{
				x = startX,
				y = 1
			},
			{
				x = startX + 1,
				y = 1
			},
			{
				x = startX,
				y = 2
			},
			{
				x = startX + 1,
				y = 2
			}
		}
	}
end

function makeFunkyLeft(gridHeight, gridWidth)
	local startX = (gridWidth / 2) - 1
	return {
		color = {red = 180, green = 0, blue = 220},
		subBlocks = {
			{
				x = startX,
				y = 2
			},
			{
				x = startX + 1,
				y = 1
			},
			{
				x = startX + 1,
				y = 2
			},
			{
				x = startX + 2,
				y = 1
			}
		}
	}
end

function makeFunkyRight(gridHeight, gridWidth)
	local startX = (gridWidth / 2) - 1
	return {
		color = {red = 30, green = 30, blue = 30},
		subBlocks = {
			{
				x = startX,
				y = 1
			},
			{
				x = startX + 1,
				y = 1
			},
			{
				x = startX + 1,
				y = 2
			},
			{
				x = startX + 2,
				y = 2
			}
		}
	}
end

function drawCompound(compound)
	for i = 1, 4 do
		placeBlock(compound.subBlocks[i].x, compound.subBlocks[i].y, compound.color)
	end
end

function destroyCompound(compound)
	for i = 1, 4 do
		destroyBlock(compound.subBlocks[i].x, compound.subBlocks[i].y)
	end
end