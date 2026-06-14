textbox_class = {
	font = love.graphics.newFont("rs/fonts/earlyGameBoy.ttf", 8),
	image = love.graphics.newImage("rs/textMaker/tM_textbox.png"),
	X = (256 / 2),
	Y = (224 / 2),
	placementOfY = { bottom = 176, top = 48 },
	isAtBottom = true,

	typewriter = {
		speed = 20,
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

	indicator = {
		image = love.graphics.newImage("rs/textMaker/tM_indicator.png"),
		quads = { love.graphics.newQuad(0, 0, 9, 7, 9, 14), love.graphics.newQuad(0, 7, 9, 7, 9, 14) },
		index = 1,
		timer = 1,
		isShowing = false,
	},
}

textbox_class.typewriter.text_full = textbox_class.typewriter.lines[textbox_class.typewriter.linesIndex]
textbox_class.oX = math.floor(textbox_class.image:getWidth() / 2)
textbox_class.oY = math.floor(textbox_class.image:getHeight() / 2)

function textbox_class:next()
	self.typewriter.letterCount = 1
	if self.typewriter.lines[self.typewriter.linesIndex + 1] ~= nil then
		self.typewriter.linesIndex = self.typewriter.linesIndex + 1
	end
end

function textbox_class:update(dt)
	self.typewriter.text_full = self.typewriter.lines[self.typewriter.linesIndex]
	-- Textbox placement
	if self.isAtBottom then
		self.Y = self.placementOfY.bottom
	else
		self.Y = self.placementOfY.top
	end

	-- Text
	if self.typewriter.letterCount < #self.typewriter.text_full then
		self.indicator.isShowing = false
		self.indicator.index = 1
		self.indicator.timer = 1
		self.typewriter.letterCount = self.typewriter.letterCount + (self.typewriter.speed * dt)
	else
		-- Animating the indicator
		self.indicator.timer = self.indicator.timer + (4 * dt)
		if self.indicator.timer > 3 then
			self.indicator.timer = 1
		end

		if self.indicator.timer >= 1 and self.indicator.timer < 2 then
			self.indicator.index = 1
		elseif self.indicator.timer >= 2 then
			self.indicator.index = 2
		end

		self.indicator.isShowing = true
	end

	self.typewriter.text_shown = string.sub(self.typewriter.text_full, 1, self.typewriter.letterCount)
end
-- self.indicator.index
function textbox_class:draw()
	love.graphics.draw(self.image, self.X, self.Y, 0, 1, 1, self.oX, self.oY)
	love.graphics.print(
		self.typewriter.text_shown,
		textbox_class.font,
		((self.X - self.oX) + 9),
		((self.Y - self.oY) + 9)
	)
	if textbox_class.indicator.isShowing then
		love.graphics.draw(
			self.indicator.image,
			self.indicator.quads[self.indicator.index],
			self.X + math.floor(95),
			self.Y + math.floor(20)
		)
	end
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
