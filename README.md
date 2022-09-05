![image](https://user-images.githubusercontent.com/63890993/188291337-55188521-e26b-4eb8-96e0-14c8809c6c23.png)

## What is it?

This resource allows the cashier to access the register and send the targeted player an invoice for the set price. This makes business's much more immersive and allows you to RP stuff in a whole new way.

It is easily configurable with a very simplistic config file.

This resource was created using the ND_Framework. If you'd like to convert this resource to your framework then be my guest.

## Configuration

The following can be found in the ``config_shared.lua`` file.
```
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
```

## Preview
[Youtube](https://youtu.be/Cp_kOtKJOjc)

## Download
https://github.com/HappyPunch/hp-orders

## Developers

[BreezyTheDev](https://github.com/BreezyTheDev)

[Andyyy7666](https://github.com/Andyyy7666)

## Dependencies

[Ox_Library](https://forum.cfx.re/t/free-ox-library-ui-and-lua-modules/4853434)

[ND_Framework](https://github.com/Andyyy7666/ND_Framework)

## Errors or Suggestions?
Please message me on discord if you come across any errors when using this resource or if you would like to make a suggestion.
Discord: `Breezy#0001`
