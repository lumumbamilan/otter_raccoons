local pd <const> = playdate
local gfx <const> = pd.graphics
local musicPlayer = pd.sound.fileplayer.new("sounds/otter-dead.mp3")
import "player"

class('Enemy').extends(gfx.sprite)

function Enemy:init(x,y, moveSpeed)
    local enemyImage = gfx.image.new("images/raccoon5")
    self:setImage(enemyImage)
    self:moveTo(x,y)
    self:setCollideRect(0, 0, self:getSize()) -- Define collision rectangle
    self:add()
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