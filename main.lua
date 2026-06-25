local world
local FacilPlayer = require("libraries.FacilPlayer")
local FacilObject = require("libraries.FacilObject")

function love.load()
  world = love.physics.newWorld(0, 0, true)
  newplayer = FacilPlayer(world, 10, 10, 10, 10, 100)
  newObj1 = FacilObject(world, 150, 50, 200, 6)
  newObj2 = FacilObject(world, 50, 50, 70, 60)

end

function love.update(dt)
  newplayer:update(dt)
  world:update(dt)
end

function love.keypressed(key)
end

function love.draw()
  newplayer:draw()
  newObj1:draw()
  newObj2:draw()
end
