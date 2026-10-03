-- // Mahoraga V107 - Stable, Whitelisted & Smooth Hub //
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Whitelist Security Check (Strict: Ryon_230808)
if LocalPlayer.Name ~= "Ryon_230808" then
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    local blur = Instance.new("BlurEffect", game.Lighting)
    blur.Size = 24
    
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://9069151008" -- Siren sound ID
    sound.Volume = 5
    sound:Play()
    
    task.wait(2.5)
    LocalPlayer:Kick("Unauthorized User - Security Violation")
    return
end

print("Whitelist Verified: Ryon_230808. Initializing Mahoraga V107...")

-- Persistent Hub & 2D Wheel UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MahoragaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer.PlayerGui

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 220, 0, 260)
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(200, 150, 50)
MainFrame.Active = true
MainFrame.Draggable = true

-- Mahoraga Wheel Visual (2D Rotation)
local Wheel = Instance.new("ImageLabel", MainFrame)
Wheel.Size = UDim2.new(0, 100, 0, 100)
Wheel.Position = UDim2.new(0.5, -50, 0.1, 0)
Wheel.BackgroundTransparency = 1
Wheel.Image = "rbxassetid://6023426915" -- Placeholder Wheel Texture ID

-- Continuous 3-Second Healing System (40% Heal Logic)
task.spawn(function()
    while true do
        task.wait(3)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local hum = LocalPlayer.Character.Humanoid
            if hum.Health > 0 and hum.Health < hum.MaxHealth then
                local healAmount = hum.MaxHealth * 0.4
                hum.Health = math.clamp(hum.Health + healAmount, 0, hum.MaxHealth)
            end
        end
    end
end)

-- Rotation Adaptation Loop
task.spawn(function()
    local rot = 0
    while true do
        rot = (rot + 2) % 360
        Wheel.Rotation = rot
        task.wait(0.03)
    end
end)

print("Mahoraga V107 Hub Loaded Successfully!")
