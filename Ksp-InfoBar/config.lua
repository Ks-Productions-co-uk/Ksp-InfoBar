Config = {}

Config.Messages = {
    { 
        text = "Welcome to Ksp Pve Freeroam!", -- Replace with your desired message.
        duration = 10000, -- Display message for 10 seconds.
        pause = 3000, -- Pause before displaying the next message.
        textColor = {160, 160, 160, 255}, -- 160 = Light Grey / 255 = Fully Opaque.
        backgroundColor = {0, 0, 0, 120}, -- Darker Grey / 90 = Semi-Transparent.
        font = 7, -- gtav-specific font ID. Change this to match your desired font.
        textScale = 0.50 -- Adjust the text scale size.
    },
    { 
        text = "Remember to respect other players.", 
        duration = 10000, 
        pause = 3000,
        textColor = {160, 160, 160, 255},
        backgroundColor = {0, 0, 0, 120},
        font = 7,
        textScale = 0.50
    },
    { 
        text = "Check out our Discord for news and updates.", 
        duration = 10000, 
        pause = 3000,
        textColor = {160, 160, 160, 255},
        backgroundColor = {0, 0, 0, 120},
        font = 7,
        textScale = 0.50
    },
    { 
        text = "Follow the Rules and be nice to others!.", 
        duration = 10000, 
        pause = 9000, -- Have the last notification pause for longer so the first "welcome to" message does not appear too often"
        textColor = {160, 160, 160, 255},
        backgroundColor = {0, 0, 0, 120},
        font = 7,
        textScale = 0.50
    }
}
