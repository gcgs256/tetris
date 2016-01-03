local bag = {}

local function makeBag()
	for i = 1, 7 do
		table.insert(bag, i)
	end

	local eighthCompound = love.math.random(7)

	table.insert(bag, eightCompound)

	local permutedBag = {}

	while #bag ~= 0 do
		local randomCompoundIndex = love.math.random(#bag)
		local randomCompound = table.remove(bag, randomCompoundIndex)
		table.insert(permutedBag, randomCompound)
	end

	bag = permutedBag
end

function nextCompound()
	if #bag == 0 then
		makeBag()
	end
	return table.remove(bag)
end

function peekCompound()
	if #bag == 0 then
		makeBag()
	end
	return bag[#bag]
end