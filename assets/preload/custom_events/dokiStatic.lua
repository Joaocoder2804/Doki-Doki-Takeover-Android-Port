function onCreate()
    makeAnimatedLuaSprite('dokiStatic','staticshock',0,0)
    addAnimationByPrefix('dokiStatic','static','hueh',24,true)
    setBlendMode('dokiStatic','subtract')
    setProperty('dokiStatic.alpha',0.7)
    setObjectCamera('dokiStatic','hud')
    precacheImage('staticshock')
end
function onEvent(name,v1,v2)
    if name == 'dokiStatic' then
        local enabled = false
        local startCommaV1 = nil
        local endCommaV1 = nil
        local start2CommaV1 = nil
        local end2CommaV1 = nil

        local staticLayer = ''
        local staticAhead = ''
        local staticEasing = ''

        local startCommaV2 = nil
        local endCommaV2 = nil
        local start2CommaV2 = nil
        local end2CommaV2 = nil

        local staticTweenDuration = ''
        local staticAlpha = ''

        startCommaV1,endCommaV1 = string.find(v1,',',0,true)
        if startCommaV1 ~= nil then
            start2CommaV1,end2CommaV1 = string.find(v1,',',startCommaV1 + 1,true)
            if start2CommaV1 ~= nil then
                staticAhead = string.sub(v1,startCommaV1 + 1,start2CommaV1 - 1)
                staticLayer = string.sub(v1,start2CommaV1 + 1)
            else
                staticAhead = string.sub(v1,startCommaV1 + 1)
                staticLayer = 'hud'
            end
        else
            start2CommaV1 = nil
            end2CommaV1 = nil
            staticLayer = 'hud'
            staticAhead = 'false'
        end
        if startCommaV2 ~= nil then
            start2CommaV2,end2CommaV2 = string.find(v2,',',startCommaV1 + 1,true)
            if start2CommaV2 == nil then
                staticAlpha = string.sub(v2,0,startCommaV2 - 1)
                staticTweenDuration = string.sub(v2,start2CommaV2 + 1)
                staticTweenDuration = 'linear'
            else
                staticAlpha = string.sub(v2,0,startCommaV2 - 1)
                staticTweenDuration = string.sub(v2,start2CommaV2 + 1,start2CommaV2 - 1)
                staticEasing = string.sub(v2,start2CommaV2 + 1,start2CommaV2 - 1)
            end
        else
            start2CommaV2 = nil
            end2CommaV2 = nil
        end
        if startCommaV1 ~= nil then
            if enabled == false then
                if string.sub(v1,0,startCommaV1 - 1) == 'true' then
                    if staticAhead == 'true' then
                        addLuaSprite('dokiStatic',true)
                    else
                        addLuaSprite('dokiStatic',false)
                    end
                    setObjectCamera('dokiStatic',staticLayer)
                    enabled = true
                end
            end
        else
            if v1 == 'true' or v1 == '' then
                if enabled == false then
                    addLuaSprite('dokiStatic',false)
                    enabled = true
                end
            else
                if enabled == true then
                    removeLuaSprite('dokiStatic',false)
                    enabled = false
                end
            end
        end
        if v2 ~= '' then
            if startCommaV2 ~= nil then
                if start2CommaV2 == nil then
                    doTweenAlpha('alphaDokiStatic','dokiStatic',staticAlpha,stat,1)
                else
                    doTweenAlpha('alphaDokiStatic','dokiStatic',string.sub(v2,0,startCommaV2 - 1),string.sub(v2,start2CommaV2 + 1,start2CommaV2 - 1),string.sub(v2,start2CommaV2 + 1,start2CommaV2 - 1))
                end
            else
                setProperty('dokiStatic.alpha',v2)
            end
        end
    end
end