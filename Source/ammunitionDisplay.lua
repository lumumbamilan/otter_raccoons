local pd <const> = playdate
local gfx <const> = pd.graphics

local musicPlayer = pd.sound.fileplayer.new("sounds/ammunition-empty.mp3") 


local ammunition
local ammunitionSprite

function createAmmunitionDisplay()
    ammunitionSprite = gfx.sprite.new()
    ammunition = 20
    updateAmunDisplay()
    ammunitionSprite:setCenter(0, 0)
    ammunitionSprite:moveTo(60, 4)
    ammunitionSprite:add()
end

function updateAmunDisplay()
    local ammunitionText = "Ammunition: " .. ammunition
    local textWidth, textHeight = gfx.getTextSize(ammunitionText)
    local ammunitionImage = gfx.image.new(textWidth, textHeight)
    ammunitionSprite:setImage(ammunitionImage)
    gfx.pushContext(ammunitionImage)
        gfx.drawText(ammunitionText, 0, 0)
    gfx.popContext()
    ammunitionSprite:setImage(ammunitionImage)
end

function decrementAmmunition()
    ammunition -= 1
    updateAmunDisplay()
    -- musicPlayer:play() 
end

function resetAmmunition()
    ammunition = 20
    updateAmunDisplay()
end

function incrementAmmunition()
    ammunition += 5
    updateAmunDisplay()
    musicPlayer:play() 
end

function checkAmmunition()
    return ammunition
end    