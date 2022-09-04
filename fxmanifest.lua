-- For support join my discord: https://discord.gg/zzUfkfRHzP
author "Breezy#0001 x Andyyy#7666"
description "A modern order system for FiveM by BreezyTheDev"
version "1.3"
fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts {
    "@ox_lib/init.lua",
    "config_shared.lua"
}
client_scripts {
    "source/client.lua"
}
server_scripts {
    "source/server.lua"
}

dependencies {
    "ox_lib",
    "ND_Core"
}