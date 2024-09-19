import "highestScoreDisplay"


local pd <const> = playdate
local gfx <const> = pd.graphics

local musicPlayer = pd.sound.fileplayer.new("sounds/raccoon-dead.mp3")

local scoreSprite
local score


function createScoreDisplay()
    scoreSprite = gfx.sprite.new()
    score = 0
    updateDisplay()
    scoreSprite:setCenter(0, 0)
    scoreSprite:moveTo(300, 4)
    scoreSprite:add()
end

function updateDisplay()
    local scoreText = "Score: " .. score
    local textWidth, textHeight = gfx.getTextSize(scoreText)
    local scoreImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(scoreImage)
        gfx.drawText(scoreText, 0, 0)
    gfx.popContext()
    scoreSprite:setImage(scoreImage)
    scoreSprite:setImage(scoreImage)
end

function incrementScore()
    score += 1
    updateDisplay()
    musicPlayer:play()
end

function resetScore()
--    createHighestScoreDisplay() 
    score = 0
    updateDisplay()
end

function scoreGame()
    local scoreText = "Score: " .. score
    updateDisplay()
end

function getScore()
    return score
end

function setScore(newScore)
    score = newScorse
end