local function FacilObject(objectWorld, oX, oY, oW, oH)
    local newObject = {
        body = love.physics.newBody(objectWorld, oX, oY, "static"),
        shape = love.physics.newRectangleShape(oW, oH)
    }
    newObject.fixture = love.physics.newFixture(newObject.body, newObject.shape)

    function newObject:draw()
        local x, y = self.body:getPosition()
        local x2, y2 = oW / 2, oH / 2
        love.graphics.rectangle("line",
            x - x2,
            y - y2,
            oW,
            oH
        )
    end

    return newObject
end

return FacilObject
