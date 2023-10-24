-----------------------------------------------------------------------------
-- Run a calibration scan that measures the center of the screen
-- Date: 2023/10/18
-----------------------------------------------------------------------------
local crossX, crossY, moveSpeed, crossSize, calibrationConfirmed
local width, height

function love.load()
    width, height = love.graphics.getDimensions()
    crossX = width / 2
    crossY = height / 2
    moveSpeed = 1/2

    crossSize = 50

    calibrationConfirmed = false
end

function love.update(dt)
    if not calibrationConfirmed then
        if love.keyboard.isDown("3") then
            crossY = crossY - moveSpeed
        elseif love.keyboard.isDown("4") then
            crossY = crossY + moveSpeed
        end

        if love.keyboard.isDown("2") then
            crossX = crossX - moveSpeed
        elseif love.keyboard.isDown("5") then
            crossX = crossX + moveSpeed
        end
    end
end

function love.draw()
    local crossHalfSize = crossSize / 2
    love.graphics.line(crossX - crossHalfSize, crossY, crossX + crossHalfSize,
                       crossY)
    love.graphics.line(crossX, crossY - crossHalfSize, crossX,
                       crossY + crossHalfSize)

    -- Calculate the offsets
    local offsetX = crossX - width / 2
    local offsetY = crossY - height / 2

    love.graphics.print("Offset from Center: " .. offsetX .. ", " .. offsetY,
                        10, height - 30)

    if calibrationConfirmed then
        love.graphics.print("Calibration confirmed.", 10, 30)
    end
end

function love.keyreleased(key)
    if key == 'return' then calibrationConfirmed = true end
end

function love.keypressed(key)
    if key == 'escape' then love.event.quit() end
end
