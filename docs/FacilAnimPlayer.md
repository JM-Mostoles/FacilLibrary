# FacilAnimPlayer

## Usage
FacilAnimPlayer is a library which allows you to take a row from an spritesheet and reproduce it as an animation. Parameters allow you to change the row to be reproduced.

To begin with, import the library and create an animated object;

```lua

-- Main.lua

local animLib = require("libraries.FacilAnimPlayer")

local Animation

function love.load()
    --love.graphics.setDefaultFilter("nearest", "nearest") <- Not necessary but recommended for pixel art.
    myNewAnimation = animLib.newAnimation(love.graphics.newImage("YOUR_IMAGE.png"), 4, 2, 1, 5, 20, 20, 7, 31)
```

The function .newAnimation recieves the following parameters;

```lua
    myNewAnimation = animLib.newAnimation(
        (Image), 
        (Vertical frames, an integer value), 
        (Number of rows, an integer value), 
        (Row to display, an integer value), 
        (Speed, int recomended), 
        (Starting X position, int recomended), 
        (Starting Y position, int recomended),
        (Frame offset in the X axis, int recomended),
        (Frame offset in the Y axis, int recomended)
        )
```

In order to see the animation play, you must use the methods :update(dt) and :draw().

## Methods
- :setSpeed(boolean)  
- :changeDisplayedRow(number)
- :setFrame(number)
- :setPause(Boolean)
- :togglePause()

## Example of usage

```lua

--Main.lua

local animLib = require("libraries.FacilAnimPlayer")
local myNewAnimation

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    myNewAnimation = animLib.newAnimation(love.graphics.newImage("rs/boyagobb.png"), 4, 2, 1, 5, 150, 120, 7, 31)
end

function love.update(dt)
    myNewAnimation:update(dt)
end

function love.keypressed(key)
    if key == "w" then
        myNewAnimation:changeDisplayedRow(1)
    end
    if key == "q" then
        myNewAnimation:changeDisplayedRow(2)
    end
end

function love.draw()
    myNewAnimation:play()
end

```