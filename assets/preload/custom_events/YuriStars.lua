local sprites = {'YuriSparkleFG','YuriSparkleBG'}
local starsCreated = false
local enableStarsMoviment = false
function onCreate()
    makeLuaSprite('PurpleScreenYuri',nil,0,0)
    setObjectCamera('PurpleScreenYuri','hud')
    setProperty('PurpleScreenYuri.alpha',0)
    makeGraphic('PurpleScreenYuri',screenWidth,screenHeight,'FF99F1')
    for yuriStars = 0,1 do
        makeLuaSprite('YuriStars'..yuriStars,sprites[yuriStars + 1],0,0)
        if yuriStars == 0 then
            setObjectCamera('YuriStars'..yuriStars,'hud')
        else
            scaleObject('YuriStars'..yuriStars,1 + (1 - getProperty('defaultCamZoom')),1 + (1 - getProperty('defaultCamZoom')))
            setScrollFactor('YuriStars'..yuriStars,0,0)
        end
        precacheImage(sprites[yuriStars + 1])
    end
    for yuriStars2 = 2,3 do
        makeLuaSprite('YuriStars'..yuriStars2,sprites[yuriStars2 - 1],getProperty('YuriStars1.width') * (yuriStars2 - 2),0)
        if yuriStars == 2 then
            setObjectCamera('YuriStars'..yuriStars2,'hud')
        else
            scaleObject('YuriStars'..yuriStars2,1 + (1 - getProperty('defaultCamZoom')),1 + (1 - getProperty('defaultCamZoom')))
            setScrollFactor('YuriStars'..yuriStars2,0,0)
        end
    end
    for allYuriStars = 0,3 do
        setProperty('YuriStars'..allYuriStars..'.alpha',0)
    end
end
function onEvent(name,v1,v2)
    if name == 'YuriStars' then
        local startV1 = 0
        local endV1 = 0
        startV1,endV1 = string.find(v1,',',0,true)
        if startV1 ~= nil and string.sub(v1,0,startV1 - 1) == 'true' or v1 == 'true' or v1 == '' then
            if starsCreated == false then
                addLuaSprite('PurpleScreenYuri',true)
            end
            enableStarsMoviment = true
            for createYuriStars = 0,3 do
                if starsCreated == false then
                    if createYuriStars == 0 or createYuriStars == 2 then
                        addLuaSprite('YuriStars'..createYuriStars,true)
                    else
                        addLuaSprite('YuriStars'..createYuriStars,false)
                    end
                    if createYuriStars == 3 then
                        starsCreated = true
                    end
                end
                if startV1 ~= nil then
                    doTweenAlpha('HelloStars'..createYuriStars,'YuriStars'..createYuriStars,1,string.sub(v1,startV1 + 1))
                    doTweenAlpha('HelloScreenYuri','PurpleScreenYuri',0.15,string.sub(v1,startV1 + 1))
                elseif startV1 == nil then
                    setProperty('YuriStars'..createYuriStars..'.alpha',1)
                    setProperty('PurpleScreenYuri.alpha',0.15)
                end
            end
        else
            if starsCreated == true then
                for allYuriStars = 0,3 do
                    if startV1 ~= nil then
                        doTweenAlpha('ByeStars'..allYuriStars,'YuriStars'..allYuriStars,0,string.sub(v1,startV1 + 1))
                        doTweenAlpha('ByeScreenYuri','PurpleScreenYuri',0,string.sub(v1,startV1 + 1))
                    elseif startV1 == nil then
                        doTweenAlpha('ByeStars'..allYuriStars,'YuriStars'..allYuriStars,0,1)
                        doTweenAlpha('ByeScreenYuri','PurpleScreenYuri',0,2)
                    end
                end
                starsCreated = false
            end
        end
    end
end
function onUpdate()
    if enableStarsMoviment == true then
        for yuriStars = 0,3 do
            if yuriStars == 0 or yuriStars == 2 then
                setProperty('YuriStars'..yuriStars..'.x',getProperty('YuriStars'..yuriStars..'.x') - 0.5)
            else
                setProperty('YuriStars'..yuriStars..'.x',getProperty('YuriStars'..yuriStars..'.x') - 0.25)
            end
        end
        if getProperty('YuriStars0.x') <= 0 - getProperty('YuriStars0.width') then
            setProperty('YuriStars0.x',0)
            setProperty('YuriStars2.x',getProperty('YuriStars0.width'))
        end
        if getProperty('YuriStars1.x') <= 0 - getProperty('YuriStars1.width') then
            setProperty('YuriStars1.x',0)
            setProperty('YuriStars3.x',getProperty('YuriStars1.width'))
        end
    end
end
function onTweenCompleted(tag)
    if tag == 'ByeScreenYuri' then
        enableStarsMoviment = false
        for allYuriStars = 0,3 do
            removeLuaSprite('YuriStars'..allYuriStars,false)
        end
    end
end