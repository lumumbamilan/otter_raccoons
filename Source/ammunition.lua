import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics
local musicPlayer = pd.sound.fileplayer.new("sounds/ammunition-empty.mp3")

class('Ammunition').extends(gfx.sprite)

function Ammunition:init(x,y, moveSpeed)
    local ammunitionImage = gfx.image.new("images/ammunition2")
    self:setImage(ammunitionImage)
    self:moveTo(x,y)
    self:setCollideRect(0, 0, self:getSize()) -- Define collision rectangle
    self:add()
    self.moveSpeed = moveSpeed
end

function Ammunition:update()
    self:moveBy(-self.moveSpeed, 0)
     if self.x < 0 then
        musicPlayer:play()
     end
     self:checkCollisionWithPlayer()
end

function Ammunition:checkCollisionWithPlayer()
    local overlappingSprites = self:overlappingSprites()
    for _, sprite in ipairs(overlappingSprites) do
        if sprite:isa(Player) then
            incrementAmmunition()
            self:remove()
            break
        end
    end
end

