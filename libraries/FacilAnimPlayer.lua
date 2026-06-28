local FacilAnimPlayer = {}

function FacilAnimPlayer.newAnimation(image, horizontalFrames, rows, rowToPlay, speed, xPos, yPos, pOffsetX, pOffsetY)
    local newAnimatedObject =
    {
        image = image,
        hFrames = horizontalFrames,
        rows = rows,
        rowToDisplay = rowToPlay,
        speed = speed,
        timer = 1,
        index = 1,
        isPaused = false,
        quadRows = {},
        X = xPos,
        Y = yPos
    }
    newAnimatedObject.imageW = newAnimatedObject.image:getWidth()
    newAnimatedObject.imageH = newAnimatedObject.image:getHeight()
    newAnimatedObject.qW = newAnimatedObject.imageW / newAnimatedObject.hFrames
    newAnimatedObject.qH = newAnimatedObject.imageH / newAnimatedObject.rows

    for i = 1, newAnimatedObject.rows do
        table.insert(newAnimatedObject.quadRows, {})

        for horFrames = 1, newAnimatedObject.hFrames do
            table.insert(
                newAnimatedObject.quadRows[i],
                love.graphics.newQuad(
                    ((horFrames - 1) * newAnimatedObject.qW),
                    ((i - 1) * newAnimatedObject.qH),
                    newAnimatedObject.qW,
                    newAnimatedObject.qH,
                    newAnimatedObject.imageW,
                    newAnimatedObject.imageH
                )
            )
        end
    end

    function newAnimatedObject:setSpeed(number)
        self.speed = number
    end

    function newAnimatedObject:changeDisplayedRow(number)
        self.rowToDisplay = number
    end

    function newAnimatedObject:setFrame(number)
        self.timer = number
    end

    function newAnimatedObject:setPause(bool)
        self.isPaused = bool
    end

    function newAnimatedObject:togglePause()
        self.isPaused = not self.isPaused
    end

    function newAnimatedObject:update(dt)
        if not self.isPaused then
            self.timer = self.timer + (self.speed * dt)
        self.index = math.floor(self.timer)
        end

        if self.index > self.hFrames then
            self.timer = 1
            self.index = 1
        end
    end

    function newAnimatedObject:play()
        love.graphics.draw(self.image, self.quadRows[self.rowToDisplay][self.index], self.X, self.Y, 0, 1, 1, pOffsetX, pOffsetY)
    end

    return newAnimatedObject
end

return FacilAnimPlayer
