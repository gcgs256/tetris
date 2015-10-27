require("grid")
require("compound")

local gameSpeed = 0.5
local gridHeight = 20
local gridWidth = 10
local activeBlock = {}
local time = 0

width, height = love.window.getDimensions()

function love.load()
	love.graphics.setBackgroundColor(190, 190, 190)
	initializeGrid(gridHeight, gridWidth)
	local compoundNumber = love.math.random(7)

	print(compoundNumber)

	if compoundNumber == 1 then
		activeBlock = makeColumn(gridHeight, gridWidth, (gridWidth / 2) -1, 1)
	elseif compoundNumber == 2 then
		activeBlock = makeLeftL(gridHeight, gridWidth, (gridWidth / 2) -1, 1)
	elseif compoundNumber == 3 then
		activeBlock = makeRightL(gridHeight, gridWidth, (gridWidth / 2) -1, 1)
	elseif compoundNumber == 4 then
		activeBlock = makeT(gridHeight, gridWidth, (gridWidth / 2) -1, 1)
	elseif compoundNumber == 5 then
		activeBlock = makeBox(gridHeight, gridWidth, (gridWidth / 2), 1)
	elseif compoundNumber == 6 then
		activeBlock = makeFunkyLeft(gridHeight, gridWidth, (gridWidth / 2) -1, 1)
	elseif compoundNumber == 7 then
		activeBlock = makeFunkyRight(gridHeight, gridWidth, (gridWidth / 2) -1, 1)
	end

	drawCompound(activeBlock)

end


function love.draw()
	fillGrid()
	drawGridLines()
end


function love.update(dt)
	time = time + dt
	if time >= gameSpeed then
		tick()
		time = time - gameSpeed
	end
end


function tick()
	destroyCompound(activeBlock)

	dropCompound(activeBlock)

	drawCompound(activeBlock)

end

function love.keypressed(key)
	if key == "left" then
		destroyCompound(activeBlock)
		moveLeft(activeBlock)
		drawCompound(activeBlock)
	end

	if key == "right" then
		destroyCompound(activeBlock)
		moveRight(activeBlock)
		drawCompound(activeBlock)
	end
end