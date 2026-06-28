local animLib = require("libraries.FacilAnimPlayer")
local myNewAnimation

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    myNewAnimation = animLib.newAnimation(love.graphics.newImage("rs/boyagobb.png"), 4, 2, 1, 5, 150, 120, 7, 31)
end

function love.update(dt)
    myNewAnimation:update(dt)
end

function love.keypressed(key)
    if key == "w" then
        myNewAnimation:changeDisplayedRow(1)
    end
    if key == "q" then
        myNewAnimation:changeDisplayedRow(2)
    end
end

function love.draw()
    myNewAnimation:play()
end
