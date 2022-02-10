Recoils = {
	[`WEAPON_PISTOL`] 			= {recoil = 0.40, shake = 0.2},
	[`WEAPON_PISTOL_MK2`] 			= {recoil = 0.55, shake = 0.175},
	[`WEAPON_COMBATPISTOL`] 		= {recoil = 0.325, shake = 0.140},
	[`WEAPON_APPISTOL`] 			= {recoil = 0.675, shake = 0.275},
	[`WEAPON_PISTOL50`]			    = {recoil = 0.8, shake = 0.3},
	[`WEAPON_SNSPISTOL`]			= {recoil = 0.8, shake = 0.3},
	[`WEAPON_SNSPISTOL_MK2`]		= {recoil = 0.450, shake = 0.180},
	[`WEAPON_HEAVYPISTOL`] 			= {recoil = 0.900, shake = 0.25},
	[`WEAPON_VINTAGEPISTOL`] 		= {recoil = 0.885, shake = 0.275},
	[`WEAPON_MARKSMANPISTOL`] 		= {recoil = 3.2, shake = 0.8},
	[`WEAPON_REVOLVER`] 			= {recoil = 1.2, shake = 0.8},
	[`WEAPON_REVOLVER_MK2`] 		= {recoil = 0.92, shake = 0.5},
	[`WEAPON_DOUBLEACTION`]			= {recoil = 0.9, shake = 0.8},
	[`WEAPON_STUNGUN`] 			= {recoil = 0.0, shake = 0.0},
	[`WEAPON_FLAREGUN`] 			= {recoil = 0.00, shake = 0.0},
	[`WEAPON_CERAMICPISTOl`] 		= {recoil = 0.00, shake = 0.0},
	[`WEAPON_NAVYREVOLVER`] 		= {recoil = 0.00, shake = 0.0},
	[`WEAPON_GADGETPISTOL`] 		= {recoil = 1.4, shake = 0.5},

	[`WEAPON_MICROSMG`] 			= {recoil = 0.60, shake = 0.3},
	[`WEAPON_SMG`] 				= {recoil = 0.70, shake = 0.2},
	[`WEAPON_SMG_MK2`]			= {recoil = 0.6, shake = 0.1},
	[`WEAPON_ASSAULTSMG`]			= {recoil = 0.5, shake = 0.2},
	[`WEAPON_COMBATPDW`]			= {recoil = 0.8, shake = 0.2},
	[`WEAPON_MACHINEPISTOL`]		= {recoil = 0.7, shake = 0.2},
	[`WEAPON_MINISMG`]			= {recoil = 0.9, shake = 0.4},

	[`WEAPON_PUMPSHOTGUN`]			= {recoil = 0.7, shake = 0.2},
	[`WEAPON_PUMPSHOTGUN_MK2`]		= {recoil = 0.9, shake = 0.3},
	[`WEAPON_SAWNOFFSHOTGUN`]		= {recoil = 0.8, shake = 0.5},
	[`WEAPON_ASSAULTSHOTGUN`]		= {recoil = 0.00, shake = 0.0},
	[`WEAPON_BULLPUPSHOTGUN`]		= {recoil = 0.00, shake = 0.0},
	[`WEAPON_MUSKET`]			    = {recoil = 1.2, shake = 0.9},
	[`WEAPON_HEAVYSHOTGUN`]			= {recoil = 0.00, shake = 0.0},
	[`WEAPON_DBSHOTGUN`]			= {recoil = 1.0, shake = 0.7},
	[`WEAPON_AUTOSHOTGUN`]			= {recoil = 0.00, shake = 0.0},
	[`WEAPON_COMBATSHOTGUN`]		= {recoil = 0.00, shake = 0.0},

	[`WEAPON_ASSAULTRIFLE`]			= {recoil = 0.6, shake = 0.4},
	[`WEAPON_ASSAULTRIFLE_MK2`]		= {recoil = 0.5, shake = 0.2},
	[`WEAPON_CARBINERIFLE`]			= {recoil = 0.4, shake = 0.3},
	[`WEAPON_CARBINERIFLE_MK2`]		= {recoil = 0.3, shake = 0.2},
	[`WEAPON_ADVANCEDRIFLE`]		= {recoil = 0.00, shake = 0.0},
	[`WEAPON_SPECIALCARBINE`]		= {recoil = 0.3, shake = 0.2},
	[`WEAPON_SPECIALCARBINE_MK2`]		= {recoil = 0.3, shake = 0.2},
	[`WEAPON_BULLPUPRIFLE`]			= {recoil = 0.00, shake = 0.0},
	[`WEAPON_BULLPUPRIFLE_MK2`]		= {recoil = 0.00, shake = 0.0},
	[`WEAPON_COMPACTRIFLE`]			= {recoil = 0.7, shake = 0.4},
	[`WEAPON_MILITARYRIFLE`]		= {recoil = 0.00, shake = 0.0},
	[`WEAPON_HEAVYRIFLE`]			= {recoil = 0.00, shake = 0.0},

	[`WEAPON_GUSENBERG`]			= {recoil = 0.7, shake = 0.3},

	[`WEAPON_SNIPERRIFLE`]			= {recoil = 0.8, shake = 0.8},
	[`WEAPON_HEAVYSNIPER`]			= {recoil = 0.9, shake = 0.9},
	[`WEAPON_HEAVYSNIPER_MK2`]		= {recoil = 1.0, shake = 0.6},
}

CreateThread(function()
	while true do
		Wait(0)
		local sleep = 500
		local ped = PlayerPedId()
		if IsPedArmed(ped, 7) then
			local currentWeapon = GetSelectedPedWeapon(ped)
			sleep = 4
			if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
				sleep = 1
				if Recoils[currentWeapon] then
					if Recoils[currentWeapon].shake ~= 0 then
						ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Recoils[currentWeapon].shake)
					end
					if Recoils[currentWeapon].recoil ~= 0 then
						tv = 0
						if GetFollowPedCamViewMode() ~= 4 then
							repeat
								Wait(0)
								p = GetGameplayCamRelativePitch()
								SetGameplayCamRelativePitch(p+0.1, 0.2)
								tv = tv+0.1
							until tv >= Recoils[currentWeapon].recoil
						else
							repeat
								Wait(0)
								p = GetGameplayCamRelativePitch()
								if Recoils[currentWeapon].recoil > 0.1 then
									SetGameplayCamRelativePitch(p+0.6, 1.2)
									tv = tv+0.6
								else
									SetGameplayCamRelativePitch(p+0.016, 0.333)
									tv = tv+0.1
								end
							until tv >= Recoils[currentWeapon].recoil
						end
					end
				end
			end
	    end
		Wait(sleep)
	end
end)
