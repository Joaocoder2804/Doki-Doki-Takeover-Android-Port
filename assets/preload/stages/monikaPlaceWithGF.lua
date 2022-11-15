local skyX = -200
function onCreate()
    for demiseSky = 0,2 do
        if demiseSky == 0 then
            makeLuaSprite('monikaSky'..demiseSky,'monika/FinaleBG_1',skyX,0)
        else
            makeLuaSprite('monikaSky'..demiseSky,'monika/FinaleBG_1',skyX + (getProperty('monikaSky0.width') * demiseSky),0)
        end
        setScrollFactor('monikaSky'..demiseSky,0.5,0.6)
        scaleObject('monikaSky'..demiseSky,2.2,2.2)
        setProperty('monikaSky'..demiseSky..'.antialiasing',false)
        addLuaSprite('monikaSky'..demiseSky)
    end
    makeLuaSprite('monikaBG','monika/FinaleBG_2',-400,-100)
    setScrollFactor('monikaBG',0.5,0.6)
    scaleObject('monikaBG',2.2,2.2)
    setProperty('monikaBG.antialiasing',false)
    addLuaSprite('monikaBG')

    makeLuaSprite('monikaTable','monika/FinaleFG',-100,-27)
    scaleObject('monikaTable',1.5,1.5)
    setProperty('monikaTable.antialiasing',false)
    addLuaSprite('monikaTable')
end
function onCreatePost()
    setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup') - 1)
    setObjectOrder('gfGroup',getObjectOrder('dadGroup') + 1)
end
function onUpdate()
    for demiseSky = 0,2 do
        setProperty('monikaSky'..demiseSky..'.x',getProperty('monikaSky'..demiseSky..'.x') - 0.5)
    end
    if getProperty('monikaSky1.x') <= skyX - getProperty('monikaSky1.width') then
        setProperty('monikaSky0.x',skyX)
        setProperty('monikaSky1.x',skyX + getProperty('monikaSky0.width'))
        setProperty('monikaSky2.x',skyX + (getProperty('monikaSky0.width') * 2))
    end
end