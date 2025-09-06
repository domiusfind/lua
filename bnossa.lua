getgenv().Settings = {
    AutoHop = true,
    AutoStoreFruit = true,
    AutoTeam = true,
    Team = "Marines"
}

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

pcall(function()
    if isfile and readfile and pcall ~= nil then
        local ok, content = pcall(function() return readfile("NotSameServers.json") end)
        if ok and content then
            local decoded = nil
            pcall(function() decoded = HttpService:JSONDecode(content) end)
            if type(decoded) == "table" then
                AllIDs = decoded
            end
        end
    end
end)

if type(AllIDs) ~= "table" then
    AllIDs = {actualHour}
    pcall(function()
        if writefile then
            writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
        end
    end)
end

if getgenv().Settings.AutoTeam then
    local canChangeTeam = true
    local debounceTime = 1
    if canChangeTeam then
        canChangeTeam = false
        task.wait(debounceTime)
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", getgenv().Settings.Team)
        end)
        canChangeTeam = true
    end
    repeat task.wait() until player.Team and player.Team.Name == getgenv().Settings.Team
end

local function showDomiusGui(seconds)
    local playerGui = player:WaitForChild("PlayerGui")
    local existingGui = playerGui:FindFirstChild("DomiusFullscreen")
    if existingGui then existingGui:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DomiusFullscreen"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = playerGui

    local Background = Instance.new("Frame")
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Background.BackgroundTransparency = 0.65
    Background.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.Position = UDim2.new(0.5, 0, 0.4, 0)
    Title.Size = UDim2.new(0.8, 0, 0.1, 0)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBlack
    Title.Text = "Domius Find Fruit"
    Title.TextColor3 = Color3.fromRGB(200, 200, 255)
    Title.TextScaled = true
    Title.TextWrapped = true
    Title.Parent = Background

    local Subtitle = Instance.new("TextLabel")
    Subtitle.AnchorPoint = Vector2.new(0.5, 0.5)
    Subtitle.Position = UDim2.new(0.5, 0, 0.48, 0)
    Subtitle.Size = UDim2.new(0.8, 0, 0.06, 0)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Font = Enum.Font.GothamMedium
    Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Subtitle.TextScaled = true
    Subtitle.TextWrapped = true
    Subtitle.Parent = Background

    for i = seconds, 1, -1 do
        Subtitle.Text = "Hopping Server in " .. i .. "s..."
        task.wait(1)
    end
    ScreenGui:Destroy()
end

local function findFruit()
    local areas = {workspace, workspace:FindFirstChild("_WorldOrigin")}
    for _, area in ipairs(areas) do
        if area then
            for _, v in ipairs(area:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Handle") and string.find(v.Name, "Fruit") then
                    return v.Handle
                end
            end
        end
    end
    return nil
end

local function moveAroundFruit(fruitHandle, speed)
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp or not fruitHandle then return end

    local angle = 0
    local center = fruitHandle.Position
    speed = speed or 2

    local connection
    connection = RunService.Heartbeat:Connect(function(dt)
        if not hrp.Parent or not fruitHandle.Parent then
            connection:Disconnect()
            return
        end
        angle = angle + dt * speed
        hrp.CFrame = CFrame.new(center + Vector3.new(0, 1, 0), center)
    end)
end

local function tpToFruit()
    local fruitHandle = findFruit()
    if fruitHandle then
        moveAroundFruit(fruitHandle, 2)
        return true
    end
    return false
end

local function TPReturner()
    local teleportAttempted = false

    while true do
        local Site
        local success, result = pcall(function()
            if foundAnything == "" then
                return HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'
                ))
            else
                return HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything
                ))
            end
        end)

        if not success or not result then
            task.wait(2)
            continue
        end

        Site = result

        if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
            foundAnything = Site.nextPageCursor
        else
            foundAnything = ""
        end

        for _, v in pairs(Site.data) do
            if teleportAttempted then break end
            local Possible = true
            local ID = tostring(v.id)
            local num = 0

            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                            break
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            pcall(function()
                                if delfile then
                                    delfile("NotSameServers.json")
                                end
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end

                if Possible then
                    table.insert(AllIDs, ID)
                    pcall(function()
                        if writefile then
                            writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                        end
                        TeleportService:TeleportToPlaceInstance(PlaceID, ID, player)
                        teleportAttempted = true
                    end)
                    if teleportAttempted then
                        return
                    end
                    task.wait(4)
                end
            end
        end
        task.wait(2)
    end
end

task.spawn(function()
    while task.wait(2) do
        if not tpToFruit() and getgenv().Settings.AutoHop then
            showDomiusGui(5)
            TPReturner()
        end
    end
end)

if getgenv().Settings.AutoStoreFruit then
    task.spawn(function()
        local fruits = {
            {"Rocket Fruit", "Rocket-Rocket"},
            {"Spin Fruit", "Spin-Spin"},
            {"Blade Fruit", "Blade-Blade"},
            {"Spring Fruit", "Spring-Spring"},
            {"Bomb Fruit", "Bomb-Bomb"},
            {"Smoke Fruit", "Smoke-Smoke"},
            {"Spike Fruit", "Spike-Spike"},
            {"Flame Fruit", "Flame-Flame"},
            {"Falcon Fruit", "Falcon-Falcon"},
            {"Ice Fruit", "Ice-Ice"},
            {"Sand Fruit", "Sand-Sand"},
            {"Dark Fruit", "Dark-Dark"},
            {"Diamond Fruit", "Diamond-Diamond"},
            {"Light Fruit", "Light-Light"},
            {"Rubber Fruit", "Rubber-Rubber"},
            {"Barrier Fruit", "Barrier-Barrier"},
            {"Ghost Fruit", "Ghost-Ghost"},
            {"Magma Fruit", "Magma-Magma"},
            {"Quake Fruit", "Quake-Quake"},
            {"Buddha Fruit", "Buddha-Buddha"},
            {"Love Fruit", "Love-Love"},
            {"Spider Fruit", "Spider-Spider"},
            {"Sound Fruit", "Sound-Sound"},
            {"Phoenix Fruit", "Phoenix-Phoenix"},
            {"Portal Fruit", "Portal-Portal"},
            {"Rumble Fruit", "Rumble-Rumble"},
            {"Pain Fruit", "Pain-Pain"},
            {"Blizzard Fruit", "Blizzard-Blizzard"},
            {"Gravity Fruit", "Gravity-Gravity"},
            {"Mammoth Fruit", "Mammoth-Mammoth"},
            {"T-Rex Fruit", "T-Rex-T-Rex"},
            {"Dough Fruit", "Dough-Dough"},
            {"Shadow Fruit", "Shadow-Shadow"},
            {"Venom Fruit", "Venom-Venom"},
            {"Gas Fruit", "Gas-Gas"},
            {"Control Fruit", "Control-Control"},
            {"Spirit Fruit", "Spirit-Spirit"},
            {"Leopard Fruit", "Leopard-Leopard"},
            {"Yeti Fruit", "Yeti-Yeti"},
            {"Kitsune Fruit", "Kitsune-Kitsune"},
            {"Dragon Fruit", "Dragon-Dragon"}
        }
        while task.wait(0.5) do
            local character = player.Character
            local backpack = player:FindFirstChild("Backpack")
            if not character or not backpack then continue end
            for _, fruit in ipairs(fruits) do
                local fruitName, serverName = fruit[1], fruit[2]
                if character:FindFirstChild(fruitName) or backpack:FindFirstChild(fruitName) then
                    pcall(function()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", serverName, backpack:FindFirstChild(fruitName))
                    end)
                end
            end
        end
    end)
end
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalizationService = game:GetService("LocalizationService")

getgenv().LangConfig = {
    Default = "en",
    Languages = {
        ["pt"] = {
            Title = "Discord Oficial",
            DiscordMsg = "Discord.gg/Domius  •  Reporte Bugs",
            CopyBtn = "Copiar Discord",
            CopyNotif = "Invite do Discord copiado com sucesso.",
            Copied = "Copiado!"
        },
        ["vi"] = {
            Title = "Máy chủ Discord",
            DiscordMsg = "Discord.gg/Domius  •  Báo lỗi",
            CopyBtn = "Sao chép Discord",
            CopyNotif = "Liên kết Discord đã được sao chép.",
            Copied = "Đã sao chép!"
        },
        ["en"] = {
            Title = "Official Discord",
            DiscordMsg = "Discord.gg/Domius  •  Report Bugs",
            CopyBtn = "Copy Discord",
            CopyNotif = "Discord invite copied successfully.",
            Copied = " Copied!"
        }
    }
}

local locale = LocalizationService.RobloxLocaleId:sub(1,2)
local Lang = getgenv().LangConfig.Languages[locale] or getgenv().LangConfig.Languages[getgenv().LangConfig.Default]

local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DiscordCopyUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(0.5, -150, 0.8, -50)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = screenGui

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(120, 90, 255)
uiStroke.Thickness = 2
uiStroke.Parent = frame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 30)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = Lang.Title
title.TextColor3 = Color3.fromRGB(180, 150, 255)
title.TextScaled = true
title.Font = Enum.Font.FredokaOne
title.Parent = frame

local discordText = Instance.new("TextLabel")
discordText.Size = UDim2.new(1, -20, 0, 25)
discordText.Position = UDim2.new(0, 10, 0, 35)
discordText.BackgroundTransparency = 1
discordText.Text = Lang.DiscordMsg
discordText.TextColor3 = Color3.fromRGB(255, 255, 255)
discordText.TextScaled = true
discordText.Font = Enum.Font.GothamBold
discordText.Parent = frame

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 160, 0, 30)
copyButton.Position = UDim2.new(0.5, -80, 1, -40)
copyButton.BackgroundColor3 = Color3.fromRGB(120, 90, 255)
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Text = Lang.CopyBtn
copyButton.Font = Enum.Font.GothamBold
copyButton.TextScaled = true
copyButton.Parent = frame
Instance.new("UICorner", copyButton).CornerRadius = UDim.new(0, 8)

local buttonStroke = Instance.new("UIStroke")
buttonStroke.Color = Color3.fromRGB(180, 150, 255)
buttonStroke.Thickness = 1.5
buttonStroke.Parent = copyButton

copyButton.MouseEnter:Connect(function()
	copyButton.BackgroundColor3 = Color3.fromRGB(150, 120, 255)
end)

copyButton.MouseLeave:Connect(function()
	copyButton.BackgroundColor3 = Color3.fromRGB(120, 90, 255)
end)

copyButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("Discord.gg/Domius plz Report Bugs")
	elseif toclipboard then
		toclipboard("Discord.gg/Domius plz Report Bugs")
	end
	game.StarterGui:SetCore("SendNotification", {
		Title = Lang.Copied,
		Text = Lang.CopyNotif,
		Duration = 3
	})
end)

local dragging = false
local dragInput, dragStart, startPos

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

title.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

RunService.RenderStepped:Connect(function()
	if dragging and dragInput then
		local delta = dragInput.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.End then
		frame.Visible = true
	end
end)
