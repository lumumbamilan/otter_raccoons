local pd <const> = playdate
local gfx <const> = pd.graphics

local musicPlayer = pd.sound.fileplayer.new("sounds/otter-dead.mp3")
import "player"

class('Enemy').extends(gfx.sprite)

function Enemy:init(x,y, moveSpeed)
    local enemyImage = gfx.image.new("images/raccoon5")
    self:setImage(enemyImage)
    self:moveTo(x,y)
    self:add()

    self:setCollideRect(0, 0, self:getSize()) 

    self.moveSpeed = moveSpeed
end

function Enemy:update()
    self:moveBy(-self.moveSpeed, 0)
      if self.x < 0 then
        musicPlayer:play()
        scoreGame()
        resetGame()
      end
end

function checkCollisionWithPlayer(Enemy, Player)
    if Enemy.self.x == Player.self.x then
        musicPlayer:play()
        scoreGame()
        resetGame()
    end
end

function Enemy:collisionResponse()
    return "overlap"
end