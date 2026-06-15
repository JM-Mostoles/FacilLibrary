function love.load()
    require("modules.textMaker")
    hola = textbox_class.new(true, 10, {"aaaa", "bbbb"}, 1, 1, 1, 1)
end

function love.update(dt)
    hola:update(dt)
end

function love.keypressed(key)
    hola:keypressed(key)
    if key == "a" then
        hola:setIn(true)
    end
end

function love.draw()
    love.graphics.draw(love.graphics.newImage("rs/general/bg.png"))
    hola:draw(dt)
end