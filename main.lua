require("grid")
require("compound")

local gameSpeed = 0.2
local gridHeight = 20
local gridWidth = 10
local activeBlock = {}
local time = 0

width, height = love.window.getDimensions()

function love.load()
	love.keyboard.setKeyRepeat(true)
	love.graphics.setBackgroundColor(190, 190, 190)
	initializeGrid(gridHeight, gridWidth)
	newBlock()

	placeCompound(makeColumn(5, 20))

end


function love.draw()
	paintGrid()
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
	if isCompoundGrounded(activeBlock) then
		print("yay")
	end

	-- if isCompoundGrounded(activeBlock) then
	-- 	checkRows()
	-- 	newBlock()
	-- end

	moveCompound(activeBlock, 0, 1)
end

function love.keypressed(key)
	if key == "left" then
		moveCompound(activeBlock, -1, 0)
	end

	if key == "right" then
		moveCompound(activeBlock, 1, 0)
	end

-- 	if key == " " then
-- 		destroyCompound(activeBlock)
-- 		activeBlock.rotate()
-- 		drawCompound(activeBlock)
-- 	end
end

function newBlock()
	local compoundNumber = love.math.random(7)
	compoundNumber = 5
	if compoundNumber == 1 then
		activeBlock = makeColumn((gridWidth / 2) -1, 1)
	elseif compoundNumber == 2 then
		activeBlock = makeLeftL((gridWidth / 2) -1, 1)
	elseif compoundNumber == 3 then
		activeBlock = makeRightL((gridWidth / 2) -1, 1)
	elseif compoundNumber == 4 then
		activeBlock = makeT((gridWidth / 2) -1, 1)
	elseif compoundNumber == 5 then
		activeBlock = makeBox((gridWidth / 2), 1)
	elseif compoundNumber == 6 then
		activeBlock = makeFunkyLeft((gridWidth / 2) -1, 1)
	elseif compoundNumber == 7 then
		activeBlock = makeFunkyRight((gridWidth / 2) -1, 1)
	end

	placeCompound(activeBlock)

end