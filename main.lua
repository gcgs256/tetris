local gameGrid = {}
local gridHeight = 20
local gridWidth = 10
local width, height = love.window.getDimensions()

function love.load()
	love.graphics.setBackgroundColor(190, 190, 190)
	
end


function love.draw()
	drawGridLines()
end


function love.update()

end

function drawGridLines()
	love.graphics.setColor(60, 60, 60)
	for i = 1, gridWidth do
		love.graphics.line((width/gridWidth)*i, 0, (width/gridWidth)*i, height)
	end
	for i = 1, gridHeight do
		love.graphics.line(0, (height/gridHeight)*i, width, (height/gridHeight)*i)
	end
end