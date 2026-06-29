local camera
local playerLib = require("libraries.FacilPlayer")
local objectLib = require("libraries.FacilObject")

local world
local newPlayer
local newObject

function love.load()
	local libCamera = require("FacilCamera")
	camera = libCamera:newCameraObject()
	world = love.physics.newWorld(0, 0, true)
    newPlayer = playerLib.newColliderPlayer(world, 20, 20, 10, 4, 100)
    newObject = objectLib.newColliderObject(world, 90, 80, 30, 30)
end

function love.update(dt)
	newPlayer:update(dt)
    world:update(dt)
	camera.X, camera.Y = - newPlayer.body:getX() + (256 / 2), - newPlayer.body:getY() + (224 / 2)
end

function love.keypressed(key)
end

function love.draw()
	camera:record()
	love.graphics.draw(love.graphics.newImage("rs/bah.png"))
	newPlayer:draw()
    newObject:draw()
	camera:off()
end
