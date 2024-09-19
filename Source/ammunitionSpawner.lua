import "ammunition"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer

function startSpawnerAmmunition()
    math.randomseed(pd.getSecondsSinceEpoch())
    createTimerAmmunition()
end

function createTimerAmmunition()
--   local spawnTime = math.random(500, 1000)
   local spawnTime = math.random(5000, 10000)
    spawnTimer = pd.timer.performAfterDelay(spawnTime, function ()
        createTimerAmmunition()
        spawnAmmunition()
    end)
end

function spawnAmmunition()
--    local spawnPosition = math.random(10, 230)
    local spawnPosition = math.random(25, 230)
    Ammunition(430, spawnPosition, 1)
end

function stopSpawnerAmmunition()
    if spawnTimerAmmunition then
        spawnTimerAmmunition:remove()
    end
end

function clearAmmunition()
    local allSprites = gfx.sprite.getAllSprites()
    for index, sprite in ipairs(allSprites) do
        if  sprite:isa(Ammunition) then
                sprite:remove()
        end
    end
end