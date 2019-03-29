resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

name 'NativeUILua-Reloaded'
description 'NativeUILua-Reloaded is UI library for FiveM designed specifically for making interface based on GTA:Online style. (Base source: https://github.com/FrazzIe/NativeUILua ) | (Base NativeUI : https://github.com/Guad/NativeUI) '


client_scripts {
    "NativeUI-Reloaded/Wrapper/Utility.lua",

    "NativeUI-Reloaded/UIElements/UIVisual.lua",
    "NativeUI-Reloaded/UIElements/UIResRectangle.lua",
    "NativeUI-Reloaded/UIElements/UIResText.lua",
    "NativeUI-Reloaded/UIElements/Sprite.lua",
}

client_scripts {
    "NativeUI-Reloaded/UIMenu/elements/Badge.lua",
    "NativeUI-Reloaded/UIMenu/elements/Colours.lua",
    "NativeUI-Reloaded/UIMenu/elements/ColoursPanel.lua",
    "NativeUI-Reloaded/UIMenu/elements/StringMeasurer.lua",

    "NativeUI-Reloaded/UIMenu/items/UIMenuItem.lua",
    "NativeUI-Reloaded/UIMenu/items/UIMenuCheckboxItem.lua",
    "NativeUI-Reloaded/UIMenu/items/UIMenuListItem.lua",
    "NativeUI-Reloaded/UIMenu/items/UIMenuSliderItem.lua",
    "NativeUI-Reloaded/UIMenu/items/UIMenuSliderHeritageItem.lua",
    "NativeUI-Reloaded/UIMenu/items/UIMenuColouredItem.lua",

    "NativeUI-Reloaded/UIMenu/items/UIMenuProgressItem.lua",
    "NativeUI-Reloaded/UIMenu/items/UIMenuSliderProgressItem.lua",

    "NativeUI-Reloaded/UIMenu/windows/UIMenuHeritageWindow.lua",

    "NativeUI-Reloaded/UIMenu/panels/UIMenuGridPanel.lua",
    "NativeUI-Reloaded/UIMenu/panels/UIMenuHorizontalOneLineGridPanel.lua",
    "NativeUI-Reloaded/UIMenu/panels/UIMenuVerticalOneLineGridPanel.lua",
    "NativeUI-Reloaded/UIMenu/panels/UIMenuColourPanel.lua",
    "NativeUI-Reloaded/UIMenu/panels/UIMenuPercentagePanel.lua",
    "NativeUI-Reloaded/UIMenu/panels/UIMenuStatisticsPanel.lua",

    "NativeUI-Reloaded/UIMenu/UIMenu.lua",
    "NativeUI-Reloaded/UIMenu/MenuPool.lua",
}

client_scripts {
    'NativeUI-Reloaded/UITimerBar/UITimerBarPool.lua',

    'NativeUI-Reloaded/UITimerBar/items/UITimerBarItem.lua',
    'NativeUI-Reloaded/UITimerBar/items/UITimerBarProgressItem.lua',
    'NativeUI-Reloaded/UITimerBar/items/UITimerBarProgressWithIconItem.lua',

}

client_scripts {
    'NativeUI-Reloaded/UIProgressBar/UIProgressBarPool.lua',
    'NativeUI-Reloaded/UIProgressBar/items/UIProgressBarItem.lua',
}

client_scripts {
    "NativeUI-Reloaded/NativeUI.lua",
}



----- blip creator

client_scripts {
    'menu.lua',
    'cl_main.lua'
}

server_script 'sv_main.lua'