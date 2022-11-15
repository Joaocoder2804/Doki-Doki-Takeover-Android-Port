function onUpdate()
    if getProperty('dad.curCharacter') == 'bigmonika' and getProperty('dad.animation.curAnim.name') == 'Last Note' and getProperty('dad.animation.curAnim.finished') == true then
        setProperty('dad.visible',false)
    end
end