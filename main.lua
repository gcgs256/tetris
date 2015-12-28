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

	-- placeCompound(makeColumn(5,20))
	-- placeCompound(makeColumn(1,20))
	-- placeCompound(makeColumn(5, 19))
	-- placeCompound(makeColumn(1,19))
	-- placeCompound(makeColumn(5,18))

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

		--check if the row is full, delete it and move other rows down if it is
		for i = 1, gridHeight do
			if isRowFull(i) then
				--print("row" .. i .. "has been detected as full. destroying...")
				
				destroyRow(i)

				--move rows down here
				for j = i - 1, 1, -1 do
					moveRowDown(j)
				end

			end
		end

		newBlock()
	end

	moveCompound(activeBlock, 0, 1)
end


function love.keypressed(key)
	if key == "left" then
		moveCompound(activeBlock, -1, 0)
	end

	if key == "right" then
		moveCompound(activeBlock, 1, 0)
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
		tempBlock = deepcopy(activeBlock)
		destroyCompound(activeBlock)
		activeBlock.rotate()
		if canCompoundBePlaced(activeBlock) then
			placeCompound(activeBlock)
		else
			activeBlock.rotate()
			activeBlock.rotate()
			activeBlock.rotate()
			placeCompound(activeBlock)
		end
	end

end

function newBlock()
	local compoundNumber = love.math.random(7)
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

	if canCompoundBePlaced(activeBlock) then
		placeCompound(activeBlock)
	else
		--put a lose screen here instead of quitting the game
		love.event.quit()
	end
end


function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end