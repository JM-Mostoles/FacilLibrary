local FacilCamera = {
    X = 0,
    Y = 0,
}

function FacilCamera:move(key)
	if key == "a" then
		self.X = self.X  + 10
	end

	if key == "d" then
		self.X = self.X - 10
	end

	if key == "w" then
		self.Y = self.Y + 10
	end

	if key == "s" then
		self.Y = self.Y - 10
	end
end

function FacilCamera:update(dt)
    
end

function FacilCamera:record()
    love.graphics.push()
    love.graphics.translate(self.X, self.Y)
end

function FacilCamera:off()
    love.graphics.pop()
end

local metaCamera = {}
metaCamera.__index = FacilCamera

function FacilCamera.newCameraObject()
    local newCamera = setmetatable({}, metaCamera)
    return newCamera
end

return FacilCamera