
local pd <const> = playdate
local gfx <const> = pd.graphics

local musicPlayer = pd.sound.fileplayer.new("sounds/shot.mp3")

class('Bullet').extends(gfx.sprite)

function Bullet:init(x, y, speed)
        local bulletSize = 4
        local bulletImage = gfx.image.new(bulletSize * 2, bulletSize * 2)
        musicPlayer:play()
        gfx.pushContext(bulletImage)
            gfx.drawCircleAtPoint(bulletSize, bulletSize, bulletSize)
        gfx.popContext()
        self:setImage(bulletImage)
        self.speed = speed
        self:moveTo(x, y)
        self:setCollideRect(0, 0, self:getSize()) -- Define collision rectangle
        self:add()
end

function Bullet:update()
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.speed, self.y)
    if length > 0 then
        for index, collision in ipairs(collisions) do
            local collidedObject = collision['other']
              if collidedObject:isa(Enemy) then
                collidedObject:remove()
                incrementScore()
                decrementAmmunition()
                setShakeAmount(5)
                self:remove()
                return
              elseif collidedObject:isa(Ammunition) then
                collidedObject:remove()
                incrementAmmunition()
                decrementAmmunition()
                setShakeAmount(5)
                self:remove()
                return
            end
        end

    elseif actualX > 400 then
        self:remove()    
        decrementAmmunition()
    end

end

