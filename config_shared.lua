--================================--
--      hp-orders 1.0            --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--

Config = {
    Notification = function(title, desc, icon, iconColor)

        lib.notify({
            title = title,
            description = desc,
            position = "bottom",
            style = {
                backgroundColor = "#141517",
                color = "#909296"
            },
            status = icon,
            iconColor = iconColor
            
        })
    end,

    Menus = {
        -- 24/7
        {
            text = "~b~Press ~w~[E] ~b~to open register",
            coords = vector3(1959.28, 3742.25, 32.75),
            job = "CIV",
            distance = 0.8
        },
        {
            text = "~b~Press ~w~[E] ~b~to open register",
            coords = vector3(1960.45, 3740.23, 32.73),
            job = "CIV",
            distance = 0.8
        },
        -- Burgershot
        {
            text = "~b~Press ~w~[E] ~b~to open register",
            coords = vector3(-1196.10, -891.37, 14.21),
            job = "CIV",
            distance = 0.8
        },
        {
            text = "~b~Press ~w~[E] ~b~to open register",
            coords = vector3(-1194.75, -893.37, 14.17),
            job = "CIV",
            distance = 0.8
        },
        {
            text = "~b~Press ~w~[E] ~b~to open register",
            coords = vector3(-1193.43, -895.22, 14.22), 
            job = "CIV",
            distance = 0.8
        },
        -- Section (Example)
        -- {
        --     text = "~b~Press ~w~[E] ~b~to open register",
        --     coords = vector3(XCoord, YCoord, ZCoord),
        --     job = "CIV",
        --     distance = 0.8
        -- }
    }

}