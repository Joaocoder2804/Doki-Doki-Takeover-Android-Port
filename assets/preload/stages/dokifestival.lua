local dokiCharacters = {'Yuri','Sayori','protag','Natsuki','monika'}
local dokiPositions = {{-120,120},{100,200},{400,100},{1050,250},{1250,120}}
local dokiLower = ''
local dokiSpeed = {24,24,28,24,24}

local dokiStage = {{'FarBack',-780,-600,false},{'MainBG',-780,-600,false},{'DesksFestival',-780,-600,true},{'FestivalBanner',-780,-550,true}}

local enabledGirls = true
function onCreate()
    if songName == 'Obsession' then
        enabledGirls = false
    end
    for dokiStageLoop = 1,#dokiStage do
        makeLuaSprite('doki'..dokiStage[dokiStageLoop][1],'doki/festival/'..dokiStage[dokiStageLoop][1],dokiStage[dokiStageLoop][2],dokiStage[dokiStageLoop][3])
        scaleObject('doki'..dokiStage[dokiStageLoop][1],1.7,1.7)
        addLuaSprite('doki'..dokiStage[dokiStageLoop][1],dokiStage[dokiStageLoop][4])
    end
    setScrollFactor('dokiFarBack',0.9,0.9)
    setScrollFactor('dokiDesksFestival',1.1,1.1)
    setScrollFactor('dokiFestivalBanner',1.1,1.1)
    if enabledGirls == true then
        for dokiCreate = 1,#dokiCharacters do
            dokiLower = string.lower(dokiCharacters[dokiCreate])
            makeAnimatedLuaSprite('doki'..dokiLower,'doki/bgdoki/'..dokiLower,dokiPositions[dokiCreate][1],dokiPositions[dokiCreate][2])
            addAnimationByPrefix('doki'..dokiLower,'idle',dokiCharacters[dokiCreate]..' BG',dokiSpeed[dokiCreate],false)
            scaleObject('doki'..dokiLower,0.75,0.75)
            setProperty('doki'..dokiLower..'.color',getColorFromHex('7A7A7A'))
            addLuaSprite('doki'..dokiLower,false)
        end
    end
    if not lowQuality then
        makeAnimatedLuaSprite('dokiLightBack','doki/festival/lights_back',195,50)
        addAnimationByPrefix('dokiLightBack','idle','lights back',24,true)
        scaleObject('dokiLightBack',1.7,1.7)
        setBlendMode('dokiLightBack','add')
        addLuaSprite('dokiLightBack',false)

        makeAnimatedLuaSprite('dokiLightFront','doki/festival/lights_front',-1500,350)
        setBlendMode('dokiLightFront','add')
        scaleObject('dokiLightFront',1.7,1.7)
        addAnimationByPrefix('dokiLightFront','idle','Lights front',24,true)
        addLuaSprite('dokiLightFront',true)
    end
end
function onCreatePost()
    reloadBGCharacters()
    setProperty('dad.color',getColorFromHex('7A7A7A'))
    setProperty('boyfriend.color',getColorFromHex('7A7A7A'))
    setProperty('gf.color',getColorFromHex('7A7A7A'))
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