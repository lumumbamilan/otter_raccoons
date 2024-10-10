
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "player"
import "enemySpawner"
import "scoreDisplay"
import "screenShake"
import "ammunitionDisplay"
import "ammunition"
import "ammunitionSpawner"
import "highestScoreDisplay"

local pd <const> = playdate
local gfx <const> = pd.graphics
local snd <const> = pd.sound


local screenShakeSprite = ScreenShake()
function preloadSounds()
--    musicPlayer = snd.fileplayer.new("sounds/music.mp3")
    if not musicPlayer then
        print("Failed to load music file")
    end
end

function playMusic()
    if musicPlayer then
        musicPlayer:play()
    else
        print("Music player not initialized")
    end
end

preloadSounds()

function resetGame()
    checkAndUpdateHighestScore()
    resetScore()
    resetAmmunition()
    clearEnemies()
    clearAmmunition()
    stopSpawner()
    stopSpawnerAmmunition()
    startSpawner()
    startSpawnerAmmunition()
    setShakeAmount(10)
end

function setShakeAmount(amount)
    screenShakeSprite:setShakeAmount(amount)
end


createScoreDisplay()
createAmmunitionDisplay()
createHighestScoreDisplay()
Player(30,120)
startSpawner()
startSpawnerAmmunition()
-- musicPlayer:play()

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()


    -- Example of playing a sound effect on a specific event
    if someEventTriggered then
        playSoundEffect()
    end
end