---------------------------

-- made by parow with <3 --

---------------------------

bliptypeIndex = {1,8,16,36,38,40,43,50,51,52,56,60,61,66,67,68,71,72,73,75,76,77,78,79,80,84,85,88,89,90,93,94,100,102,103,106,108,109,110,119,120,121,122,126,127,133,135,136,140,141,147,149,150,151,152,153,154,155,156,157,158,159,160,162,163,164,171,173,174,175,181,184,188,197,198,205,206,207,225,226,229,238,251,255,266,267,269,270,273,274,277,279,280,285,303,304,305,306,307,308,310,311,313,314,315,316,318,350,351,352,354,355,356,357,358,359,360,361,362,363,365,367,368,369,370,371,372,374,375,376,377,378,379,380,381,382,383,384,385,387,388,389,390,398,400,401,402,403,404,405,408,409,410,411,415,417,418,419,420,421,427,430,431,432,433,434,435,436,437,439,440,441,442,445,446,455,456,458,459,460,461,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,512,513,514,515,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,657,658,659,660,661,662,663,664,665,666,667,668,669}
BlipColorIndex = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85}



blips = {}
blipsData = {}

RegisterNetEvent('bc:SyncBlips')
AddEventHandler('bc:SyncBlips',function(data)

    for i = 1 , #blips, 1 do
        RemoveBlip(blips[i])
    end

    for i = 1 , #data,1 do
        blipsData[i] = data[i]
        local blip = AddBlipForCoord(data[i].pos.x, data[i].pos.y, data[i].pos.z)
        SetBlipSprite(blip, data[i].id)
        SetBlipDisplay(blip, 4)
        SetBlipColour(blip, data[i].color)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, data[i].size)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data[i].label)
        EndTextCommandSetBlipName(blip)
        table.insert(blips,blip)
    end

    updateMenus()
end)


AddEventHandler('playerSpawned', function()
    Wait(3500)
    TriggerServerEvent("bc:requestSync")
end)







function GetTextEntry(txtt,subtile)
    if subtile== nil then
        subtile =""
    end
    AddTextEntry('FMMC_MPM_NA', subtile)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", txtt, "", "", "", 100)
    while (UpdateOnscreenKeyboard() == 0) do
        SendNUIMessage({ ShowBlip = false})
        SendNUIMessage({ ShowColor = false})
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
		if tonumber(result) ~= nil then
			

				return tonumber(result)
		else
		    return result
		end
    end

end

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
