local BeatPorcent = {0}
local BeatCustomPorcent = {0}

local cannotBeat = {0}
local cannotBeatCustom = {0}

local cannotBeatInverted = {0}

local invertedBeat = {0}
local invertedCustomBeat = {0}


local Section = 0
local InvertedSection = 0
local cannotBeatSection = 0

local cannotBeatInt = false
local cannotBeatIntInverted = false

local BeatStrentghGame = 0.015
local BeatStrentghHUD = 0.03

local BeatStrentghInvertedGame = 0.015
local BeatStrentghInvertedHUD = 0.03

local Beated = false
local BeatedCustom = false
local BeatedInverted = false
local BeatedCustomInverted = false

local enabledBeat = true
local enableInverted = true

function onStepHit()
    for cannotBeatLength = 1,#cannotBeat do
        if cannotBeat[cannotBeatLength] ~= nil and cannotBeat[cannotBeatLength] ~= 0 then
            if cannotBeatInt == true and curBeat % cannotBeat[cannotBeatLength] == 0 or cannotBeatInt == false and (curStep/4) % cannotBeat[cannotBeatLength] == 0 then
                enabledBeat = false
            else
                enabledBeat = true
            end
        else
            enabledBeat = true
        end
    end
    for cannotBeatCustomLength = 1,#cannotBeatCustom do
        if cannotBeatCustom[cannotBeatCustomLength] ~= nil and cannotBeatCustom[cannotBeatCustomLength] ~= 0 then
            if (curStep/4) % cannotBeatSection == cannotBeatCustom[cannotBeatCustomLength] then
                enabledBeat = false
            else
                enabledBeat = true
            end
        else
            enabledBeat = true
        end
    end
    for cannotBeatInverLength = 1,#cannotBeatInverted do
        if cannotBeatInverted[cannotBeatInverLength] ~= nil and cannotBeatInverted[cannotBeatInverLength] ~= 0 then
            if cannotBeatIntInverted == true and curBeat % cannotBeatInverted[cannotBeatInverLength] == 0 or cannotBeatIntInverted == false and (curStep/4) % cannotBeatInverted[cannotBeatInverLength] == 0 then
                enableInverted = false
            else
                enableInverted = true
            end
        else
            enableInverted = true
        end
    end
    if enabledBeat == true then
        for BeatsHit = 1,#BeatPorcent do
            if BeatPorcent[BeatsHit] ~= nil and Beated == false then
                if (curStep/4) % BeatPorcent[BeatsHit] == 0 then
                    runTimer('enabledBeat',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghGame,BeatStrentghHUD)
                    Beated = true
                else
                    Beated = false
                end
            else
                Beated = false
            end
        end
        for BeatsCustomHit = 1,#BeatCustomPorcent do
            if BeatCustomPorcent[BeatsCustomHit] ~= nil and BeatedCustom == false then
                if (curStep/4) % Section == BeatCustomPorcent[BeatsCustomHit] then
                    BeatedCustom = true
                    runTimer('enableBeatCustom',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghGame,BeatStrentghHUD)
                else
                    BeatedCustom = false
                end
            else
                BeatedCustom = false
            end
        end
    end
    if enableInverted == true then
        for invertedHit = 1,#invertedBeat do
            if BeatedInverted == false then
                if invertedBeat[invertedHit] ~= nil and invertedBeat[invertedHit] ~= 0 then
                    if (curStep/4) % invertedBeat[invertedHit] == 0 then
                        runTimer('enableInverted',0.01)
                        triggerEvent('Add Camera Zoom',BeatStrentghInvertedGame * -1,BeatStrentghInvertedHUD * -1)
                        BeatedInverted = true
                    else
                        BeatedInverted = false
                    end
                else
                    BeatedInverted = false
                end
            end
        end
        for invertedCustomHit = 1,#invertedCustomBeat do
            if invertedCustomBeat[invertedCustomHit] ~= nil and invertedCustomBeat[invertedCustomHit] ~= 0 then
                if BeatedCustomInverted == false then
                    if (curStep/4) % InvertedSection == invertedCustomBeat[invertedCustomHit] then
                        runTimer('enableCustomInverted',0.01)
                        triggerEvent('Add Camera Zoom',BeatStrentghInvertedGame * -1,BeatStrentghInvertedHUD * -1)
                        BeatedCustomInverted = true
                    else
                        BeatedCustomInverted = false
                    end
                end
            else
                BeatedCustomInverted = false
            end
        end
    end

    if songName == "My Confession" then
        if curStep == 63 or curStep == 496 or curStep == 768 then
            clearBeat()
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,2.5)
            replaceArrayCustomBeat(3,3)
        end
        if curStep == 352 or curStep == 1056 then
            clearCustomBeat()
            replaceArrayBeat(1,1)
        end
        if curStep == 480 or curStep == 751 or curStep == 1184 then
            clearBeat()
            clearCustomBeat()
        end
    end
    if songName == 'Baka' then
        if curStep == 128 or curStep == 704 then
            replaceArrayBeat(1,1)
            replaceArrayCannotBeat(1,4)
        end
        if curStep == 448 or curStep == 960 then
            clearBeat()
            clearCannotBeat()
        end
    end
    if songName == 'crucify(yuri)' then
        if curStep == 384 or curStep == 1408 then
            replaceArrayBeat(1,1)
            replaceArrayCustomBeat(1,3.5)
        end
        if curStep == 640 or curStep == 1664 then
            clearBeat()
            clearCustomBeat()
            replaceArrayCustomBeat(1,2)
            replaceArrayInvertedBeat(1,4)
        end
        if curStep == 888 or curStep == 2169 then
            clearBeat()
            clearCustomBeat()
            clearInvertedBeat()
        end
    end
    if songName == 'beathoven(natsu)' then
        if curStep == 192 or curStep == 848 then
            clearBeat()
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,2.5)
            replaceArrayCustomBeat(3,3)
        end
        if curStep == 448 then
            clearCustomBeat()
            replaceArrayBeat(1,1)
        end
        if curStep == 704 then
            clearBeat()
            clearCustomBeat()
            replaceArrayCustomBeat(1,2)
        end
        if curStep == 824 or curStep == 1168 then
            clearBeat()
            clearCustomBeat()
        end
    end
    if songName == "its-complicated(sayo)" then
        if curStep == 384 or curStep == 640 or curStep == 1278 then
            clearBeat()
            replaceArrayBeat(1,1)
        end
        if curStep == 512 or curStep == 1024 or curStep == 1664 then
            clearBeat()
        end
    end
    if songName == 'Epiphany' then
        if curStep == 288 or curStep == 576 or curStep == 1312 then
            clearCustomBeat()
            clearInvertCustomBeat()
            clearCannotBeat()
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,3)
        end
        if curStep == 800 then
            clearCustomBeat()
            clearBeat()
            Section = 8
            InvertedSection = 8
            replaceArrayCannotBeat(1,8)
            replaceArrayCustomInvertedBeat(1,4)
            BeatStrentghInvertedGame = 0.015
            BeatStrentghInvertedHUD = 0.03
            replaceArrayCustomBeat(1,2)
            replaceArrayCustomBeat(3,3.5)
            replaceArrayCustomBeat(4,5)
            replaceArrayCustomBeat(5,6)
        end
        if curStep == 544 or curStep == 1264 or curStep == 2208 then
            clearBeat()
            clearCustomBeat()
            clearInvertCustomBeat()
            clearCannotBeat()
        end
    end
end
function onTimerCompleted(tag)
    if tag == 'enableBeat' then
        Beated = false
    end
    if tag == 'enableBeatCustom' then
        BeatedCustom = false
    end
    if tag == 'enableInverted' then
        BeatedInverted = false
    end
    if tag == 'enableCustomInverted' then
        BeatedCustomInverted = false
    end
end
function replaceArrayCannotBeat(pos,number)
    if pos == nil then
        table.insert(cannotBeat,#cannotBeat + 1,number)
    else
        if cannotBeat[pos] ~= nil then
            table.remove(cannotBeat,pos)
        end
        table.insert(cannotBeat,pos,number)
    end
end
function clearCannotBeat()
    for clearBeatCannot = 1,#cannotBeat do
        if cannotBeat[clearBeatCannot] ~= nil then
            table.remove(cannotBeat,clearBeatCannot)
        end
        table.insert(cannotBeat,clearBeatCannot,0)
    end
end

function replaceArrayCustomCannotBeat(pos,number)
    if cannotBeatSection == 0 then
        cannotBeatSection = 4
    end
    if pos == nil then
        table.insert(cannotBeatCustom,#cannotBeatCustom + 1,number)
    else
        if cannotBeatCustom[pos] ~= nil then
            table.remove(cannotBeatCustom,pos)
        end
        table.insert(cannotBeatCustom,pos,number)
    end
end
function removeArrayCustomCannotBeat(pos)
    table.remove(cannotBeatCustom,pos)
end
function clearCustomCannotBeat()
    cannotBeatSection = 0
    for clearBeatCustomCannot = 1,#cannotBeatCustom do
        if cannotBeatCustom[clearBeatCustomCannot] ~= nil then
            table.remove(cannotBeatCustom,clearBeatCustomCannot)
        end
        table.insert(cannotBeatCustom,clearBeatCustomCannot,0)
    end
end
function replaceArrayBeat(pos,number)
    if pos == nil then
        table.insert(BeatPorcent,#BeatPorcent + 1,number)
    else
        if BeatPorcent[pos] ~= nil then
            table.remove(BeatPorcent,pos)
        end
        table.insert(BeatPorcent,pos,number)
    end
end
function clearBeat()
    for clearCanBeat = 1,#BeatPorcent do
        if BeatPorcent[clearCanBeat] ~= nil then
            table.remove(BeatPorcent,clearCanBeat)
        end
        table.insert(BeatPorcent,clearCanBeat,0)
    end
end
function replaceArrayCustomBeat(pos,number)
    if Section == 0 then
        Section = 4
    end
    if pos == nil then
        table.insert(BeatCustomPorcent,#BeatCustomPorcent + 1,number)
    else
        if BeatCustomPorcent[pos] ~= nil then
            table.remove(BeatCustomPorcent,pos)
        end
        table.insert(BeatCustomPorcent,pos,number)
    end
end
function clearCustomBeat()
    Section = 0
    for clearCanBeatCustom = 1,#BeatCustomPorcent do
        if BeatCustomPorcent[clearCanBeatCustom] ~= nil then
            table.remove(BeatCustomPorcent,clearCanBeatCustom)
        end
        table.insert(BeatCustomPorcent,clearCanBeatCustom,0)
    end
end

function replaceArrayInvertedBeat(pos,number)
    if pos == nil then
        table.insert(invertedBeat,#invertedBeat + 1,number)
    else
        if invertedBeat[pos] ~= nil then
            table.remove(invertedBeat,pos)
        end
        table.insert(invertedBeat,pos,number)
    end
end
function clearInvertedBeat()
    for clearCanBeatInveted = 1,#invertedBeat do
        if invertedBeat[clearCanBeatInveted] ~= nil then
            table.remove(invertedBeat,clearCanBeatInveted)
        end
        table.insert(invertedBeat,clearCanBeatInveted,0)
    end
end
function replaceArrayInvertedCannotBeat(pos,number)
    if pos == nil then
        table.insert(cannotBeatInverted,#cannotBeatInverted + 1,number)
    else
        if cannotBeatInverted[pos] ~= nil then
            table.remove(cannotBeatInverted,pos)
        end
        table.insert(cannotBeatInverted,pos,number)
    end
end
function clearInvertedCannotBeat()
    for clearBeatCannotCustom = 1,#cannotBeatInverted do
        if cannotBeatInverted[clearBeatCannotCustom] ~= nil then
            table.remove(cannotBeatInverted,clearBeatCannotCustom)
        end
        table.insert(cannotBeatInverted,clearBeatCannotCustom,0)
    end
end

function replaceArrayCustomInvertedBeat(pos,number)
    if InvertedSection == 0 then
        if Section == 0 then
            InvertedSection = 4
        else
            InvertedSection = Section
        end
    end
    if pos == nil then
        table.insert(invertedCustomBeat,#invertedCustomBeat + 1,number)
    else
        if invertedCustomBeat[pos] ~= nil then
            table.remove(invertedCustomBeat,pos)
        end
        table.insert(invertedCustomBeat,pos,number)
    end
end
function clearInvertCustomBeat()
    InvertedSection = 0
    for clearCustomInverted = 1,#invertedCustomBeat do
        if invertedCustomBeat[clearCustomInverted] ~= nil then
            table.remove(invertedCustomBeat,clearCustomInverted)
        end
        table.insert(invertedCustomBeat,clearCustomInverted,0)
    end
end
function clearAllArrays()
    clearCannotBeat()
    clearCustomCannotBeat()
    clearInvertedCannotBeat()
    clearBeat()
    clearCustomBeat()
    clearInvertedBeat()
    clearInvertCustomBeat()
end