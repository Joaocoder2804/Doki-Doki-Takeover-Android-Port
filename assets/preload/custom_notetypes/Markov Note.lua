function onCreate()
    for i = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Markov Note' then
            setPropertyFromGroup('unspawnNotes',i,'texture','markov_assets')
            setPropertyFromGroup('unspawnNotes',i,'ignoreNote',true)
        end
    end
end
function goodNoteHit(id,data,noteType,sus)
    if noteType == 'Markov Note' then
        setProperty('health',0)
    end
end