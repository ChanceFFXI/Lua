function buff_change(n, gain, buff_table)
    local name
    name = string.lower(n)
    if S{"terror","petrification","sleep","stun"}:contains(name) then
        if gain then
            ChangeGear(sets.stunned)
        elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    if DT == true then
                        ChangeGear(sets.DT[sets.DT.index[DT_ind]]) --! Plug in Proper DT Set
                    else                                           --! Might be Elseif
                        ChangeGear(sets.TP[sets.TP.index[TP_ind]])  --! Change to TP set
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]]) --! Change to IdleSet
                end
            end --! might need to take one END out
        end
    elseif name == "doom" then
        if gain then
            ChangeGear(sets.doomed)
            send_command('@input /p Doomed! Please Cursna! <call11>')
            disable('ring1','ring2','waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    send_command('@input /p Doom is off. Thank you. <call11>')
                    enable('ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom is off. Thank you. <call11>')')
                    enable('ring1','ring2','waist')
                    if DT == true then
                        ChangeGear(sets.DT[sets.DT.index[DT_ind]]) -- Chance to DT set name
                    else
                        ChangeGear(sets.TP[sets.TP.index[TP_ind]])
                    end
                end -- Might need to remove an End
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    send_command('@input /p Doom is off. Thank you. <call11>')')
                    enable('ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom is off. Thank you. <call11>')')
                    enable('ring1','ring2','waist')
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]]) --! Idle Set Here
                end
            end
        end
    elseif name == "charm" then
        if gain then
            send_command('@input /p Charmed!')
        else
            send_command('@input /p Charm is off!')
        end
    elseif name == "weakness" then
        if gain then
            enable('ring1','ring2','waist')
        end
    end