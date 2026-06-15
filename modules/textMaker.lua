textbox_class = {
	isIn = false,
	font = love.graphics.newFont("rs/fonts/earlyGameBoy.ttf", 8),
	r = 0,
	g = 1,
	b = 0,
	a = 0.5,
	image = love.graphics.newImage("rs/textMaker/tM_textbox.png"),
	X = (256 / 2),
	Y = (224 / 2),
	placementOfY = { bottom = 176, top = 48 },
	isAtBottom = true,
	speed = 20,
	lines = {
		"Whats so green about this...",
		"Docet ipsum dolor sit amet",
		"Morbi vestibulum euismod",
		"Sed malesuada augue lacus",
	},
	linesIndex = 1,
	text_shown = "",
	letterCount = 1,
	indicator_image = love.graphics.newImage("rs/textMaker/tM_indicator.png"),
	indicator_quads = { love.graphics.newQuad(0, 0, 9, 7, 9, 14), love.graphics.newQuad(0, 7, 9, 7, 9, 14) },
	indicator_index = 1,
	indicator_timer = 1,
	indicator_isShowing = false,
}

textbox_class.text_full = textbox_class.lines[textbox_class.linesIndex]
textbox_class.oX = math.floor(textbox_class.image:getWidth() / 2)
textbox_class.oY = math.floor(textbox_class.image:getHeight() / 2)

function textbox_class:setIn(bool)
	self.linesIndex = 1
	self.isIn = bool
end

function textbox_class:next()
	self.letterCount = 1
	if self.lines[self.linesIndex + 1] ~= nil then
		self.linesIndex = self.linesIndex + 1
	else
		self:setIn(false)
	end
end

function textbox_class:update(dt)
	if self.isIn then
		self.text_full = self.lines[self.linesIndex]
		-- Textbox placement
		if self.isAtBottom then
			self.Y = self.placementOfY.bottom
		else
			self.Y = self.placementOfY.top
		end

		-- Text
		if self.letterCount < #self.text_full then
			self.indicator_isShowing = false
			self.indicator_index = 1
			self.indicator_timer = 1
			self.letterCount = self.letterCount + (self.speed * dt)
		else
			-- Animating the indicator
			self.indicator_timer = self.indicator_timer + (4 * dt)
			if self.indicator_timer > 3 then
				self.indicator_timer = 1
			end

			if self.indicator_timer >= 1 and self.indicator_timer < 2 then
				self.indicator_index = 1
			elseif self.indicator_timer >= 2 then
				self.indicator_index = 2
			end

			self.indicator_isShowing = true
		end

		self.text_shown = string.sub(self.text_full, 1, self.letterCount)
	end
end

function textbox_class:keypressed(key)
	if self.isIn then
		if key == "rshift" and self.letterCount < #self.text_full then
			self.letterCount = #self.text_full
		end

		if key == "return" and self.letterCount >= #self.text_full then
			self:next()
		end
	end
end
-- self.index
function textbox_class:draw()
	if self.isIn then
		love.graphics.draw(self.image, self.X, self.Y, 0, 1, 1, self.oX, self.oY)
		love.graphics.setColor(self.r, self.g, self.b, self.a)
		love.graphics.print(self.text_shown, textbox_class.font, ((self.X - self.oX) + 9), ((self.Y - self.oY) + 9))
		love.graphics.setColor(1, 1, 1, 1)
		if self.indicator_isShowing then
			love.graphics.draw(
				self.indicator_image,
				self.indicator_quads[self.indicator_index],
				self.X + math.floor(95),
				self.Y + math.floor(20)
			)
		end
	end
end

local metaBox = {}
metaBox.__index = textbox_class

function textbox_class.new(bottom, speed, lines, r, g, b, a)
	local textInstance = setmetatable({}, metaBox)

	textInstance.isAtBottom = bottom == true
	textInstance.speed = speed or 2
	textInstance.lines = lines or textbox_class.lines
	textInstance.r = r or 1
	textInstance.g = g or 1
	textInstance.b = b or 1
	textInstance.a = a or 1

	return textInstance
end
