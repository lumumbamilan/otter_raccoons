import "scoreDisplay"

local pd <const> = playdate
local gfx <const> = pd.graphics

local musicPlayer = pd.sound.fileplayer.new("sounds/raccoon-dead.mp3")

local highestScoreSprite
local highestScore = 0
local score


function createHighestScoreDisplay()
    highestScoreSprite = gfx.sprite.new()
    updateHighestDisplay()
    highestScoreSprite:setCenter(0, 0)
    highestScoreSprite:moveTo(200, 4)
    highestScoreSprite:add()
end

function updateHighestDisplay()
    local highestScoreText = "Highest: " .. highestScore
    local textWidth, textHeight = gfx.getTextSize(highestScoreText)
    local highestScoreImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(highestScoreImage)
    gfx.drawText(highestScoreText, 0, 0)
    gfx.popContext()
    highestScoreSprite:setImage(highestScoreImage)
end

function checkAndUpdateHighestScore()
    local score = getScore()
    if score > highestScore then
        highestScore = score
        updateHighestDisplay()
    end
end

 function setHighestScore(newScore)
    local score = getScore() or 1
      checkAndUpdateHighestScore()
 end