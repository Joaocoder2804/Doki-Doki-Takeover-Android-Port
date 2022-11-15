local dokiCharacters = {'Yuri','Sayori','Natsuki'}
local dokiPositions = {{-120,120},{100,200},{1100,250}}
local dokiLower = ''

local enabledGirls = true
function onCreate()
    if songName == 'Obsession' then
        enabledGirls = false
    end
    makeLuaSprite('dokiFarBG','doki/clubroom/DDLCfarbg',-780,-600)
    setScrollFactor('dokiFarBG',0.9,0.9)
    scaleObject('dokiFarBG',1.7,1.7)
    addLuaSprite('dokiFarBG')

    makeLuaSprite('dokiBG','doki/clubroom/DDLCbg',-780,-600)
    scaleObject('dokiBG',1.7,1.7)
    addLuaSprite('dokiBG')

    makeLuaSprite('dokiFront','doki/clubroom/DesksFront',-780,-600)
    setScrollFactor('dokiFront',1.1,1.1)
    scaleObject('dokiFront',1.7,1.7)
    addLuaSprite('dokiFront',true)
    if enabledGirls == true then
        for dokiCreate = 1,#dokiCharacters do
            dokiLower = string.lower(dokiCharacters[dokiCreate])
            makeAnimatedLuaSprite('doki'..dokiLower,'doki/bgdoki/'..dokiLower,dokiPositions[dokiCreate][1],dokiPositions[dokiCreate][2])
            addAnimationByPrefix('doki'..dokiLower,'idle',dokiCharacters[dokiCreate]..' BG',24,false)
            scaleObject('doki'..dokiLower,0.75,0.75)
            addLuaSprite('doki'..dokiLower,false)
        end
    end
end
function onCreatePost()
    reloadBGCharacters()
end
function onStepHit()
    if curBeat % 2 == 0 and enabledGirls == true then
        for dokiCreate = 1,#dokiCharacters do
            dokiLower = string.lower(dokiCharacters[dokiCreate])
            objectPlayAnimation('doki'..dokiLower,'idle',false)
        end
    end
end
function onEvent(name)
    if name == 'Change Character' then
        runTimer('reloadCharacters',0.05)
        reloadBGCharacters(false)
    end
end
function onTimerCompleted()
    if tag == 'reloadCharacters' then
        reloadBGCharacters(false)
    end
end
function reloadBGCharacters(changePosition)
    if enabledGirls == true then
        for dokiCreate = 1,#dokiCharacters do
            dokiLower = string.lower(dokiCharacters[dokiCreate])
            if string.find(string.lower(getProperty('dad.curCharacter')),dokiLower,0,true) ~= nil or string.find(string.lower(getProperty('boyfriend.curCharacter')),dokiLower,0,true) ~= nil  then
                setProperty('doki'..dokiLower..'.visible',false)
            else
                setProperty('doki'..dokiLower..'.visible',true)
            end
        end
    end
end