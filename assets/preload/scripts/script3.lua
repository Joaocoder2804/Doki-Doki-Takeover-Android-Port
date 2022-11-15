local currentDeath = ''

function onUpdate()
    if getProperty('dad.curCharacter') == 'bigmonika' and currentDeath ~= 'big-monika' then
        setPropertyFromClass('GameOverSubstate','characterName','bigmonika-death')
        setPropertyFromClass('GameOverSubstate','deathSoundName','fnf_loss_sfx-bigmonika')
        currentDeath = 'big-monika'
    end
    if getProperty('boyfriend.curCharacter') == 'playablesenpai' and currentDeath ~= 'big-monika' then
        setPropertyFromClass('GameOverSubstate','characterName','playablesenpai')
        setPropertyFromClass('GameOverSubstate','deathSoundName','fnf_loss_sfx-senpai')
        currentDeath = 'senpai'
    end
end