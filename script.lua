-- ==========================================================
-- ⚙️ ADAPTASI MAHORAGA (BY RYON) - V163 (CLASSIC GUI & IMMUNE) ⚙️
-- ==========================================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    Players.PlayerAdded:Wait()
    LocalPlayer = Players.LocalPlayer
    task.wait(0.1)
end

local Success, TargetParent = pcall(function()
    return (syn and syn.protect_gui and CoreGui) or LocalPlayer:FindFirstChildOfClass("PlayerGui") or CoreGui
end)

if not Success or not TargetParent then
    TargetParent = CoreGui
end

-- Bersihkan UI lama
pcall(function()
    if TargetParent:FindFirstChild("MahoragaHubV163") then TargetParent.MahoragaHubV163:Destroy() end
    if TargetParent:FindFirstChild("MahoragaKeyV163") then TargetParent.MahoragaKeyV163:Destroy() end
end)

-- ================= 1. KEY SYSTEM =================
local CORRECT_KEY = "Ryon_Exploits"

local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 22
BlurEffect.Parent = Lighting

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "MahoragaKeyV163"
KeyGui.ResetOnSpawn = false
KeyGui.Parent = TargetParent

local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = KeyGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
KeyFrame.BorderColor3 = Color3.fromRGB(218, 165, 32)
KeyFrame.BorderSizePixel = 2
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyFrame.Size = UDim2.new(0, 260, 0, 170)
KeyFrame.Active = true
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 8)

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundColor3 = Color3.fromRGB(22, 18, 5)
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.Font = Enum.Font.GothamBlack
KeyTitle.Text = "🔐 MAHORAGA: ENTER YOUR CODE"
KeyTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
KeyTitle.TextSize = 10
Instance.new("UICorner", KeyTitle).CornerRadius = UDim.new(0, 8)

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = KeyFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyBox.BorderColor3 = Color3.fromRGB(218, 165, 32)
KeyBox.Position = UDim2.new(0.1, 0, 0.32, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 32)
KeyBox.Font = Enum.Font.GothamBold
KeyBox.PlaceholderText = "Masukkan Kode Ryon..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 11
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 6)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = KeyFrame
SubmitBtn.BackgroundColor3 = Color3.fromRGB(184, 134, 11)
SubmitBtn.Position = UDim2.new(0.1, 0, 0.60, 0)
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 32)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "VERIFIKASI KODE"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 11
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 6)

local StatusKeyLabel = Instance.new("TextLabel")
StatusKeyLabel.Parent = KeyFrame
StatusKeyLabel.BackgroundTransparency = 1
StatusKeyLabel.Position = UDim2.new(0.1, 0, 0.82, 0)
StatusKeyLabel.Size = UDim2.new(0.8, 0, 0, 20)
StatusKeyLabel.Font = Enum.Font.GothamBold
StatusKeyLabel.Text = "Khusus Akses: Ryon"
StatusKeyLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusKeyLabel.TextSize = 9

local verified = false
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == CORRECT_KEY then
        verified = true
        pcall(function() BlurEffect:Destroy() end)
        pcall(function() KeyGui:Destroy() end)
    else
        StatusKeyLabel.Text = "KODE SALAH! COBA LAGI"
        StatusKeyLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

repeat task.wait(0.1) until verified

-- ================= 2. UI UTAMA (MAHORAGA HUB) =================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MahoragaHubV163"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = TargetParent

local BlackFlash = Instance.new("Frame")
BlackFlash.Size = UDim2.new(1, 0, 1, 0)
BlackFlash.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlackFlash.BackgroundTransparency = 1
BlackFlash.ZIndex = 99
BlackFlash.Parent = ScreenGui

local RingBgImage = Instance.new("ImageLabel")
RingBgImage.Size = UDim2.new(0, 250, 0, 250)
RingBgImage.AnchorPoint = Vector2.new(0.5, 0.5)
RingBgImage.Position = UDim2.new(0.5, 0, 0.5, 0)
RingBgImage.BackgroundTransparency = 1
RingBgImage.ImageTransparency = 1
RingBgImage.Rotation = 0
RingBgImage.Image = "rbxthumb://type=Asset&id=18312778901&w=420&h=420"
RingBgImage.ScaleType = Enum.ScaleType.Fit
RingBgImage.ZIndex = 101
RingBgImage.Parent = ScreenGui

local AdaptSound = Instance.new("Sound")
AdaptSound.SoundId = "rbxassetid://17813738072"
AdaptSound.Volume = 3
AdaptSound.Parent = SoundService

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.BorderColor3 = Color3.fromRGB(218, 165, 32)
MainFrame.BorderSizePixel = 2 
MainFrame.Position = UDim2.new(-0.3, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 205, 0, 175) -- Bentuk dan ukuran persis seperti gambar yang kamu suka
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.05, 0, 0.15, 0)}):Play()

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(22, 18, 5)
Title.Size = UDim2.new(1, 0, 0, 26)
Title.Font = Enum.Font.GothamBlack
Title.Text = "🔥 Roda Mahoraga - Ryon"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 10
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

local MinBtn = Instance.new("TextButton")
MinBtn.Parent = Title
MinBtn.BackgroundColor3 = Color3.fromRGB(40, 32, 10)
MinBtn.Position = UDim2.new(0.83, 0, 0.12, 0)
MinBtn.Size = UDim2.new(0, 22, 0, 20)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
MinBtn.TextSize = 11
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 5)

local OpenBtn = Instance.new("ImageButton")
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
OpenBtn.BorderColor3 = Color3.fromRGB(218, 165, 32)
OpenBtn.BorderSizePixel = 2
OpenBtn.Position = UDim2.new(0.02, 0, 0.4, 0)
OpenBtn.Size = UDim2.new(0, 42, 0, 42)
OpenBtn.Image = "rbxthumb://type=Asset&id=18312778901&w=420&h=420"
OpenBtn.ScaleType = Enum.ScaleType.Fit
OpenBtn.Visible = false
OpenBtn.Active = true
OpenBtn.Draggable = true
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 10)

MinBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false OpenBtn.Visible = true end)
OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = true OpenBtn.Visible = false end)

-- Tombol Atas: Putar Roda Adaptasi
local ToggleFlashbackBtn = Instance.new("TextButton")
ToggleFlashbackBtn.Parent = MainFrame
ToggleFlashbackBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
ToggleFlashbackBtn.Position = UDim2.new(0.06, 0, 0.20, 0)
ToggleFlashbackBtn.Size = UDim2.new(0, 178, 0, 32)
ToggleFlashbackBtn.Font = Enum.Font.GothamBold
ToggleFlashbackBtn.Text = "⚙️ Putar Roda Adaptasi ⚙️"
ToggleFlashbackBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
ToggleFlashbackBtn.TextSize = 9
Instance.new("UICorner", ToggleFlashbackBtn).CornerRadius = UDim.new(0, 6)

-- Teks Status di Tengah (Persis di tengah kotak dengan posisi rapi)
local StatusMiddleLabel = Instance.new("TextLabel")
StatusMiddleLabel.Parent = MainFrame
StatusMiddleLabel.BackgroundTransparency = 1
StatusMiddleLabel.Position = UDim2.new(0.06, 0, 0.43, 0)
StatusMiddleLabel.Size = UDim2.new(0, 178, 0, 20)
StatusMiddleLabel.Font = Enum.Font.GothamBold
StatusMiddleLabel.Text = "Status: Siap Beradaptasi"
StatusMiddleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusMiddleLabel.TextSize = 8
StatusMiddleLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Tombol Bawah: Pengulangan Adaptasi
local ResetHistoryBtn = Instance.new("TextButton")
ResetHistoryBtn.Parent = MainFrame
ResetHistoryBtn.BackgroundColor3 = Color3.fromRGB(40, 25, 60)
ResetHistoryBtn.Position = UDim2.new(0.06, 0, 0.58, 0)
ResetHistoryBtn.Size = UDim2.new(0, 178, 0, 32)
ResetHistoryBtn.Font = Enum.Font.GothamBold
ResetHistoryBtn.Text = "Pengulangan Adaptasi ⚙️"
ResetHistoryBtn.TextColor3 = Color3.fromRGB(220, 150, 255)
ResetHistoryBtn.TextSize = 10
Instance.new("UICorner", ResetHistoryBtn).CornerRadius = UDim.new(0, 6)

-- ================= 3. VARIABEL & LOGIKA UTAMA =================
local currentAngle = 0
local pathHistory = {}
local isFlashbackActive = false
local isRecordingActive = true

local function playNormalWheelFX()
    currentAngle = currentAngle + 90
    TweenService:Create(RingBgImage, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = currentAngle}):Play()
    pcall(function() AdaptSound:Play() end)
    
    task.spawn(function()
        BlackFlash.BackgroundTransparency = 0.4
        RingBgImage.ImageTransparency = 0
        task.wait(0.2)
        TweenService:Create(BlackFlash, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
        TweenService:Create(RingBgImage, TweenInfo.new(0.25), {ImageTransparency = 1}):Play()
    end)
end

-- ================= 4. SISTEM KEBAL TOTAL (TANPA ADAPTASI NYICIL) =================
local function setupCharacter(char)
    local humanoid = char:WaitForChild("Humanoid", 5)
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not humanoid or not hrp then return end
    
    local lastHealth = humanoid.Health
    
    humanoid.HealthChanged:Connect(function(newHealth)
        -- Jika HP berkurang (terkena damage nyicil/kecil maupun besar), langsung dipulihkan penuh tanpa mengubah teks status (kebal murni)
        if newHealth < lastHealth then
            humanoid.Health = humanoid.MaxHealth
        end
        lastHealth = humanoid.Health
    end)
end

if LocalPlayer.Character then
    setupCharacter(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(setupCharacter)

-- ================= 5. PEREKAMAN JEJAK & ANTI VOID =================
RunService.Heartbeat:Connect(function()
    if not isRecordingActive or isFlashbackActive then return end
    
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        
        table.insert(pathHistory, hrp.CFrame)
        if #pathHistory > 30000 then
            table.remove(pathHistory, 1)
        end
        
        if hrp.Position.Y < -50 then
            if #pathHistory > 10 then
                local safePos = pathHistory[#pathHistory - 10]
                if safePos then
                    hrp.CFrame = safePos + Vector3.new(0, 5, 0)
                    hrp.AssemblyLinearVelocity = Vector3.zero
                end
            else
                hrp.CFrame = CFrame.new(0, 50, 0)
                hrp.AssemblyLinearVelocity = Vector3.zero
            end
        end
    end
end)

-- ================= 6. TOMBOL ATAS & BAWAH =================
ToggleFlashbackBtn.MouseButton1Click:Connect(function()
    isFlashbackActive = not isFlashbackActive
    
    if isFlashbackActive then
        ToggleFlashbackBtn.BackgroundColor3 = Color3.fromRGB(20, 50, 20)
        ToggleFlashbackBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
        
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            if #pathHistory >= 10 then
                local hrp = char.HumanoidRootPart
                playNormalWheelFX()
                
                task.spawn(function()
                    local totalPoints = #pathHistory
                    for i = totalPoints, 1, -1 do
                        if not isFlashbackActive or not char or not char:FindFirstChild("HumanoidRootPart") then break end
                        hrp.CFrame = pathHistory[i]
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        RunService.Heartbeat:Wait()
                    end
                    isFlashbackActive = false
                    ToggleFlashbackBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
                    ToggleFlashbackBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
                end)
            else
                StatusMiddleLabel.Text = "Jejak Belum Cukup!"
                StatusMiddleLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
                task.wait(1.2)
                isFlashbackActive = false
                ToggleFlashbackBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
                ToggleFlashbackBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
                StatusMiddleLabel.Text = "Status: Siap Beradaptasi"
                StatusMiddleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    else
        ToggleFlashbackBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
        ToggleFlashbackBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

ResetHistoryBtn.MouseButton1Click:Connect(function()
    table.clear(pathHistory)
    isFlashbackActive = false
    
    ResetHistoryBtn.BackgroundColor3 = Color3.fromRGB(20, 50, 20)
    ResetHistoryBtn.Text = "✅ Diulang & Direset!"
    ResetHistoryBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
    
    task.wait(1.2)
    ResetHistoryBtn.BackgroundColor3 = Color3.fromRGB(40, 25, 60)
    ResetHistoryBtn.Text = "Pengulangan Adaptasi ⚙️"
    ResetHistoryBtn.TextColor3 = Color3.fromRGB(220, 150, 255)
end)

print("⚙️️ Mahoraga V163 Loaded Successfully!")
