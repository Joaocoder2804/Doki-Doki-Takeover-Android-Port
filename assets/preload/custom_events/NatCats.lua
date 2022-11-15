local catsCreated = false
function onCreate()
    makeAnimatedLuaSprite('CatsEvent','BakaBGDoodles',0,-20)
    setObjectCamera('CatsEvent','hud')
    addAnimationByPrefix('CatsEvent','normal','Normal Overlay',24,true)
    addAnimationByPrefix('CatsEvent','rock','Rock Overlay',24,true)
    scaleObject('CatsEvent',1.9,1.9)
    setProperty('CatsEvent.alpha',0)
end
function onEvent(name,v1,v2)
    if name == 'NatCats' then
        local startV1 = nil
        local endV1 = nil
        startV1,endV1 = string.find(v1,',',0,true)
        if startV1 ~= nil and string.sub(v1,0,startV1 - 1) == 'true' or v1 == 'true' or v1 == '' then
            if catsCreated == false then
                addLuaSprite('CatsEvent',false)
                if startV1 ~= nil then
                    doTweenAlpha('HelloCats','CatsEvent',1,string.sub(v1,startV1 + 1))
                else
                    doTweenAlpha('HelloCats','CatsEvent',1,1)
                end
                catsCreated = true
            end
        else
            if catsCreated == true then
                if startV1 ~= nil then
                    doTweenAlpha('HelloCats','CatsEvent',0,string.sub(v1,startV1 + 1))
                else
                    doTweenAlpha('HelloCats','CatsEvent',0,1)
                end
                catsCreated = false
            end
        end
        if catsCreated == true then
            if v2 == '0' or v2 == '' then
                objectPlayAnimation('CatsEvent','normal',true)
            else
                objectPlayAnimation('CatsEvent','rock',true)
            end
        end
    end
end