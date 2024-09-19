local pd <const> = playdate
local gfx <const> = pd.graphics
local musicPlayer = pd.sound.fileplayer.new("sounds/ammunition-empty.mp3")

class('Ammunition').extends(gfx.sprite)

function Ammunition:init(x,y, moveSpeed)
    local ammunitionImage = gfx.image.new("images/ammunition2")
    self:setImage(ammunitionImage)
    self:moveTo(x,y)
    self:add()

    self:setCollideRect(0, 0, self:getSize()) 

    self.moveSpeed = moveSpeed
end

function Ammunition:update()
    self:moveBy(-self.moveSpeed, 0)
    if self.x < 0 then
        musicPlayer:play()
--        resetGame()
    end
end

function Ammunition:collisionResponse()
    return "overlap"
end