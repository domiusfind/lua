shared.LoaderTitle = "Discord.gg/Applehub";
shared.LoaderKeyFrames = {
    [1] = {
        1,
        10
    },
    [2] = {
        2,
        30
    },
    [3] = {
        3,
        60
    },
    [4] = {
        2,
        100
    }
};
local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(255, 0, 0),
            Topic = Color3.fromRGB(255, 0, 0),
            Title = Color3.fromRGB(255, 255, 255),
            LoaderBackground = Color3.fromRGB(40, 40, 40),
            LoaderSplash = Color3.fromRGB(255, 0, 0)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = {
            1,
            10
        },
        [2] = {
            2,
            30
        },
        [3] = {
            3,
            60
        },
        [4] = {
            2,
            100
        }
    }
};
local v3 = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = ""
};
function TweenObject(v178, v179, v180)
    game.TweenService:Create(v178, TweenInfo.new(v179, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v180):Play();
end
function CreateObject(v181, v182)
    local v183 = Instance.new(v181);
    local v184;
    for v416, v417 in pairs(v182) do
        if (v416 ~= "Parent") then
            v183[v416] = v417;
        else
            v184 = v417;
        end
    end
    v183.Parent = v184;
    return v183;
end
local function v4(v186, v187)
    local v188 = Instance.new("UICorner");
    v188.CornerRadius = UDim.new(0, v186);
    v188.Parent = v187;
end
local v5 = CreateObject("ScreenGui", {
    Name = "Core",
    Parent = game.CoreGui
});
local v6 = CreateObject("Frame", {
    Name = "Main",
    Parent = v5,
    BackgroundColor3 = v2.LoaderData.Colors.Main,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0)
});
v4(12, v6);
local v7 = CreateObject("ImageLabel", {
    Name = "UserImage",
    Parent = v6,
    BackgroundTransparency = 1,
    Image = "rbxassetid://111159100408946", --- roblox imagem aqui
    Position = UDim2.new(0, 15, 0, 10),
    Size = UDim2.new(0, 50, 0, 50)
});
v4(25, v7);
local v8 = CreateObject("TextLabel", {
    Name = "UserName",
    Parent = v6,
    BackgroundTransparency = 1,
    Text = "Apple hub carregando...",
    Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50),
    Font = Enum.Font.GothamBold,
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v9 = CreateObject("TextLabel", {
    Name = "Top",
    TextTransparency = 1,
    Parent = v6,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 70),
    Size = UDim2.new(0, 301, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "Loader",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v10 = CreateObject("TextLabel", {
    Name = "Title",
    Parent = v6,
    TextTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90),
    Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham,
    RichText = true,
    Text = "<b>" .. v2.LoaderData.Name .. "</b>",
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v11 = CreateObject("Frame", {
    Name = "BG",
    Parent = v6,
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0,
    Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24)
});
v4(8, v11);
local v12 = CreateObject("Frame", {
    Name = "Progress",
    Parent = v11,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Size = UDim2.new(0, 0, 0, 24)
});
v4(8, v12);
local v13 = CreateObject("TextLabel", {
    Name = "StepLabel",
    Parent = v6,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, - 25),
    Size = UDim2.new(1, - 20, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5)
});
function UpdateStepText(v191)
    v13.Text = v3[v191] or "" ;
end
function UpdatePercentage(v193, v194)
    TweenObject(v12, 0.5, {
        Size = UDim2.new(v193 / 100, 0, 0, 24)
    });
    UpdateStepText(v194);
end
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 346, 0, 121)
});
wait();
TweenObject(v9, 0.5, {
    TextTransparency = 0
});
TweenObject(v10, 0.5, {
    TextTransparency = 0
});
TweenObject(v11, 0.5, {
    BackgroundTransparency = 0
});
TweenObject(v12, 0.5, {
    BackgroundTransparency = 0
});
for v195, v196 in pairs(v2.Keyframes) do
    wait(v196[1]);
    UpdatePercentage(v196[2], v195);
end
UpdatePercentage(100, 4);
TweenObject(v9, 0.5, {
    TextTransparency = 1
});
TweenObject(v10, 0.5, {
    TextTransparency = 1
});
TweenObject(v11, 0.5, {
    BackgroundTransparency = 1
});
TweenObject(v12, 0.5, {
    BackgroundTransparency = 1
});
wait(0.5);
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 0, 0, 0)
});
wait(0.25);
v5:Destroy();
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "apple Hub",
        Text = "executed successfully!",
        Duration = 5
    })
end)
-- spawn(function()
--     while wait() do
--         function print()
--         end
--         function warn()
--         end
--         function error()
--         end
--         debug.traceback = function()
--             return "Traceback blocked";
--         end;
--         debug.info = function()
--             return "Info blocked";
--         end;
--         local v420 = getrawmetatable(game);
--         if (v420 and not v420.__metatable) then
--             setreadonly(v420, false);
--             local v658 = v420.__index;
--             local v659 = v420.__newindex;
--             v420.__index = function(v759, v760)
--                 if ((v760 == "debug") or (v760 == "getrawmetatable")) then
--                     error("Anti Skid: Tampering detected!");
--                 end
--                 return v658(v759, v760);
--             end;
--             v420.__newindex = function(v761, v762, v763)
--                 if ((v762 == "debug") or (v762 == "getrawmetatable")) then
--                     error("Anti Skid: Tampering detected!");
--                 end
--                 return v659(v761, v762, v763);
--             end;
--             setreadonly(v420, true);
--         end
--         local function v421()
--             local v568 = {
--                 "_G",
--                 "debug",
--                 "getgenv",
--                 "getrawmetatable",
--                 "setfenv",
--                 "loadstring",
--                 "hookfunction"
--             };
--             for v662, v663 in ipairs(v568) do
--                 local v664, v665 = pcall(function()
--                     return _G[v663];
--                 end);
--                 if (v664 and v665) then
--                     error("Anti Skid: Environment tampering detected!");
--                 end
--             end
--         end
--         local function v422()
--             local v569 = {
--                 getrawmetatable,
--                 setreadonly,
--                 getgenv,
--                 debug.getinfo,
--                 debug.getregistry
--             };
--             for v666, v667 in ipairs(v569) do
--                 if v667 then
--                     error("Anti Skid: Hook tampering detected!");
--                 end
--             end
--         end
--         local v423 = game:FindService("HttpService");
--         if v423 then
--             v423.RequestAsync = function()
--                 error("HTTP Requests Blocked");
--             end;
--             v423.GetAsync = function()
--                 error("HTTP Get Blocked");
--             end;
--             v423.PostAsync = function()
--                 error("HTTP Post Blocked");
--             end;
--         end
--         function collectgarbage()
--             error("GC Blocked");
--         end
--         os.time = function()
--             error("OS Time Blocked");
--         end;
--         pcall(v421);
--         pcall(v422);
--     end
-- end);
local v14 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))();
local v15 = v14:CreateWindow({
    Title = "Apple hub - Summer (🏖️☀️)",
    SubTitle = "",
    TabWidth = 160,
    Theme = "Dark",
    Acrylic = false,
    Size = UDim2.fromOffset(500, 320),
    MinimizeKey = Enum.KeyCode.End
});
local v16 = {
    Home = v15:AddTab({
        Title = "Home"
    }),
    Main = v15:AddTab({
        Title = "Farming"
    }),
    Shop = v15:AddTab({
        Title = "Shop"
    }),
        Misc = v15:AddTab({
        Title = "Misc"
    })
}
local v51 = v16.Main:AddSection("[ Farming ]"); -- sessão 2 shop
-- DROPDOWN SELECIONAR SEMENTES 
local selectedSeed = "Carrot"
local autoBuy = false


local v48 = v16.Main:AddDropdown("DropdownSelectSeed", {
    Title = "Select Seed",
    Description = "",
    Values = {
        "Carrot",
        "Tomato",
        "Poatato",
        "Strawberry",
        "Blueberry",
        "Cauliflower",
        "Watermelon",
        "Green Apple",
        "Avocado",
        "Banana",
        "Pineapple",
        "Kiwi",
        "Beli Pepper",
        "Prickly Pear",
        "Loquato",
        "Feijoa",
        "Sugar Apple"
    },
    Multi = true,
    Default = {},
    Callback = function(value)
        selectedSeed = value
    end
})


local v51 = v16.Main:AddToggle("ToggleAutoBuySeed", {
    Title = "Auto Buy Seed",
    Description = "",
    Default = false,
    Callback = function(state)
        autoBuy = state
        task.spawn(function()
            while autoBuy do
                if selectedSeed and selectedSeed ~= "" then
                    local args = { [1] = selectedSeed }
                    game:GetService("ReplicatedStorage").GameEvents.BuySeedStock:FireServer(unpack(args))
                end
                task.wait(0)
            end
        end)
    end
})
local autoCollectOptimized = false
local collectMode = "Suavemente"

local runningCollectTask = nil

-- Dropdown
v16.Main:AddDropdown("CollectModeDropdown", {
	Title = "Collection mode ",
	Description = "Choose between speed or smoothness",
	Values = { "With lock", "gently" },
	Default = "Suavemente",
	Callback = function(mode)
		collectMode = mode
	end
})

-- Toggle
v16.Main:AddToggle("ToggleFastAutoCollect", {
	Title = "Auto Collect",
	Default = false,
	Callback = function(state)
		autoCollectOptimized = state

		if state and not runningCollectTask then
			runningCollectTask = task.spawn(function()
				local Players = game:GetService("Players")
				local CollectionService = game:GetService("CollectionService")
				local ReplicatedStorage = game:GetService("ReplicatedStorage")

				local player = Players.LocalPlayer
				local Remotes = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Remotes"))
				local collectRemote = Remotes.Crops.Collect

				while autoCollectOptimized do
					local collected = 0
					local tagged = CollectionService:GetTagged("CollectPrompt")

					for _, prompt in ipairs(tagged) do
						local farm = prompt:FindFirstAncestor("Important")
						if not farm then continue end

						local owner = farm:FindFirstChild("Data") and farm.Data:FindFirstChild("Owner")
						if not owner then continue end

						if owner.Value == player or owner.Value == player.Name or owner.Value.Name == player.Name then
							local fruitModel = prompt.Parent and prompt.Parent.Parent
							if fruitModel then
								collectRemote.send({fruitModel})
								collected += 1

								if collectMode == "Suavemente" then
									task.wait(0.05)
								else
									task.wait()
								end
							end
						end
					end

					if collected == 0 then
						task.wait(1)
					end
				end

				-- Finaliza a task
				runningCollectTask = nil
			end)
		end
	end
})
local autoSell = false
local autoSellThread = nil

-- CFrame do Steven
local stevenCFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)

v16.Main:AddToggle("ToggleAutoSell", {
    Title = "Auto Sell [Max backpack]",
    Description = "Only sell if you have the backpeck at max",
    Default = false,
    Callback = function(state)
        autoSell = state

        if autoSell and not autoSellThread then
            autoSellThread = task.spawn(function()
                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local player = Players.LocalPlayer
                local backpack = player:WaitForChild("Backpack")
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")

                while autoSell do
                    local fruitCount = 0

                    for _, item in pairs(backpack:GetChildren()) do
                        if item:IsA("Tool") and item.Name:match("%[.-kg%]") then
                            fruitCount += 1
                        end
                    end

                    if fruitCount >= 200 then
                        hrp.CFrame = stevenCFrame
                        task.wait(0.5)

                        -- Envia o evento diretamente
                        ReplicatedStorage.GameEvents.Sell_Inventory:FireServer()
                    end

                    task.wait(1)
                end
            end)
        elseif not autoSell and autoSellThread then
            task.cancel(autoSellThread)
            autoSellThread = nil
        end
    end
})
local autoSell = false
local autoSellThread = nil

local v52 = v16.Main:AddToggle("ToggleAutoSell", {
    Title = "Auto Sell",
    Description = "",
    Default = false,
    Callback = function(state)
        autoSell = state

        if autoSell then
            autoSellThread = task.spawn(function()
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")

                while autoSell do
                    local npc = workspace.NPCS:FindFirstChild("Steven")
                    if npc and npc:FindFirstChild("HumanoidRootPart") then
                        -- Teleporta para o NPC
                        hrp.CFrame = npc.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                        task.wait(0.0)

                        -- Envia o evento de venda
                        game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
                    end

                    task.wait(0)
                end
            end)
        else
            autoSell = false -- garante que o loop pare
        end
    end
})
local autoPlanting = false
local selectedSeed = nil

-- 🔽 Dropdown com as sementes
v16.Main:AddDropdown("SeedSelector", {
	Title = "Select the seed to plant",
	Description = "",
	Values = {
		"Carrot", "Strawberry", "Blueberry", "Tomato",
		"Cauliflower", "Watermelon", "Green Apple", "Avocado",
		"Banana", "Pineapple", "Kiwi", "Beli Pepper",
		"Prickly Pear", "Loquato", "Feijoa", "Suga Apple"
	},
	Default = "Feijoa",
	Callback = function(value)
		selectedSeed = value
	end
})

-- 🔘 Toggle de ativação
v16.Main:AddToggle("ToggleAutoPlant", {
	Title = "Auto Plant",
	Description = "",
	Default = false,
	Callback = function(state)
		autoPlanting = state
	end
})

-- 🔍 Detectar a fazenda do jogador
local MyFarm
for _, farm in pairs(workspace.Farm:GetChildren()) do
	if farm.Name == "Farm" and farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data") then
		local owner = farm.Important.Data:FindFirstChild("Owner")
		if owner and (owner.Value == game.Players.LocalPlayer or owner.Value == game.Players.LocalPlayer.Name or owner.Value.Name == game.Players.LocalPlayer.Name) then
			MyFarm = farm
			break
		end
	end
end

-- 📍 Gera ponto aleatório para plantar
local function randompt(part)
	local size = part.Size
	local offset = Vector3.new(
		(math.random() - 0.5) * size.X,
		(math.random() - 0.5) * size.Y,
		(math.random() - 0.5) * size.Z
	)
	local worldPos = part.CFrame:PointToWorldSpace(offset)
	local rotation = CFrame.Angles(
		math.rad(math.random(0, 360)),
		math.rad(math.random(0, 360)),
		math.rad(math.random(0, 360))
	)
	return CFrame.new(worldPos) * rotation
end

-- 🔧 Converte "Banana Seed [X5]" → "Banana"
local function cleanSeedName(name)
	local clean = name:gsub("%[.-%]", "") -- remove [X5]
	clean = clean:gsub("Seed", "")       -- remove "Seed"
	clean = clean:gsub("^%s+", "")       -- espaços no início
	clean = clean:gsub("%s+$", "")       -- espaços no fim
	return clean
end

-- 🔎 Encontra a ferramenta da seed selecionada
local function getMatchingSeed()
	local backpack = game.Players.LocalPlayer.Backpack
	local char = game.Players.LocalPlayer.Character

	for _, item in pairs(char:GetChildren()) do
		if item:IsA("Tool") and cleanSeedName(item.Name):lower() == selectedSeed:lower() then
			return item
		end
	end

	for _, item in pairs(backpack:GetChildren()) do
		if item:IsA("Tool") and cleanSeedName(item.Name):lower() == selectedSeed:lower() then
			return item
		end
	end

	return nil
end

-- 🌱 Plantar a seed no ponto aleatório
local function plant(seedTool)
	if not seedTool or not MyFarm then return end

	local plantLocations = MyFarm.Important:FindFirstChild("Plant_Locations")
	if not plantLocations then return end

	local parts = plantLocations:GetChildren()
	if #parts == 0 then return end

	local targetPart = parts[math.random(1, #parts)]
	local cf = randompt(targetPart)
	local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	-- Move o personagem
	hrp.CFrame = cf * CFrame.new(0, 10, 0)

	-- 💡 Nome limpo para o evento
	local fruitName = cleanSeedName(seedTool.Name)

	game:GetService("ReplicatedStorage").GameEvents.Plant_RE:FireServer(
		Vector3.new(cf.X, cf.Y, cf.Z),
		fruitName
	)
end

-- ♻️ Loop contínuo de auto plant
task.spawn(function()
	while true do
		if autoPlanting and selectedSeed and MyFarm then
			local seedTool = getMatchingSeed()

			if seedTool then
				-- Equipa se estiver no backpack
				if game.Players.LocalPlayer.Backpack:FindFirstChild(seedTool.Name) then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(seedTool)
					task.wait(0.1)
				end

				-- Planta se estiver equipado
				local equipped = game.Players.LocalPlayer.Character:FindFirstChild(seedTool.Name)
				if equipped then
					plant(equipped)
				end
			end
		end
		task.wait(0.3)
	end
end)
local v51 = v16.Main:AddSection("[ SUMMER EVENT 🏖️ ]"); -- sessão 2 shop
local autoCollectOptimized = false
local collectThread = nil

local fruitsToCollect = {
	["Strawberry"] = true,
	["Cauliflower"] = true,
	["Watermelon"] = true,
	["Green Apple"] = true,
	["Avocado"] = true,
	["Banana"] = true,
	["Pineapple"] = true,
	["Kiwi"] = true,
	["Beli Pepper"] = true,
	["Prickly Pear"] = true,
	["Loquato"] = true,
	["Feijoa"] = true,
}

-- 🔘 Toggle no seu hub
v16.Main:AddToggle("ToggleFastAutoCollect", {
	Title = "Collect Fruit Summer Event",
	Description = "Only summer fruits",
	Default = false,
	Callback = function(state)
		autoCollectOptimized = state

		if state and not collectThread then
			local Players = game:GetService("Players")
			local CollectionService = game:GetService("CollectionService")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local player = Players.LocalPlayer
			local Remotes = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Remotes"))
			local collectRemote = Remotes.Crops.Collect

			-- 🌱 Inicia o loop de coleta
			collectThread = task.spawn(function()
				while autoCollectOptimized do
					local tagged = CollectionService:GetTagged("CollectPrompt")

					for _, prompt in ipairs(tagged) do
						local fruitModel = prompt:FindFirstAncestorWhichIsA("Model")
						if not fruitModel or not fruitModel:IsDescendantOf(workspace) then continue end

						local important = prompt:FindFirstAncestor("Important")
						if not important then continue end

						local data = important:FindFirstChild("Data")
						local owner = data and data:FindFirstChild("Owner")
						if not owner then continue end

						-- Verifica se a fruta é sua e está na lista
						if owner.Value == player or owner.Value == player.Name or owner.Value.Name == player.Name then
							local fruitName = fruitModel.Name
							if fruitsToCollect[fruitName] then
								collectRemote.send({fruitModel})
								task.wait(0.05)
							end
						end
					end

					task.wait(0.1)
				end
			end)
		elseif not state and collectThread then
			-- ❌ Cancela o loop corretamente
			task.cancel(collectThread)
			collectThread = nil
		end
	end
})
local autoSellSummer = false
local sellThread = nil

v16.Main:AddToggle("ToggleAutoSellSummer", {
    Title = "Auto Sell Summer Fruit",
    Description = "Sell all summer fruits instantly",
    Default = false,
    Callback = function(state)
        autoSellSummer = state

        if state and not sellThread then
            sellThread = task.spawn(function()
                while autoSellSummer do
                    local args = {
                        [1] = "SubmitAllPlants"
                    }

                    game:GetService("ReplicatedStorage").GameEvents.SummerHarvestRemoteEvent:FireServer(unpack(args))
                    task.wait(1) -- pode ajustar o delay se quiser mais rápido ou mais lento
                end
            end)
        elseif not state and sellThread then
            task.cancel(sellThread)
            sellThread = nil
        end
    end
})
local v22 = Instance.new("ScreenGui");
local v23 = Instance.new("ImageButton");
local v24 = Instance.new("UICorner");
local v25 = Instance.new("ParticleEmitter");
local v26 = game:GetService("TweenService");
v22.Parent = game.CoreGui;
v22.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v23.Parent = v22;
v23.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
v23.BorderSizePixel = 0;
v23.Position = UDim2.new(0.120833337 - 0.1, 0, 0.0952890813 + 0.01, 0);
v23.Size = UDim2.new(0, 50, 0, 50);
v23.Draggable = true;
v23.Image = "http://www.roblox.com/asset/?id=111159100408946";
v24.Parent = v23;
v24.CornerRadius = UDim.new(0, 12);
v25.Parent = v23;
v25.LightEmission = 1;
v25.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
});
v25.Lifetime = NumberRange.new(0.5, 1);
v25.Rate = 0;
v25.Speed = NumberRange.new(5, 10);
v25.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255));
local v47 = v26:Create(v23, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Rotation = 360
});
v23.MouseButton1Down:Connect(function()
    v25.Rate = 100;
    task.delay(1, function()
        v25.Rate = 0;
    end);
    v47:Play();
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game);
    v47.Completed:Connect(function()
        v23.Rotation = 0;
    end);
    local v235 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 60, 0, 60)
    });
    v235:Play();
    v235.Completed:Connect(function()
        local v483 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 50, 0, 50)
        });
        v483:Play();
    end);
end);
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy();
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy();
end
local v22 = Instance.new("ScreenGui");
local v23 = Instance.new("ImageButton");
local v24 = Instance.new("UICorner");
local v25 = Instance.new("ParticleEmitter");
local v26 = game:GetService("TweenService");
v22.Parent = game.CoreGui;
v22.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v23.Parent = v22;
v23.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
v23.BorderSizePixel = 0;
v23.Position = UDim2.new(0.120833337 - 0.1, 0, 0.0952890813 + 0.01, 0);
v23.Size = UDim2.new(0, 50, 0, 50);
v23.Draggable = true;
v23.Image = "http://www.roblox.com/asset/?id=111159100408946";
v24.Parent = v23;
v24.CornerRadius = UDim.new(0, 12);
v25.Parent = v23;
v25.LightEmission = 1;
v25.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
});
v25.Lifetime = NumberRange.new(0.5, 1);
v25.Rate = 0;
v25.Speed = NumberRange.new(5, 10);
v25.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255));
local v47 = v26:Create(v23, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Rotation = 360
});
v23.MouseButton1Down:Connect(function()
    v25.Rate = 100;
    task.delay(1, function()
        v25.Rate = 0;
    end);
    v47:Play();
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game);
    v47.Completed:Connect(function()
        v23.Rotation = 0;
    end);
    local v235 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 60, 0, 60)
    });
    v235:Play();
    v235.Completed:Connect(function()
        local v483 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 50, 0, 50)
        });
        v483:Play();
    end);
end);
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy();
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetsService("ReplicatedStorage").Effect.Container.Respawn:Destroy();
end
