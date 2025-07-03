game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new(0,0));
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
	wait(1);
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
end);

function init()
	if not isfolder("rin") then
		makefolder("rin")
	end
	if not isfile("rin/save.config") then
		writefile("rin/save.config", game.HttpService:JSONEncode({
			["nhuw"] = 50,
			["tnhuw_"] = {},
			["Tnhuw"] = false,
			["AutoBuyabc"] = false,
			["AutoDestroy"] = false,
			["hola"] = {},
			["AutoSellMoonlitCrop"] = false,
			["Lol"] = false
		}))
	end
end
function savesetting()
	init()
	writefile("rin/save.config", game:GetService("HttpService"):JSONEncode(getgenv().Config))
end
if not getgenv()["Config"] then
	getgenv()["Config"] = {}
end
if isfile("rin/save.config") then
	local rf = game.HttpService:JSONDecode(readfile("rin/save.config"))
	for i, v in pairs(rf) do
		getgenv()["Config"][i] = v
	end
else
	getgenv()["Config"] = {
		["nhuw"] = 50,
		["tnhuw_"] = {},
		["Tnhuw"] = false,
		["AutoBuyabc"] = false,
		["AutoDestroy"] = false,
		["hola"] = {},
		["AutoSellMoonlitCrop"] = false,
		["Lol"] = false,
	}
end

local p = require(game:GetService("ReplicatedStorage").Modules.Remotes)
local pp = p.Crops.Collect


function seed_module(v, ...)
	local _v = require(game:GetService("ReplicatedStorage").Data.SeedData)
	local v_ = {
		...
	}
	local id072019 = {}
	for i, v in pairs(v_) do
		local pp = _v[v]
		id072019[#id072019 + 1] = pp[v]
	end
	return unpack(id072019)
end


local format_ = {
	["Seed"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Max Stock: %s | Stock: %s\n", i, v["MaxStock"], v["Stock"])
		end
		return str
	end,
	["Pet"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Stock: %s\n", i, v["Stock"])
		end
		return str
	end,
	["Gear"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Max Stock: %s | Stock: %s\n", i, v["MaxStock"], v["Stock"])
		end
		return str
	end,
	["Event"] = function(tnhw)
		local n = ""
		for i, v in tnhw do
			n = n .. string.format("%s - Max Stock: %s | Stock: %s\n",i,v["MaxStock"],v["Stock"])
		end
		return n
	end,
	["seed_in_backpack"] = {
		["name"] = function(tnhuw)
			local t = string.gsub(tnhuw, "%A+%[(.-)]", "")
			return t:gsub(" Seed", "")
		end,
		["count"] = function(tnhuw)
			return tonumber(string.match(tnhuw, "%[X(%d+)%]"))
		end
	}
}
-- GetAttribute("Pollinated") [Pollinated] Blueberry [0.22kg]

local stock = {
	["Seed"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["SeedStock"]["Stocks"]) do
			stock[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["SeedStock"]["Seed"]
	end,
	["Pet"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["PetEggStock"]["Stocks"]) do
			stock[v["EggName"]] = {
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["PetEggStock"]["Egg"]
	end,
	["Gear"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["GearStock"]["Stocks"]) do
			stock[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["GearStock"]["Gear"]
	end,
	["Event"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local st = {}
		for i, v in pairs(f["EventShopStock"]["Stocks"]) do
			st[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return st, f["EventShopStock"]["ShopSeed"]
	end
}

local hello = {
	"Daffodil",
	"Coconut",
	"Tomato",
	"Apple",
	"Blueberry",
	"Strawberry",
	"Watermelon",
	"Mushroom",
	"Pumpkin",
	"Pepper",
	"Cacao",
	"Corn",
	"Dragon Fruit",
	"Orange Tulip",
	"Carrot",
	"Mango",
	"Cactus",
	"Beanstalk",
	"Grape",
	"Bamboo"
}

local destroy = {
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
}

local shop = {
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
}	

local MyFarm
for _2 , v3 in pairs(workspace.Farm:GetChildren()) do
	if v3.Name == "Farm" then
		if v3.Important.Data.Owner.Value == game.Players.LocalPlayer.Name then
			print("adsads")
			MyFarm = v3
		end
	end
end

function randompt(part)
    local size = part.Size
    local localX = (math.random() - 0.5) * size.X
    local localY = (math.random() - 0.5) * size.Y
    local localZ = (math.random() - 0.5) * size.Z
    local localOffset = Vector3.new(localX, localY, localZ)
    local worldPosition = part.CFrame:PointToWorldSpace(localOffset)
    local rotX = math.rad(math.random(0, 360))
    local rotY = math.rad(math.random(0, 360))
    local rotZ = math.rad(math.random(0, 360))
    local randomRotation = CFrame.Angles(rotX, rotY, rotZ)
    return CFrame.new(worldPosition) * randomRotation
end


function plant(tn)
	if game.Players.LocalPlayer.Character:FindFirstChild(tn) then
		local part = MyFarm.Important.Plant_Locations:GetChildren()[math.random(1, 2)]
		local cf = randompt(part)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cf * CFrame.new(0, 10, 0)
		game:GetService("ReplicatedStorage").GameEvents.Plant_RE:FireServer(Vector3.new(cf.X, cf.Y, cf.Z), format_["seed_in_backpack"]["name"](tn))
		wait(0.1)
		return
	elseif game.Players.LocalPlayer.Backpack:FindFirstChild(tn) then
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(tn))
		return plant(tn)
	end
end

function checkhasseed()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(v.Name:lower(), "seed") then
			return v
		end
	end
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if string.find(v.Name:lower(), "seed") then
			return v
		end
	end
	return
end

function checkhasmoonlit()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(v.Name:lower(), "pollinated") then
			return v
		end
	end
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if string.find(v.Name:lower(), "pollinated") then
			return v
		end
	end
	return
end

spawn(function()
	while wait() do
		spawn(function()
			if getgenv()["Config"].AutoBuyabc then
				local stock_ = stock["Seed"]()
				for n1, n2 in pairs(getgenv()["Config"]["tnhuw_"]) do
					if stock_[n1] and stock_[n1]["Stock"] > 0 then
						game:GetService("ReplicatedStorage").GameEvents.BuySeedStock:FireServer(n1)
					end
				end
			end
		end)
	end
end)

-- local args = {
--     [1] = Vector3.new(44.17329788208008, -13.372404098510742, 271.4956970214844),
--     [2] = Vector3.new(-0.3491062819957733, 0.1335812509059906, 0.9275132417678833)
-- }


-- --game:GetService("Players").LocalPlayer.Character:FindFirstChild("Acidum Rifle").M1:FireServer(unpack(args))
-- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(args[1])
--game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
-- while wait() do
-- 	if game.Workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) then
-- 		local gg = game.Workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name)
-- 		gg:SetAttribute("AllCooldown", 1)
-- 		gg:SetAttribute("SwordCooldown", 1)
-- 	end
-- end


-- getnearestplayer = function()
-- 	local hh, gg = math.huge, nil
-- 	for i, v in pairs(game.Players:GetPlayers()) do
-- 			if v.Name ~= game.Players.LocalPlayer.Name then
-- 				if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < hh then
-- 					hh = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
-- 					gg = v.Character.HumanoidRootPart
-- 				end
-- 			end
-- 		end
-- 	return gg
-- end

-- spawn(function()
-- 	while wait() do
-- 		if getnearestplayer() then
-- 			print("oO")
-- 			local args = {
-- 				[1] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,
-- 				[2] = getnearestplayer().HumanoidRootPart
-- 			}
-- 			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Acidum Rifle").M1:FireServer(unpack(args))
-- 		end
-- 	end
-- end)

--Carrot Seed [X6]
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
	Title = "Apple hub [ ☀️🏖️]",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 320),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.End
})
local t = Window:AddTab({
	Title = "Farming",
	Icon = ""
})
local sv = Window:AddTab({
	Title = "Shop",
	Icon = ""
})
local st = Window:AddTab({
	Title = "Config",
	Icon = ""
})
local h = Window:AddTab({
	Title = "Event",
	Icon = ""


local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Collect",
	Description = "Sell and Collect ",
	Default = getgenv()["Config"].Tnhuw ,
	Callback = function(state)
		getgenv()["Config"].Tnhuw = state
		savesetting()
	end 
})

local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Fast Collect",
	Description = "turn on if has good device",
	Default = getgenv()["Config"].Tnhuw ,
	Callback = function(state)
		getgenv()["Config"].Lol = state
		savesetting()
	end 
})


local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Plant All Seed",
	Description = "",
	Default = getgenv()["Config"].AutoSellMoonlitCrop,
	Callback = function(state)
		getgenv()["Config"].AutoPlant = state
		savesetting()
	end 
})
local Slider = t:AddSlider("Slider", 
{
	Title = "Select quantity to sell",
	Description = "",
	Default = getgenv()["Config"].nhuw,
	Min = 1,
	Max = 200,
	Rounding = 1,
	Callback = function(Value)
		getgenv()["Config"].nhuw = Value
		savesetting()
	end
})
local chiu = {}
if #getgenv()["Config"]["tnhuw_"] > 0 then
	for i, v in pairs(getgenv()["Config"]["tnhuw_"]) do
		table.insert(chiu, i)
	end
end
local farmingSection = sv:AddSection("[ BUY ]")
local MultiDropdown = sv:AddDropdown("MultiDropdown", {
	Title = "Select seed to want buy",
	Description = "",
	Values = shop,
	Multi = true,
	Default = getgenv()["Config"]["tnhuw_"],
})

MultiDropdown:OnChanged(function(Value)
	getgenv()["Config"]["tnhuw_"] = Value
	savesetting()
end)

local Toggle = sv:AddToggle("MyToggle", 
{
	Title = "Auto Buy Seed",
	Description = "",
	Default = getgenv()["Config"].AutoBuyabc,
	Callback = function(state)
		getgenv()["Config"].AutoBuyabc = state
		savesetting()
	end 
})

local lll = st:AddDropdown("MultiDropdown", {
	Title = "Select seed to want destroy",
	Description = "",
	Values = destroy,
	Multi = true,
	Default = getgenv()["Config"]["hola"],
})
lll:OnChanged(function(Value)
	getgenv()["Config"]["hola"] = Value
	savesetting()
end)
local Toggle = st:AddToggle("MyToggle", 
{
	Title = "Auto Destroy Plant",
	Description = "",
	Default = getgenv()["Config"].AutoDestroy,
	Callback = function(state)
		getgenv()["Config"].AutoDestroy = state
		savesetting()
	end 
})
getgenv().IsBusy = false

topos = function(v)
	local t = game:GetService("TweenService")
	local tt = TweenInfo.new((v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 300, Enum.EasingStyle.Linear)
	local gg = t:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tt, {
		CFrame = v
	})
	gg:Play()
end
-- dung hoi tai sao lai dung de quy
function getparent(ins)
	if not ins or typeof(ins) ~= "Instance" then
		return
	elseif ins.Name == "Important" then
		return ins
	else
		return getparent(ins.Parent)
	end
end

function getabcishavestable()
	local lol = {}
	local gg = game:GetService("CollectionService"):GetTagged("CollectPrompt")
	if #gg > 0 then
		for i, v in pairs(gg) do
			local troi = v:FindFirstAncestor("Important")
			if troi and troi.Data.Owner.Value == game.Players.LocalPlayer.Name then
				lol[#lol + 1] = v.Parent.Parent
			end
		end
	end
	return lol 
end
local p = require(game:GetService("ReplicatedStorage").Modules.Remotes)
local pp = p.Crops.Collect
for i, v in pairs(getabcishavestable()) do
	pp.send({v})
end
function idk()
	for i, v in pairs(MyFarm.Important.Plants_Physical:GetChildren()) do
		if getgenv()["Config"]["hola"][v.Name] then
			return v
		end
	end
	return
end
-- local args = {
--     [1] = workspace.Farm.Farm.Important.Plants_Physical:GetChildren()[17]:GetChildren()[11]
-- }

-- game:GetService("ReplicatedStorage").GameEvents.Remove_Item:FireServer(unpack(args))
function getcrop()
	local tnhu = {}
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if not string.find(v.Name:lower(), "seed") and not string.find(v.Name:lower(), "shovel") then
			tnhu[#tnhu+1] = v
		end
	end
	return tnhu
end
function honeycollectable()
	return require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()["HoneyMachine"]["PlantWeight"] >= 0
end
function gethoney()
	return require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()["SpecialCurrency"]["Honey"]
end
spawn(function()
	while wait() do
		--pcall(function()
			if getgenv()["Config"].AutoSellMoonlitCrop and checkhasmoonlit() then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-105.984184, 4.00001335, -9.94348621, 0.311976552, -3.36578376e-10, 0.950089812, -2.16052012e-08, 1, 7.44865858e-09, -0.950089812, -2.28506885e-08, 0.311976552)
				wait(0.5)
				if checkhasmoonlit() and checkhasmoonlit().Parent ~= game.Players.LocalPlayer.Character then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(checkhasmoonlit())
				end
				game:GetService("ReplicatedStorage").GameEvents.HoneyMachineService_RE:FireServer("MachineInteract")
			elseif getgenv()["Config"].AutoDestroy and idk() then
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shovel [Destroy Plants]") then
					game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(game:GetService("Players").LocalPlayer.Backpack["Shovel [Destroy Plants]"])
				end
				local p = idk()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p:FindFirstChildOfClass("Part").CFrame
				game:GetService("ReplicatedStorage").GameEvents.Remove_Item:FireServer(p:FindFirstChildOfClass("Part"))
			elseif getgenv()["Config"].AutoPlant and checkhasseed() then
				local ins = checkhasseed()
				plant(ins.Name)
			elseif getgenv()["Config"].Tnhuw then
				if #getcrop() >= tonumber(getgenv()["Config"].nhuw) then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)
					game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
					wait(0.1)
				else
					if #getabcishavestable() > 0 then
						for i, v in pairs(getabcishavestable()) do
							if not getgenv()["Config"].Tnhuw or #getcrop() >= tonumber(getgenv()["Config"].nhuw) then
								continue
							end
							pp.send({
								v
							})
							if not getgenv()["Config"].Lol then
								wait()
							end
						end
						-- pp.send({
						-- 	(unpack or table.unpack)(getabcishavestable())
						-- }) -- so lag
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)
						game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
						wait(0.1)
					end
				end
			end
		--end)
	end
end)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer:WaitForChild("Backpack")

local selectedSeed = nil
local autoPlanting = false
local dropdownObject = nil
local MyFarm = nil

-- 🔎 Detectar a fazenda do jogador
for _, farm in pairs(workspace.Farm:GetChildren()) do
    if farm.Name == "Farm" and farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data") then
        local owner = farm.Important.Data:FindFirstChild("Owner")
        if owner and (owner.Value == LocalPlayer or owner.Value == LocalPlayer.Name or (owner.Value.Name == LocalPlayer.Name)) then
            MyFarm = farm
            break
        end
    end
end

-- 🎯 Gera ponto aleatório no chão da fazenda
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

-- 🌱 Extrai nome limpo da seed
local function extractSeedName(itemName)
    local cleanName = itemName:gsub("%[X%d+%]", ""):gsub("%s+$", "")
    local baseName = cleanName:gsub(" Seed$", ""):gsub("%s+$", "")
    return baseName
end

-- 🔍 Encontra todas as seeds reais no inventário
local function findSeedsInInventory()
    local seedsFound = {}

    for _, item in pairs(Backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name:find("Seed") and item.Name:find("%[X%d+%]") then
            local seedName = extractSeedName(item.Name)
            if seedName and not table.find(seedsFound, seedName) then
                table.insert(seedsFound, seedName)
            end
        end
    end

    return seedsFound
end

-- 🔁 Atualiza o dropdown e mantém ordem dos elementos
local function RefreshUI()
    local seedList = findSeedsInInventory()
    if #seedList == 0 then
        warn("Nenhuma seed encontrada.")
        return
    end

    -- Remove dropdown antigo
    if dropdownObject then
        dropdownObject:Destroy()
        dropdownObject = nil
    end

    dropdownObject = t:AddDropdown("SeedSelector", {
        Title = "Select the seed to plant",
        Description = "",
        Values = seedList,
        Default = seedList[1],
        Callback = function(value)
            selectedSeed = value
        end
    })

    -- Toggle só uma vez
    if not t._autoToggle then
        t._autoToggle = t:AddToggle("ToggleAutoPlant", {
            Title = "Auto Plant",
            Default = false,
            Callback = function(state)
                autoPlanting = state
            end
        })
    end

    -- Botão só uma vez
    if not t._refreshButton then
        t._refreshButton = t:AddButton({
            Title = "🔄 Refresh List",
            Description = "",
            Callback = RefreshUI
        })
    end
end

-- 🧰 Localiza seed no personagem ou mochila
local function getSeedTool()
    local char = LocalPlayer.Character

    for _, item in pairs(char:GetChildren()) do
        if item:IsA("Tool") and extractSeedName(item.Name):lower() == selectedSeed:lower() then
            return item
        end
    end

    for _, item in pairs(Backpack:GetChildren()) do
        if item:IsA("Tool") and extractSeedName(item.Name):lower() == selectedSeed:lower() then
            return item
        end
    end

    return nil
end

-- 🚀 Planta a seed
local function plantSeed(tool)
    if not tool or not MyFarm then return end

    local plantLocations = MyFarm.Important:FindFirstChild("Plant_Locations")
    if not plantLocations then return end

    local parts = plantLocations:GetChildren()
    if #parts == 0 then return end

    local targetPart = parts[math.random(1, #parts)]
    local cf = randompt(targetPart)
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = cf

    task.wait(0.3)

    local fruitName = extractSeedName(tool.Name)
    ReplicatedStorage.GameEvents.Plant_RE:FireServer(Vector3.new(cf.X, cf.Y, cf.Z), fruitName)
    print("Plantou seed:", fruitName)
end

-- 🔁 Loop de auto plant
task.spawn(function()
    while true do
        if autoPlanting and selectedSeed and MyFarm then
            local tool = getSeedTool()
            if tool then
                if Backpack:FindFirstChild(tool.Name) then
                    LocalPlayer.Character.Humanoid:EquipTool(tool)
                    task.wait(0.1)
                end

                if LocalPlayer.Character:FindFirstChild(tool.Name) then
                    plantSeed(tool)
                end
            end
        end
        task.wait(0.3)
    end
end)

-- 🟢 Inicializa UI
RefreshUI()
local farmingSection = h:AddSection("[ SUMMER EVENT 🏖️]")
local autoCollectOptimized = false
local collectThread = nil

local fruitsToCollect = {
	["Tomato"] = true,
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
	["Strawberry"] = true,
	["Suga Apple"] = true,
}

-- 🔘 Toggle no seu hub
local Toggle = h:AddToggle("MyToggle", 
{
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
								task.wait(0.01)
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

local Toggle = h:AddToggle("MyToggle", 
{
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
                    task.wait(0) -- pode ajustar o delay se quiser mais rápido ou mais lento
                end
            end)
        elseif not state and sellThread then
            task.cancel(sellThread)
            sellThread = nil
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyEvent = ReplicatedStorage.GameEvents.BuyEventShopStock

-- Lista de itens disponíveis
local shopItems = {
    "Summer Seed Pack",
    "Delphinium Seed",
    "Lily Of the Valley Seed",
    "Traveler's Fruit Seed",
    "Mutation Spray Burnt",
    "Oasis Egg Hamster"
}

local selectedItem = shopItems[1]
local autoBuyEventEnabled = false

-- Dropdown
t:AddDropdown("AutoBuyEventDropdown", {
    Title = "Auto Buy Event Item",
    Description = "Select To Buy",
    Values = shopItems,
    Default = shopItems[1],
    Callback = function(selected)
        selectedItem = selected
        if autoBuyEventEnabled and selectedItem then
            local parsed = selectedItem:match("^(.-) Seed") or selectedItem:match("^(.-) Egg") or selectedItem:match("^(.-) Spray") or selectedItem:match("^(.-) Pack") or selectedItem
            buyEvent:FireServer(parsed)
            print("Comprando evento:", parsed)
        end
    end
})

-- Toggle
t:AddToggle("AutoBuyEventToggle", {
    Title = "Auto Buy Event",
    Default = false,
    Callback = function(state)
        autoBuyEventEnabled = state
        if autoBuyEventEnabled and selectedItem then
            local parsed = selectedItem:match("^(.-) Seed") or selectedItem:match("^(.-) Egg") or selectedItem:match("^(.-) Spray") or selectedItem:match("^(.-) Pack") or selectedItem
            buyEvent:FireServer(parsed)
            print("nill:", parsed)
        end
    end
})
-- Tabela com os nomes visíveis
local shop = {
    "Seed Shop",
    "Sell",
    "Gear Shop",
    "Egg"
}

-- Mapeamento dos nomes para objetos reais no workspace
local teleportPoints = {
    ["Seed Shop"] = workspace.Tutorial_Points.Tutorial_Point_1,
    ["Sell"] = workspace.Tutorial_Points.Tutorial_Point_2,
    ["Gear Shop"] = workspace.Tutorial_Points.Tutorial_Point_3,
    ["Egg"] = workspace.Tutorial_Points.Tutorial_Point_4,
}

-- Dropdown simples com Callback direto
st:AddDropdown("TeleportDropdown", {
    Title = "Select to Tp",
    Description = "",
    Values = shop,
    Multi = false,
    Callback = function(selected)
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")

        local target = teleportPoints[selected]
        if target and hrp then
            hrp.CFrame = target.CFrame
        else
            warn("nil")
        end
    end
})
-- Lista de gears disponíveis
local gearList = {
    "Watering Can",
    "Trowel",
    "Recall Wrench",
    "Basic Sprinkler",
    "Advanced Sprinkler",
    "Godly Sprinkler",
    "Magnifying Glass",
    "Tanning Mirror",
    "Cleaning Spray",
    "Master Sprinkler",
    "Favorite Tool",
    "Harvest Tool",
    "Friendship Pot"
}

local selectedGears = {}
local autoBuyEnabled = false
local buyThread = nil

-- Dropdown com seleção múltipla
sv:AddDropdown("AutoBuyGearDropdown", {
    Title = "Auto Buy Gear",
    Description = "Select Gears to buy",
    Values = gearList,
    Multi = true,
    Default = {},
    Callback = function(gears)
        selectedGears = gears or {}
    end
})

-- Toggle para ativar/desativar compra automática
sv:AddToggle("AutoBuyGearToggle", {
    Title = "Auto Buy Gear",
    Default = false,
    Callback = function(state)
        autoBuyEnabled = state

        if autoBuyEnabled and not buyThread then
            buyThread = task.spawn(function()
                while autoBuyEnabled do
                    for _, gearName in ipairs(selectedGears) do
                        local args = { gearName }
                        game:GetService("ReplicatedStorage").GameEvents.BuyGearStock:FireServer(unpack(args))
                        print("Comprando gear:", gearName)
                        task.wait(0.5) -- evitar spamar rápido demais
                    end
                    task.wait(2) -- espera antes do próximo ciclo
                end
            end)
        elseif not autoBuyEnabled and buyThread then
            task.cancel(buyThread)
            buyThread = nil
        end
    end
})
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Cria ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ToggleButtonGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

-- Cria botão pequeno
local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 40, 0, 40)
button.Position = UDim2.new(0, 10, 0, 10) -- posição inicial
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.BackgroundTransparency = 0.2
button.AutoButtonColor = true
button.Image = "rbxassetid://132715149837734"
button.Parent = screenGui

-- Arredondar bordas
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = button

-- Função para simular tecla End
local function pressEndKey()
    local vm = game:GetService("VirtualInputManager")
    vm:SendKeyEvent(true, Enum.KeyCode.End, false, game)
    vm:SendKeyEvent(false, Enum.KeyCode.End, false, game)
end

-- Executa o toggle logo ao rodar o script
pressEndKey()

-- Drag logic
local dragging = false
local dragInput, dragStart, startPos

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = button.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        button.Position = newPos
    end
end)

-- Clique do botão: simula tecla End + animação
button.MouseButton1Click:Connect(function()
    pressEndKey()
    local grow = TweenService:Create(button, TweenInfo.new(0.15), {Size = UDim2.new(0, 50, 0, 50)})
    local shrink = TweenService:Create(button, TweenInfo.new(0.15), {Size = UDim2.new(0, 40, 0, 40)})
    grow:Play()
    grow.Completed:Connect(function()
        shrink:Play()
    end)
end)
local RunService = game:GetService("RunService")

-- Cria o GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSDisplay"
screenGui.IgnoreGuiInset = true -- IMPORTANTE para grudar no topo real da tela
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

-- Texto do FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 200, 0, 30)
fpsLabel.Position = UDim2.new(1, -210, 0, 0) -- canto superior direito
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- vermelho
fpsLabel.TextSize = 20
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Right
fpsLabel.Text = "FPS: ..."
fpsLabel.Parent = screenGui

-- Atualiza FPS
local lastUpdate = tick()
local frameCount = 0

RunService.RenderStepped:Connect(function()
	frameCount += 1
	local now = tick()
	if now - lastUpdate >= 1 then
		local fps = math.floor(frameCount / (now - lastUpdate))
		fpsLabel.Text = "FPS: " .. fps
		frameCount = 0
		lastUpdate = now
	end
end)
local speeds = {"50", "100", "200", "300"}
local selectedSpeed = 50
local speedEnabled = false

-- Dropdown de velocidades
st:AddDropdown("SpeedDropdown", {
    Title = "Select Speed",
    Description = "",
    Values = speeds,
    Multi = false,
    Default = "50",
    Callback = function(value)
        selectedSpeed = tonumber(value)
        if speedEnabled then
            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = selectedSpeed
            end
        end
    end
})
-- Toggle para ativar/desativar a velocidade
st:AddToggle("SpeedToggle", {
    Title = "Active Speed",
    Default = false,
    Callback = function(state)
        speedEnabled = state
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if state then
                humanoid.WalkSpeed = selectedSpeed
            else
                humanoid.WalkSpeed = 16 -- Velocidade padrão
            end
        end
    end
})
st:AddButton({
    Title = "FPS Boost",
    Description = "",
    Callback = function()
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.FogEnd = 1e10
        lighting.FogStart = 0
        lighting.Brightness = 1

        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 1
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
        end

        for _, obj in pairs(game:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.Plastic
                obj.Reflectance = 0
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj.Enabled = false
            elseif obj:IsA("Explosion") then
                obj.BlastPressure = 0
                obj.BlastRadius = 0
            end
        end

        print("FPS Boost ativado com sucesso.")
    end
})
local sectionJobid = st:AddSection("[ SERVER: ]");

local currentJobId = ""

-- INPUT do JobId
local jobInput = st:AddInput("JobInput", {
    Title = "JobId",
    Default = "",
    Placeholder = "Digite o JobId aqui",
    Numeric = false,
    Finished = false,
    Callback = function(text)
        currentJobId = text
        print("JobId:", currentJobId)
    end
})

-- BOTÃO: Teleportar para o JobId
st:AddButton({
    Title = "Teleport",
    Description = "",
    Callback = function()
        if currentJobId ~= "" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, currentJobId, game.Players.LocalPlayer)
        else
            warn("Digite um JobId válido primeiro!")
        end
    end
})

-- BOTÃO: Limpar o campo
st:AddButton({
    Title = "Clear Job Id",
    Description = "",
    Callback = function()
        currentJobId = ""
        jobInput:SetValue("") -- limpa visualmente o input
    end
})
st:AddButton({
    Title = "Hop Server",
    Description = "",
    Callback = function()
        local Players = game:GetService("Players")
        local TeleportService = game:GetService("TeleportService")
        local HttpService = game:GetService("HttpService")
        local Player = Players.LocalPlayer

        -- Criar mensagem acima da tela
        local gui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
        gui.Name = "HopServerMsg"
        gui.ResetOnSpawn = false

        local label = Instance.new("TextLabel", gui)
        label.Size = UDim2.new(0, 320, 0, 28)
        label.Position = UDim2.new(0.5, -160, 0.08, 0) -- Mais alto na tela
        label.BackgroundTransparency = 1
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold
        label.TextColor3 = Color3.fromRGB(255, 0, 0)
        label.Text = "HOP SERVER IN: 10 segundos..."

        -- Contagem regressiva
        for i = 9, 1, -1 do
            wait(1)
            label.Text = "HOP SERVER IN: " .. i .. " segundos..."
        end

        label.Text = "HOPPING..."

        wait(1)

        -- Função para tentar hop
        local function tryHop()
            local PlaceId = game.PlaceId
            local success, result = pcall(function()
                return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
            end)

            if success and result then
                for _, server in pairs(result) do
                    if server.playing < server.maxPlayers and server.id ~= game.JobId then
                        local teleported, msg = pcall(function()
                            TeleportService:TeleportToPlaceInstance(PlaceId, server.id, Player)
                        end)

                        if teleported then
                            return true
                        end
                    end
                end
            end
            return false
        end

        -- Tenta até conseguir teleportar
        local retries = 0
        while not tryHop() and retries < 10 do
            retries += 1
            label.Text = "Tentando novamente... ("..retries..")"
            wait(2)
        end

        -- Se falhar todas tentativas
        if retries >= 10 then
            label.Text = "Hop falhou após 10 tentativas."
            wait(3)
            gui:Destroy()
        end
    end
})
