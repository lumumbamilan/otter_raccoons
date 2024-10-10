import "bullet"
import "ammunitionDisplay"
import "enemy"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x,y)
    local playerImage = gfx.image.new("images/otter3")
    self:setImage(playerImage)
    self:moveTo(x,y)
    self:setCollideRect(0, 0, self:getSize()) -- Define collision rectangle
    self:add()
    self.speed = 3
end    

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.y > 40 then
            self:moveBy(0, -self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 220 then
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

        -- Check for collision with enemies and ammunution
        self:checkCollisionWithEnemies()
 --       self:checkCollisionWithAmmunition()
end

function Player:checkCollisionWithEnemies()
    local overlappingSprites = self:overlappingSprites()
    for _, sprite in ipairs(overlappingSprites) do
        if sprite:isa(Enemy) then
            resetGame()
            break
        end
    end
end

--[[function Player:checkCollisionWithAmmunition()
    local overlappingSprites = self:overlappingSprites()
    for _, sprite in ipairs(overlappingSprites) do
        if sprite:isa(Ammunition) then
            incrementAmmunition()
--            self:remove()
            break
        end
    end
end
]]
