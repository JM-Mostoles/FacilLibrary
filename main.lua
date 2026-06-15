function love.load()
	require("modules.textMaker")
	hola = textbox_class.new(false, 10, { "aaaaaaaaaaaa", "bbbbbbbbbbbb" }, 1, 1, 1, 1)
end

function love.update(dt)
	hola:update(dt)
end

function love.keypressed(key)
	hola:keypressed(key)
	if hola.isIn == false then
		if key == "a" then
			hola:setIn(true)
		end
	end
end

function love.draw()
	love.graphics.draw(love.graphics.newImage("rs/general/bg.png"))
	hola:draw(dt)
end
