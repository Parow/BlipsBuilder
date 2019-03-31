---------------------------

-- made by parow with <3 --

---------------------------

_menuPool = NativeUI.CreatePool()
_menuPool:RefreshIndex()
mainBlipMenu = NativeUI.CreateMenu("BlipsBuilder", "Actions available", 5, 200,nil,nil,nil,180,0,0,180)
_menuPool:Add(mainBlipMenu)
local addBlipMenu = _menuPool:AddSubMenu(mainBlipMenu, "Add a blip","",true,true)
local editBlipMenu = _menuPool:AddSubMenu(mainBlipMenu, "Edit a blip","",true,true)
local deleteBlipMenu = _menuPool:AddSubMenu(mainBlipMenu, "Remove a blip","",true,true)
blipLabel = nil
blipId = 1
blipColor = 1
blipPosition = nil
blipPositionIn = ""
blipSize = 1.0
Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



function DrawBlipMenu()
    menu = mainBlipMenu



    ------ add blip part
    menu = addBlipMenu.SubMenu
    name = NativeUI.CreateItem("Label","")
    menu:AddItem(name)

    sizeList = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0}


    blipID = NativeUI.CreateListItem("Blip ID",bliptypeIndex,1,"Press enter to manually put a blip id")
    menu:AddItem(blipID)

    blipColors = NativeUI.CreateListItem("Blip color",BlipColorIndex,1,"Press enter to manually put a blip id")
    menu:AddItem(blipColors)

    blipPos = NativeUI.CreateListItem("Blip position",{"Current position","Custom position"},1,"")
    menu:AddItem(blipPos)
    _blipSize = NativeUI.CreateListItem("Blip size",sizeList,10,"")
    menu:AddItem(_blipSize)

    local Item = NativeUI.CreateColouredItem("Add the blip", Description, Colours.Green , Colours.GreenLight )
    menu:AddItem(Item)


    menu.OnItemSelect = function(_,item,index)
        if index == 1 then
            blipLabel = GetTextEntry()
            if tostring(blipLabel) ~= nil then
                item:RightLabel(blipLabel)
            end
        end
        if index == 6 then
            if blipPosition == nil then
                ShowNotification("No position set")
                return

            end
            if blipLabel == nil then
                ShowNotification("No label specified")
                return

            else
                if blipPositionIn == "current" then
                    blipPosition = {}
                    X,Y,Z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    blipPosition = {x=X,y=Y,z=Z}
                end
                BlipData = {}
                BlipData = {label=blipLabel,id=blipId,color=blipColor,pos=blipPosition,size=blipSize}
                TriggerServerEvent("bc:addBlip",BlipData)
                ShowNotification("Blip added")
            end
        end
    end
    menu.OnListChange = function(_,item,index)
        
        if item == blipID then
            blipId = bliptypeIndex[index]
            SendNUIMessage({ ShowBlip = true,index=bliptypeIndex[index] })
        end
        if item == blipColors then

            blipColor = BlipColorIndex[index]
            SendNUIMessage({ ShowColor = true,index=BlipColorIndex[index] })
        end
        if item == _blipSize then
            blipSize = sizeList[index]
          --  SendNUIMessage({ ShowColor = true,index=BlipColorIndex[index] })
        end
    end
    menu.OnIndexChange = function(_,index)
        if index == 2 then
            SendNUIMessage({ ShowBlip = true,index=blipId })
            SendNUIMessage({ showInfo = false})
        else
            SendNUIMessage({ ShowBlip = false})
            SendNUIMessage({ showInfo = false})
        end

        if index == 3 then
            SendNUIMessage({ ShowColor = true,index=blipColor})
            SendNUIMessage({ showInfo = false})
        else
            SendNUIMessage({ ShowColor = false})
            SendNUIMessage({ showInfo = false})
        end
    end
    menu.OnListSelect = function(_,item,index)
        
        if item == blipID then
            index = GetTextEntry()
            if tonumber(index) ~= nil then
                if index <= #bliptypeIndex then
                    for k,v in pairs(bliptypeIndex) do
                        if v == index then
                            blipID:Index(k)
                            break
                        end
                    end
                    blipId = index
                    SendNUIMessage({ ShowBlip = true,index=index})
                end
            end
        end
        if item == blipColors then
            index = GetTextEntry()
            if tonumber(index) ~= nil then
                if index <= #BlipColorIndex then
                    for k,v in pairs(BlipColorIndex) do
                        if v == index then
                            blipColors:Index(k)
                            break
                        end
                    end
                    blipColor = index
                    SendNUIMessage({ ShowColor = true,index=index})
                end
            end
        end
        if item == blipPos then
            if index == 1 then
                blipPositionIn = "current"
                blipPosition = {}
                X,Y,Z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                blipPosition = {x=X,y=Y,z=Z}
                ShowNotification("Successfully added this coords to the blip")
            else
                blipPositionIn = ""
                x= GetTextEntry(nil,"put X value")
                y =  GetTextEntry(nil,"put Y value")
                z =  GetTextEntry(nil,"put Z value")
                if tonumber(x) ~= nil and tonumber(y) ~= nil and tonumber(z) ~= nil then
                    blipPosition = {}
                    blipPosition = {x=tonumber(x),y=tonumber(y),z=tonumber(z)}
                    ShowNotification("Successfully added this coords to the blip")
                end
            end
        end
    end
    menu.OnMenuClosed = function()
        SendNUIMessage({ ShowBlip = false})
        SendNUIMessage({ ShowColor = false})
        _menuPool:RefreshIndex()
    end
    _menuPool:RefreshIndex()
end

function updateMenus()
    editBlipMenu.SubMenu:Clear()
    deleteBlipMenu.SubMenu:Clear()
    for i = 1, #blipsData,1 do
        t = blipsData[i].label
        local blipsedit = _menuPool:AddSubMenu(editBlipMenu.SubMenu, blipsData[i].label,"Blip ID : "..blipsData[i].id.."\nBlip Color : " .. blipsData[i].color.."\nBlip Size : "..blipsData[i].size,true,true)
        menu = blipsedit.SubMenu
        _name = NativeUI.CreateItem("Label","")
        _name:RightLabel(t)
        menu:AddItem(_name)
    
        sizeList = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0}

    
        _blipID = NativeUI.CreateListItem("Blip ID",bliptypeIndex,1,"Press enter to manually put a blip id")
        menu:AddItem(_blipID)
        for k,v in pairs(bliptypeIndex) do
            if v == blipsData[i].id then
                _blipID:Index(k)
                break
            end
        end
        _blipColors = NativeUI.CreateListItem("Blip color",BlipColorIndex,1,"Press enter to manually put a blip id")
        menu:AddItem(_blipColors)
        for k,v in pairs(BlipColorIndex) do
            if v == blipsData[i].color then
                _blipColors:Index(k)
                break
            end
        end
        _blipPos = NativeUI.CreateListItem("Blip position",{"Current position","Custom position"},1,"")
        menu:AddItem(_blipPos)
        __blipSize = NativeUI.CreateListItem("Blip size",sizeList,10,"")
        menu:AddItem(__blipSize)
    
        local _Item = NativeUI.CreateColouredItem("Edit the blip", Description, Colours.Green , Colours.GreenLight )
        menu:AddItem(_Item)


        menu.OnItemSelect = function(_,item,index)
            if index == 1 then

                blipsData[i].label =  GetTextEntry(blipsData[i].label)
                item:RightLabel(blipsData[i].label)
               
            end
            if index == 6 then
                
                    if blipPositionIn == "current" then
                        blipsData[i].pos = {}
                        X,Y,Z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        blipsData[i].pos = {x=X,y=Y,z=Z}
                    end
                    blipPositionIn = ""
                    TriggerServerEvent("bc:editBlip",i,blipsData[i])
                    _menuPool:CloseAllMenus()
                    ShowNotification("Blip edited")
            end
        end
        menu.OnListChange = function(_,item,index)

            if item.Base.Text:Text() == "Blip ID" then
                blipsData[i].id = bliptypeIndex[index]
                SendNUIMessage({ ShowBlip = true,index=blipsData[i].id })
            end
            if item == _blipColors then
                blipsData[i].color = BlipColorIndex[index]
                SendNUIMessage({ ShowColor = true,index=blipsData[i].color })
            end
            if item == __blipSize then
                blipsData[i].size = sizeList[index]
              
            end
        end
        menu.OnListSelect = function(_,item,index)
            if item == _blipID then
                index = GetTextEntry()
                if tonumber(index) ~= nil then
                    if index <= #bliptypeIndex then
                        for k,v in pairs(bliptypeIndex) do
                            if v == index then
                                _blipID:Index(k)
                                break
                            end
                        end
                        blipsData[i].id = index
                        SendNUIMessage({ ShowBlip = true,index=index})
                    end
                end
            end
            if item == _blipColors then
                index = GetTextEntry()
                if tonumber(index) ~= nil then
                    if index <= #BlipColorIndex then
                        for k,v in pairs(BlipColorIndex) do
                            if v == index then
                                _blipColors:Index(k)
                                break
                            end
                        end
                        blipColors:Index(index)
                        blipsData[i].color = index
                        SendNUIMessage({ ShowColor = true,index=index})
                    end
                end
            end
            if item == _blipPos then
                if index == 1 then
                    blipPositionIn = "current"
                    blipsData[i].pos = {}
                    X,Y,Z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    blipsData[i].pos = {x=X,y=Y,z=Z}
                    ShowNotification("Successfully added this coords to the blip")
                else
                    blipPositionIn = ""
                    X = GetTextEntry(blipsData[i].pos.x,"put X value")
                    Y =  GetTextEntry(blipsData[i].pos.y,"put Y value")
                    Z =  GetTextEntry(blipsData[i].pos.z,"put Z value")
                        blipsData[i].pos = {}
                        blipsData[i].pos = {x=X,y=Y,z=Z}
                        ShowNotification("Successfully added this coords to the blip")
                
                end
            end
        end
        menu.OnIndexChange = function(_,index)
            if index == 2 then

                SendNUIMessage({ ShowBlip = true,index=blipsData[i].id })
            else
                SendNUIMessage({ ShowBlip = false})
            end
    
            if index == 3 then
                SendNUIMessage({ ShowColor = true,index=blipsData[i].color})
            else
                SendNUIMessage({ ShowColor = false})
            end
        end
        menu.OnMenuClosed = function()
            SendNUIMessage({ ShowBlip = false})
            SendNUIMessage({ ShowColor = false})
            _menuPool:RefreshIndex()
        end





        local blipsdelete = _menuPool:AddSubMenu(deleteBlipMenu.SubMenu, blipsData[i].label,"Blip ID : "..blipsData[i].id.."\nBlip Color : " .. blipsData[i].color.."\nBlip Size : "..blipsData[i].size,true,true)
        menu = blipsdelete.SubMenu
        delete = NativeUI.CreateItem("Delete","")
        menu:AddItem(delete)

        menu.OnItemSelect = function()
            TriggerServerEvent("bc:deleteBlip",i)
            _menuPool:CloseAllMenus()
            ShowNotification("Blip deleted")
        end
    end
    editBlipMenu.SubMenu.OnItemSelect = function()
        SendNUIMessage({ showInfo = false})
        _menuPool:RefreshIndex()
    end
    deleteBlipMenu.SubMenu.OnItemSelect = function()
        SendNUIMessage({ showInfo = false})
        _menuPool:RefreshIndex()
    end
    _menuPool:RefreshIndex()
end


Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        _menuPool:ProcessMenus()
        _menuPool:MouseControlsEnabled(false)
        _menuPool:MouseEdgeEnabled(false)
        _menuPool:ControlDisablingEnabled(false)
    end
end)
DrawBlipMenu()

RegisterNetEvent('bc:OpenMenu')
AddEventHandler('bc:OpenMenu',function()

    mainBlipMenu:Visible(true)
end)

