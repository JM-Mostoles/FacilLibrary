local function newPlayer(playerWorld, pX, pY, pW, pH, pSpeed)
    local FacilPlayer = {
        body = love.physics.newBody(playerWorld, pX, pY, "dynamic"),
        shape = love.physics.newRectangleShape(pW, pH),
        speed = pSpeed,
        dx = 0,
        dy = 0
    }
    FacilPlayer.fixture = love.physics.newFixture(FacilPlayer.body, FacilPlayer.shape)

    function FacilPlayer:update(dt)
        self.dx, self.dy = 0, 0

        if love.keyboard.isDown("left") then
            self.dx = -self.speed
        end

        if love.keyboard.isDown("right") then
            self.dx = self.speed
        end

        if love.keyboard.isDown("up") then
            self.dy = -self.speed
        end

        if love.keyboard.isDown("down") then
            self.dy = self.speed
        end

        local len = math.sqrt(self.dx * self.dx + self.dy * self.dy)

        if len > 0 then
            self.dx = self.dx / len * self.speed
            self.dy = self.dy / len * self.speed
        end
        self.body:setLinearVelocity(self.dx, self.dy)
    end

    function FacilPlayer:draw(dt)
        local x, y = self.body:getPosition()
        local x2, y2 = pW / 2, pH / 2
        love.graphics.rectangle(
            "line",
            x - x2,
            y - y2,
            pW,
            pH
        )
    end

    return FacilPlayer
end

return newPlayer
