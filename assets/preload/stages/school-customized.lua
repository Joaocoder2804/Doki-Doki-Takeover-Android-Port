function onCreate()
    makeLuaSprite('schoolSky','schoolStage/weebSky',-200,0)
    setScrollFactor('schoolSky',0.6,0.90)
    setProperty('schoolSky.antialiasing',false)
    scaleObject('schoolSky',6,6)
    addLuaSprite('schoolSky',false)

    makeLuaSprite('schoolSchool','schoolStage/weebSchool',-200,0)
    setScrollFactor('schoolSchool',0.6,0.90)
    setProperty('schoolSchool.antialiasing',false)
    scaleObject('schoolSchool',6,6)
    addLuaSprite('schoolSchool',false)

    makeAnimatedLuaSprite('schoolTree','schoolStage/weebTrees',-800,-1000)
    addAnimationByPrefix('schoolTree','idle','tress_',12,true)
    setScrollFactor('schoolTree',0.85,0.85)
    setProperty('schoolTree.antialiasing',false)
    scaleObject('schoolTree',6,6)
    addLuaSprite('schoolTree',false)

    makeLuaSprite('schoolGround','schoolStage/weebStreet',-200,0)
    setScrollFactor('schoolGround',0.95,0.95)
    setProperty('schoolGround.antialiasing',false)
    scaleObject('schoolGround',6,6)
    addLuaSprite('schoolGround',false)
    if songName == 'Bara No Yume' or songName == 'poems-n-thorns' then
        makeAnimatedLuaSprite('schoolGirls','schoolStage/bgFreaks',-100,190)
        addAnimationByPrefix('schoolGirls','idle','BG fangirls',30,true)
        setScrollFactor('schoolGirls',0.95,0.95)
        setProperty('schoolGirls.antialiasing',false)
        scaleObject('schoolGirls',6,6)
        addLuaSprite('schoolGirls',false)
    end
end