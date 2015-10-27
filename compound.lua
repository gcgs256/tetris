require("grid")

function makeColumn(gridHeight, gridWidth, startX, startY)

	local self = {color = {red = 240, green = 240, blue = 0}, positionX = startX, positionY = startY}

	local getSubBlocks = function()
		return{{self.positionX, self.positionY},
		{self.positionX + 1, self.positionY},
		{self.positionX + 2, self.positionY},
		{self.positionX + 3, self.positionY}}
	end

	local getColor = function()
		return self.color
	end

	local getPosition = function()
		return{self.positionX, self.positionY}
	end

	local setPosition = function(x, y)
		self.positionX = x
		self.positionY = y
	end

	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition}
	
end

function makeLeftL(gridHeight, gridWidth, startX, startY)
	local self = {color = {red = 0, green = 175, blue = 0}, positionX = startX, positionY = startY}

	local getSubBlocks = function()
		return{{self.positionX, self.positionY},
		{self.positionX, self.positionY + 1},
		{self.positionX + 1, self.positionY + 1},
		{self.positionX + 2, self.positionY + 1}}
	end

	local getColor = function()
		return self.color
	end

	local getPosition = function()
		return{self.positionX, self.positionY}
	end

	local setPosition = function(x, y)
		self.positionX = x
		self.positionY = y
	end

	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition}
end


function makeRightL(gridHeight, gridWidth, startX, startY)
	local self = {color = {red = 0, green = 100, blue = 220}, positionX = startX, positionY = startY}

	local getSubBlocks = function()
		return{{self.positionX + 2, self.positionY},
		{self.positionX, self.positionY + 1},
		{self.positionX + 1, self.positionY + 1},
		{self.positionX + 2, self.positionY + 1}}
	end

	local getColor = function()
		return self.color
	end

	local getPosition = function()
		return{self.positionX, self.positionY}
	end

	local setPosition = function(x, y)
		self.positionX = x
		self.positionY = y
	end

	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition}
end


function makeT(gridHeight, gridWidth, startX, startY)
	local self = {color = {red = 255, green = 51, blue = 152}, positionX = startX, positionY = startY}

	local getSubBlocks = function()
		return{{self.positionX + 1, self.positionY},
		{self.positionX, self.positionY + 1},
		{self.positionX + 1, self.positionY + 1},
		{self.positionX + 2, self.positionY + 1}}
	end

	local getColor = function()
		return self.color
	end

	local getPosition = function()
		return{self.positionX, self.positionY}
	end

	local setPosition = function(x, y)
		self.positionX = x
		self.positionY = y
	end

	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition}
end

function makeBox(gridHeight, gridWidth, startX, startY)
	local self = {color = {red = 255, green = 128, blue = 0}, positionX = startX, positionY = startY}

	local getSubBlocks = function()
		return{{self.positionX, self.positionY},
		{self.positionX + 1, self.positionY},
		{self.positionX, self.positionY + 1},
		{self.positionX + 1, self.positionY + 1}}
	end

	local getColor = function()
		return self.color
	end

	local getPosition = function()
		return{self.positionX, self.positionY}
	end

	local setPosition = function(x, y)
		self.positionX = x
		self.positionY = y
	end

	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition}
end

function makeFunkyLeft(gridHeight, gridWidth, startX, startY)
	local self = {color = {red = 180, green = 0, blue = 220}, positionX = startX, positionY = startY}

	local getSubBlocks = function()
		return{{self.positionX + 2, self.positionY},
		{self.positionX + 1, self.positionY},
		{self.positionX + 1, self.positionY + 1},
		{self.positionX, self.positionY + 1}}
	end

	local getColor = function()
		return self.color
	end

	local getPosition = function()
		return{self.positionX, self.positionY}
	end

	local setPosition = function(x, y)
		self.positionX = x
		self.positionY = y
	end

	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition}
end

function makeFunkyRight(gridHeight, gridWidth, startX, startY)
	local self = {color = {red = 30, green = 30, blue = 30}, positionX = startX, positionY = startY}

	local getSubBlocks = function()
		return{{self.positionX, self.positionY},
		{self.positionX + 1, self.positionY},
		{self.positionX + 1, self.positionY + 1},
		{self.positionX + 2, self.positionY + 1}}
	end

	local getColor = function()
		return self.color
	end

	local getPosition = function()
		return{self.positionX, self.positionY}
	end

	local setPosition = function(x, y)
		self.positionX = x
		self.positionY = y
	end

	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition}
end


function drawCompound(compound)
	local subBlocks = compound.getSubBlocks()
	for i = 1, 4 do
		placeBlock(subBlocks[i][1], subBlocks[i][2], compound.getColor())
	end
end

function destroyCompound(compound)
	local subBlocks = compound.getSubBlocks()
	for i = 1, 4 do
		destroyBlock(subBlocks[i][1], subBlocks[i][2])
	end
end

function dropCompound(compound)
	local currentPosition = compound.getPosition()
	compound.setPosition(currentPosition[1], currentPosition[2] + 1)
	for _, subBlock in ipairs(compound.getSubBlocks()) do
		if subBlock[2] > getGridHeight() then
			compound.setPosition(currentPosition[1], currentPosition[2])
			break
		end

		if hasBlock(subBlock[1], subBlock[2]) then
			compound.setPosition(currentPosition[1], currentPosition[2])
		end
	end
end

function moveRight(compound)
	local currentPosition = compound.getPosition()
	compound.setPosition(currentPosition[1] + 1, currentPosition[2])
	for _, subBlock in ipairs(compound.getSubBlocks()) do
		if subBlock[1] > getGridWidth() then
			compound.setPosition(currentPosition[1], surrentPosition[2])
			break
		end

		if hasBlock(subBlock[1], subBlock[2]) then
			compound.setPosition(currentPosition[1], currentPosition[2])
		end
	end
end

function moveLeft(compound)
	local currentPosition = compound.getPosition()
	compound.setPosition(currentPosition[1] - 1, currentPosition[2])
	for _, subBlock in ipairs(compound.getSubBlocks()) do
		if subBlock[1] < 1 then
			compound.setPosition(currentPosition[1], surrentPosition[2])
			break
		end

		if hasBlock(subBlock[1], subBlock[2]) then
			compound.setPosition(currentPosition[1], currentPosition[2])
		end
	end
end
