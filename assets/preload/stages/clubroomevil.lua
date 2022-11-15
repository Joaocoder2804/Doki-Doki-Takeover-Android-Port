local skyX = -200
function onCreate()
    for demiseSky = 0,2 do
        if demiseSky == 0 then
            makeLuaSprite('monikaSky'..demiseSky,'doki/bigmonika/Sky',skyX,0)
        else
            makeLuaSprite('monikaSky'..demiseSky,'doki/bigmonika/Sky',skyX + (getProperty('monikaSky0.width') * demiseSky),0)
        end
        setScrollFactor('monikaSky'..demiseSky,0.5,0.6)
        scaleObject('monikaSky'..demiseSky,1.2,1.2)
        addLuaSprite('monikaSky'..demiseSky)
    end

    makeLuaSprite('monikaBG','doki/bigmonika/BG',-420,-100)
    setScrollFactor('monikaBG',0.5,0.6)
    scaleObject('monikaBG',1.2,1.2)
    addLuaSprite('monikaBG')

    makeLuaSprite('monikaTable','doki/bigmonika/FG',-300,35)
    addLuaSprite('monikaTable')
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