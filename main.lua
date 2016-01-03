require("grid")
require("compound")
require("randgen")
--gamespeed should be ~0.35 for actual play

local gameSpeed = 0.1
local level = 1
local gridHeight = 20
local gridWidth = 10
local activeBlock = {}
local time = 0
local rowCounter = 0
local levelAdditionCounter = 0
local score = 0
local timeSinceLastMove = 0
local timeSinceLastMoveThreshold = 0.15
local grid, previewGrid
local paused = false

width, height = love.window.getDimensions()

function love.load()
	love.keyboard.setKeyRepeat(true)
	love.graphics.setBackgroundColor(190, 190, 190)
	grid = initializeGrid(gridHeight, gridWidth)
	previewGrid = initializeGrid(6, 6)
	newBlock()

	-- placeCompound(makeColumn(5,20))
	-- placeCompound(makeColumn(1,20))
	-- placeCompound(makeColumn(5, 19))
	-- placeCompound(makeColumn(1,19))
	-- placeCompound(makeColumn(5,18))

end


function love.draw()
	paintGrid(grid, 0, 0, height/2, height)
	drawGridLines(grid, 0, 0, height/2, height)
	drawPreview()
	printStats()
end


function love.update(dt)
	if not paused then
		time = time + dt
		timeSinceLastMove = timeSinceLastMove + dt
		if time >= gameSpeed then
			tick()
			time = time - gameSpeed
		end
	end
end


function tick()
	if isCompoundGrounded(grid, activeBlock) then

		local tempRows = rowCounter

		--check if the row is full, delete it and move other rows down if it is
		for i = 1, gridHeight do
			if isRowFull(grid, i) then
				destroyRow(grid, i)
				score = score + 100
				rowCounter = rowCounter + 1
				levelAdditionCounter = levelAdditionCounter + 1
				if levelAdditionCounter == 5 then
					levelAdditionCounter = 0
					level = level + 1
					gameSpeed = 0.8 * gameSpeed
				end

				--move rows down here
				for j = i - 1, 1, -1 do
					moveRowDown(grid, j)
				end

			end
		end

		if (rowCounter - tempRows) > 1 then
			score = score + (rowCounter - tempRows) * 50
		end

		if timeSinceLastMove > timeSinceLastMoveThreshold then
			newBlock()
		end

	else
		moveCompound(grid, activeBlock, 0, 1)
		if isCompoundGrounded(grid, activeBlock) then
			timeSinceLastMove = 0
		end
	end
end


function love.keypressed(key)
	if key == "left" then
		if moveCompound(grid, activeBlock, -1, 0) then
			timeSinceLastMove = 0
		end
	end

	if key == "right" then
		if moveCompound(grid, activeBlock, 1, 0) then
			timeSinceLastMove = 0
		end
	end

	if key == "q" or key == "escape" then
		love.event.quit()
	end

	--manual ticking by keypress
	-- if key == "g" then
	-- 	tick()
	-- 	print("tick")
	-- end

	if key == "up" then
		destroyCompound(grid, activeBlock)
		activeBlock.rotate()
		if canCompoundBePlaced(grid, activeBlock) then
			placeCompound(grid, activeBlock)
			timeSinceLastMove = 0
		else
			activeBlock.rotate()
			activeBlock.rotate()
			activeBlock.rotate()
			placeCompound(grid, activeBlock)
		end
	end

	if key == " " then
		while not isCompoundGrounded(grid, activeBlock) do
			moveCompound(grid, activeBlock, 0, 1)
		end
	end

	if key == "p" then
		paused = not paused
	end

end

function newBlock()
	local compoundNumber = nextCompound()
	--compoundNumber = 7
	if compoundNumber == 1 then
		activeBlock = makeColumn((gridWidth / 2) - 1, 1)
	elseif compoundNumber == 2 then
		activeBlock = makeLeftL((gridWidth / 2) + 1, 1)
	elseif compoundNumber == 3 then
		activeBlock = makeRightL((gridWidth / 2) - 1, 1)
	elseif compoundNumber == 4 then
		activeBlock = makeT((gridWidth / 2) - 1, 1)
	elseif compoundNumber == 5 then
		activeBlock = makeBox((gridWidth / 2), 1)
	elseif compoundNumber == 6 then
		activeBlock = makeFunkyLeft((gridWidth / 2) - 1, 1)
	elseif compoundNumber == 7 then
		activeBlock = makeFunkyRight((gridWidth / 2) - 1, 1)
	end

	if canCompoundBePlaced(grid, activeBlock) then
		placeCompound(grid, activeBlock)
	else
		--put a lose screen here instead of quitting the game
		love.event.quit()
	end


	previewGrid = initializeGrid(6, 6)
	local previewCompoundNumber = peekCompound()
	local previewCompound
	if previewCompoundNumber == 1 then
		previewCompound = makeColumn(2, 3)
	elseif previewCompoundNumber == 2 then
		previewCompound = makeLeftL(4, 3)
	elseif previewCompoundNumber == 3 then
		previewCompound = makeRightL(2, 3)
	elseif previewCompoundNumber == 4 then
		previewCompound = makeT(2, 3)
	elseif previewCompoundNumber == 5 then
		previewCompound = makeBox(3, 3)
	elseif previewCompoundNumber == 6 then
		previewCompound = makeFunkyLeft(2, 3)
	elseif previewCompoundNumber == 7 then
		previewCompound = makeFunkyRight(2, 3)
	end
	placeCompound(previewGrid, previewCompound)
end

function printStats()
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("line", (13 * height) / 25, 3 * height / 5, 19 * height / 50, (1 * height) / 5)
	local font = love.graphics.newFont(20)
	love.graphics.setFont(font)
	love.graphics.setColor(153, 0, 76)
	love.graphics.print("Score: " .. score, (8 * height) / 15, (25 * height) / 40)
	love.graphics.print("Level: " .. level, (8 * height) / 15, (27 * height) / 40)
	love.graphics.print("Rows Destroyed: " .. rowCounter, (8 * height) / 15, (29 * height) / 40)
end

function drawPreview()
	paintGrid(previewGrid, (14 * height) / 25, height / 10, 43 * height / 50, 2 * height / 5)
	drawGridLines(previewGrid, (14 * height) / 25, height / 10, 43 * height / 50, 2 * height / 5)
	love.graphics.setColor(153, 0, 76)
	local font = love.graphics.newFont(20)
	love.graphics.setFont(font)
	love.graphics.print("Next Tetromino", 59 * height / 100, height / 20)
end