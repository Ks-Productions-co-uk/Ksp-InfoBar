local currentIndex = 1  -- Start with the first message

-- Function to calculate the width of the text
function getTextWidth(text, font, scale)
    BeginTextCommandWidth("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextFont(font)
    SetTextScale(scale, scale)
    return EndTextCommandGetWidth(true)
end

-- Function to display the text and its background with dynamic adjustment and fade effect
function showMessage(message)
    Citizen.CreateThread(function()
        local startTime = GetGameTimer()
        local endTime = startTime + message.duration
        local fadeDuration = 1000  -- Duration of the fade effect in milliseconds
        local textWidth = getTextWidth(message.text, message.font, message.textScale)  -- Now using config font and scale
        local rectWidth = textWidth + 0.02  -- Add a small margin for the background
        local rectHeight = 0.040
        local textY = 0.96  -- Text position slightly above the bottom of the screen
        local rectY = 0.975  -- Rectangle position at the bottom of the screen

        while (GetGameTimer() < endTime) do
            local currentTime = GetGameTimer()
            local alpha = 255

            if currentTime - startTime < fadeDuration then
                alpha = ((currentTime - startTime) / fadeDuration) * 255
            elseif currentTime > endTime - fadeDuration then
                alpha = ((endTime - currentTime) / fadeDuration) * 255
            end

            local textColor = {
                message.textColor[1],
                message.textColor[2],
                message.textColor[3],
                math.min(message.textColor[4], alpha)
            }
            local backgroundColor = {
                message.backgroundColor[1],
                message.backgroundColor[2],
                message.backgroundColor[3],
                math.min(message.backgroundColor[4], alpha)
            }

            DrawRect(0.6, rectY, rectWidth, rectHeight, backgroundColor[1], backgroundColor[2], backgroundColor[3], backgroundColor[4])
            SetTextFont(message.font)  -- Use font from config
            SetTextScale(message.textScale, message.textScale)
            SetTextColour(textColor[1], textColor[2], textColor[3], textColor[4])
            SetTextCentre(true)
            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(message.text)
            EndTextCommandDisplayText(0.6, textY)
            Citizen.Wait(0)
        end
    end)
end

-- Function to cycle messages based on Config, including pause
function cycleMessages()
    local message = Config.Messages[currentIndex]
    showMessage(message)
    currentIndex = (currentIndex % #Config.Messages) + 1  -- Loop back to the first message
    SetTimeout(message.duration + message.pause, cycleMessages)
end

-- Start the message cycle when the resource starts
Citizen.CreateThread(function()
    cycleMessages()
end)
