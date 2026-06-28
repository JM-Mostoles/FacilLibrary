function love.load()
    yo = require("facilPlay")
end

function love.update(dt)
    yo:update(dt)
end

function love.keypressed(key)
end

function love.draw()
    yo:play()
end
