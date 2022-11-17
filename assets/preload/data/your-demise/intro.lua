function onCreate()
    makeLuaSprite('blackScreenDemise','',0,0)
    setObjectCamera('blackScreenDemise','hud')
    makeGraphic('blackScreenDemise',screenWidth,screenHeight,'000000')
    addLuaSprite('blackScreenDemise',false)
end
function onStepHit()
    if curStep ==  132 then
        doTweenAlpha('byeBlackDemise','blackScreenDemise',0,0.2,'linear')
    end
    if curStep == 888 then
        addLuaSprite('blackScreenDemise',false)
        doTweenAlpha('helloBlackDemise','blackScreenDemise',1,2,'linear')
    end
end
function onTweenCompleted(tag)
    if tag == 'byeBlackDemise' then
        removeLuaSprite('blackScreenDemise',false)
    end
end