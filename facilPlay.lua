local FacilPlay =
{
    image = love.graphics.newImage("rs/gub.png"),
    hFrames = 2,
    rows = 2,
    timer = 1,
    speed = 1,
    index = 1,
    rowToDisplay = 1,
    quadRows = {}
}
FacilPlay.imageW = FacilPlay.image:getWidth()
FacilPlay.imageH = FacilPlay.image:getHeight()
FacilPlay.qW = FacilPlay.imageW / FacilPlay.hFrames
FacilPlay.qH = FacilPlay.imageH / FacilPlay.rows

for i = 1, FacilPlay.rows do
    table.insert(FacilPlay.quadRows, {})

    for horizontalFrames = 1, FacilPlay.hFrames do
        table.insert(
            FacilPlay.quadRows[i],
            love.graphics.newQuad(
                ((horizontalFrames - 1) * FacilPlay.qW),
                ((i - 1) * FacilPlay.qH),
                FacilPlay.qW,
                FacilPlay.qH,
                FacilPlay.imageW,
                FacilPlay.imageH
            )
        )
    end
end

function FacilPlay:update(dt)
    self.timer = self.timer + (self.speed * dt)
    self.index = math.floor(self.timer)

    if self.index > self.hFrames then
        self.timer = 1
        self.index = 1
    end

    --[[if self.index == self.hFrames then
        self.timer = 1
        self.index = 1
    end]]
end

function FacilPlay:play()
    love.graphics.draw(self.image, self.quadRows[self.rowToDisplay][self.index])
end

return FacilPlay
