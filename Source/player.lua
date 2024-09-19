import "bullet"
import "ammunitionDisplay"

local pd <const> = playdate
local gfx <const> = pd.graphics

Player = {}
Player.__index = Player

function Player:new(x, y, speed)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.speed = speed
    return self
end

function Player:move(dx, dy)
    local newX = self.x + dx
    local newY = self.y + dy

    -- Check boundaries
    if newX < MIN_X then newX = MIN_X end
    if newX > MAX_X then newX = MAX_X end
    if newY < MIN_Y then newY = MIN_Y end
    if newY > MAX_Y then newY = MAX_Y end

    self.x = newX
    self.y = newY
end

function Player:draw()
    -- Drawing logic here
end

class('Player').extends(gfx.sprite)

function Player:init(x,y)
    local playerImage = gfx.image.new("images/otter2")
    self:setImage(playerImage)
    self:moveTo(x,y)
    self:add()
    self.speed = 3
end    

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.y > 0 then
            self:moveBy(0, -self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 240 then
            self:moveBy(0, self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        if self.x > 0 then
            self:moveBy(-self.speed,0)
        end
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        if self.x  < 400 then
            self:moveBy(self.speed,0)
        end        
    end    

    if pd.buttonJustPressed(pd.kButtonA) then
        if checkAmmunition() > 0 then
         Bullet(self.x, self.y, 5)
        end
    end

    if pd.buttonJustPressed(pd.kButtonB) then
        if checkAmmunition() > 0 then
            Bullet(self.x, self.y, 15)
        end
    end

   -- if pd.crankJust  

    -- if pd.buttonJustPressed(pd.kButtonB) then
    --    incrementAmmunition()
    -- end


end