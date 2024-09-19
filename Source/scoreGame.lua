local pd <const> = playdate
local gfx <const> = pd.graphics
local scoreSprite
local score

function scoreGame()
    local scoreText = "Score: " .. score
    local textWidth, textHeight = gfx.getTextSize(scoreText)
    local scoreImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(scoreImage)
        gfx.drawText(scoreText, 0, 0)
    gfx.popContext()
    scoreSprite:setImage(scoreImage)
end