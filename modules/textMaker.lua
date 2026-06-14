require("modules.easyTimer")

textbox_class = {
	font = love.graphics.newFont("rs/fonts/earlyGameBoy.ttf", 8),
	image = love.graphics.newImage("rs/textMaker/tM_textbox.png"),
	X = (256 / 2),
	Y = (224 / 2),
	placementOfY = { bottom = 176, top = 48 },
	isAtBottom = true,

	typewritter = {
		speed = 10,
		lines = {
			"Lorem ipsum dolor sit amet",
			"Docet ipsum dolor sit amet",
			"Morbi vestibulum euismod",
			"Sed malesuada augue lacus",
		},
		linesIndex = 1,
		text_shown = "",
		letterCount = 1,
	},
}
textbox_class.typewritter.text_full = textbox_class.typewritter.lines[textbox_class.typewritter.linesIndex]
textbox_class.oX = math.floor(textbox_class.image:getWidth() / 2)
textbox_class.oY = math.floor(textbox_class.image:getHeight() / 2)

function textbox_class:next()
	self.typewritter.letterCount = 1
	if self.typewritter.lines[self.typewritter.linesIndex + 1] ~= nil then
		self.typewritter.linesIndex = self.typewritter.linesIndex + 1
	end
end

function textbox_class:update(dt)
	self.typewritter.text_full = self.typewritter.lines[self.typewritter.linesIndex]
	-- Textbox placement
	if self.isAtBottom then
		self.Y = self.placementOfY.bottom
	else
		self.Y = self.placementOfY.top
	end

	-- Text
	if self.typewritter.letterCount < #self.typewritter.text_full then
		self.typewritter.letterCount = self.typewritter.letterCount + (self.typewritter.speed * dt)
	end
	self.typewritter.text_shown = string.sub(self.typewritter.text_full, 1, self.typewritter.letterCount)
end

function textbox_class:draw()
	love.graphics.draw(self.image, self.X, self.Y, 0, 1, 1, self.oX, self.oY)
	love.graphics.print(
		self.typewritter.text_shown,
		textbox_class.font,
		((self.X - self.oX) + 9),
		((self.Y - self.oY) + 9)
	)
end

--[[
local metaBox = {}
metaBox.__index = textbox_class

function textbox_class.new(X, Y)
	local textInstance = setmetatable({}, metaBox)

	textInstance.X = X 
	textInstance.Y = Y

	return textInstance
end
]]
