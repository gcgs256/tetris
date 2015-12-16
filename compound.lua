require("grid")

function makeColumn(startX, startY)
	local self = {color = {red = 240, green = 240, blue = 0}, positionX = startX, positionY = startY, orientation = 1}

	local getSubBlocks = function()
		if self.orientation == 1 then
			return{{self.positionX, self.positionY},
			{self.positionX + 1, self.positionY},
			{self.positionX + 2, self.positionY},
			{self.positionX + 3, self.positionY}}
		elseif self.orientation == 2 then
			return{{self.positionX, self.positionY},
			{self.positionX , self.positionY + 1},
			{self.positionX, self.positionY + 2},
			{self.positionX, self.positionY + 3}}
		end
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

	local rotate = function()
		if self.orientation == 1 then
			self.orientation = 2
		elseif self.orientation == 2 then
			self.orientation = 1
		end
	end


	return {getSubBlocks = getSubBlocks,
	getColor = getColor,
	getPosition = getPosition,
	setPosition = setPosition,
	rotate = rotate}
	
end

function makeLeftL(startX, startY)
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


function makeRightL(startX, startY)
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


function makeT(startX, startY)
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

function makeBox(startX, startY)
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

function makeFunkyLeft(startX, startY)
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

function makeFunkyRight(startX, startY)
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


function placeCompound(compound)
	local subBlocks = compound.getSubBlocks()
	for i = 1, 4 do
		fillSlot(subBlocks[i][1], subBlocks[i][2], compound.getColor())
	end
end

local function destroyCompound(compound)
	local subBlocks = compound.getSubBlocks()
	for i = 1, 4 do
		clearSlot(subBlocks[i][1], subBlocks[i][2])
	end
end

function moveCompound(compound, dx, dy)
	local subBlocks = compound.getSubBlocks()
	for _, subBlock in ipairs(subBlocks) do
		local newPosition = {subBlock[1] + dx, subBlock[2] + dy}
		gridWidth, gridHeight = getGridDimensions()
		if newPosition[1] < 1 or newPosition[1] > gridWidth or newPosition[2] < 1 or newPosition[2] > gridHeight then
			return false
		end

		--print(newPosition[2])

		local itself = false
		for _, other in ipairs(subBlocks) do
			if newPosition[1] == other[1] and newPosition[2] == other[2] then
				itself = true
			end
		end

		--print(itself)

		if not itself and not isSlotEmpty(newPosition[1], newPosition[2]) then
			return false
		end
	end

	destroyCompound(compound)
	local currentPosition = compound.getPosition()
	compound.setPosition(currentPosition[1] + dx, currentPosition[2] + dy)
	placeCompound(compound)
	return true
end

function isCompoundGrounded(compound) --check y position to see if its on the ground/on another block
	local subBlocks = compound.getSubBlocks()
	for _, subBlock in ipairs(subBlocks) do
		gridWidth, gridHeight = getGridDimensions() --do i need local here? didnt put bc of moveCompound function not having

		--checks if compound is on the bottom of the grid
		if subBlock[2] == gridHeight then
			return true
		end

		local beneathBlock = {subBlock[1], subBlock[2] + 1}

		--need to determine whether the subBlock is touching another compound's subBlock without considering itself
		local itself = false
		for _, other in ipairs(subBlocks) do
			if beneathBlock[2] == other[2] and beneathBlock[1] == other[1] then
				itself = true
			end
		end

		if not itself and not isSlotEmpty(beneathBlock[1], beneathBlock[2]) then
			return true
		end
	end

	return false

end

